


im = imread('C:\Users\hang0\Desktop\datasetDV\255.gif');
mask = [1 1 1; 1 1 1; 1 1 1];
num_coef = 20;
%{
num_coef = 20;

im = quantize_and_reverse(im);
b = boundary(im, mask);
[x0, y0] = find_a_starting_point(b);
P = bwtraceboundary(b, [x0, y0], 'N', 8, Inf, 'clockwise');

num_BP = size(P,1);

U = zeros(num_BP, 1);
U(:) = P(:,1) + P(:,2)*1j;
U = U';  %1xnum_BP


Z(1, :) = fft(U(:), num_coef);

for j=1: num_coef
    magnitudes(1, j) = sqrt( real(Z(1,j))^2 + imag(Z(1,j))^2 );
end
magnitudes(1, :);

%normalize
magnitudes_norm(1,:) = magnitudes(1,3:num_coef)./(magnitudes(1,2));
%magnitudes_kept(i,:) = magnitudes_norm(i, 1: num_coef-2-ceil(num_coef/4));
%}
[B,L,N] = bwboundaries(im);

imshow(im); hold on;
for k=1:length(B),
   boundary = B{k};
   if(k > N)
     plot(boundary(:,2), boundary(:,1), 'g','LineWidth',2);
     
   else
     plot(boundary(:,2), boundary(:,1), 'r','LineWidth',2);
   end
end

num_BP = size(B{1},1);

new =B{1};


U = zeros(num_BP, 1);
U(:) = new(:,1) + new(:,2)*1j;
U = U';  %1xnum_BP


Z(1, :) = fft(U(:), num_coef);

for j=1: num_coef
    magnitudes(1, j) = sqrt( real(Z(1,j))^2 + imag(Z(1,j))^2 );
end
magnitudes(1, :);

%normalize
magnitudes_norm(1,:) = magnitudes(1,3:num_coef)./(magnitudes(1,2));
%magnitudes_kept(i,:) = magnitudes_norm(i, 1: num_coef-2-ceil(num_coef/4));