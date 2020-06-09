function [FV,BW,complex_contour]=getFourier(filename)


fmax= 100;
% Read the image and its metadata, and define the resample points, umax
d=imfinfo(filename);
[I,map] = imread(filename);
umax=512;


% Find the object boundaries in the image
if d.ColorType(1)=='i'
    I=double(I);
    map1=map(:,1);
    map2=map(:,2);
    map3=map(:,3);
    I2(:,:,1)=map1(I+1);
    I2(:,:,2)=map2(I+1);
    I2(:,:,3)=map3(I+1);
    I=uint8(round(I2*255));
end

[r,c,h]=size(I);

switch h
    case {1}
        BW = im2bw(I, graythresh(I));
    case {3}
        for i=1:3
            BW(:,:,i) = im2bw(I(:,:,i), graythresh(I(:,:,i)));
        end
        BW=BW(:,:,1)&BW(:,:,2)&BW(:,:,3);
end

[B,L,N] = bwboundaries(BW);


% Find the longest contour and obtain the centroid and perimeter of the
% shape
len=0;
for i=1:N
    boundary = B{i};
    if length(boundary)>len
        len=length(boundary);
        contour=boundary;
        idx=i;
    end   
end

L2=zeros(size(L));
coords=find(L==idx);
L2(coords)=1;
L2=imfill(L2);

s=regionprops(L2,'Centroid','Perimeter','Area');
centroid=s.Centroid;
perimeter=s.Perimeter;
arcstep=perimeter/(umax-1);


% Fix the starting point of the contour to the point with the longest
% distance from the centroid
contour(:,3)=(contour(:,1)-centroid(2)).^2+(contour(:,2)-centroid(1)).^2;
[dummy,idc]=max(contour(:,3));
idc2=len-idc+1;
ordered_contour=[contour(idc:len-1,:); contour(1:idc-1,:); contour(idc,:)];


% Resample the boundary points to umax so that all boundaries have the same
% length prior to transformation
perims(1)=sqrt(sum((ordered_contour(1,1:2)-ordered_contour(2,1:2)).^2));
for i=2:len-1
    perims(i)=perims(i-1)+sqrt(sum((ordered_contour(i,1:2)-ordered_contour(i+1,1:2)).^2));
end
perims(len)=perims(len-1)+sqrt(sum((ordered_contour(len,1:2)-ordered_contour(1,1:2)).^2));
perima=arcstep*(1:umax-1)';

sampled_contour=zeros(umax,3);
for i=1:umax-1
    error=perims-perima(i);
    [dummy,idx(i)]=min(abs(error));
    sampled_contour(i,:)=ordered_contour(idx(i),:);
end
sampled_contour(umax,:)=ordered_contour(idx(1),:);
complex_contour=sampled_contour(:,2)+j*sampled_contour(:,1);


% Represent the sampled boundary points in terms of distance from the centroid
cdistance=sqrt((sampled_contour(:,1)-centroid(2)).^2+(sampled_contour(:,2)-centroid(1)).^2)';
cangle=atan2((sampled_contour(:,1)-centroid(2)),(sampled_contour(:,2)-centroid(1)))';


% Apply the Fourier Transform on the boundary points and obtain the feature vector
Cdistance=fft(cdistance);

FV=abs(Cdistance(2:fmax))/abs(Cdistance(1));

%{
% Reconstruct shapes represented by the FV (only for illustration
% purpose)
Cdistance_hat=Cdistance;
Cdistance_hat(fmax+1:end-fmax+1)=0;

cdistance_hat=ifft(Cdistance_hat);

sampled_contour_hat(:,1)=cdistance_hat.*sin(cangle)+centroid(2);
sampled_contour_hat(:,2)=cdistance_hat.*cos(cangle)+centroid(1);
complex_contour_hat=sampled_contour_hat(:,2)+j*sampled_contour_hat(:,1);

figure
subplot (1,2,1)
imshow(ones(size(BW)));
hold on;   
plot(complex_contour,'r','LineWidth',2);
title('Actual Shape')
subplot (1,2,2)
imshow(ones(size(BW)));
hold on;   
plot(complex_contour_hat,'b','LineWidth',2);
title('Reconstructed Shape')

 %} 