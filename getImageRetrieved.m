function getImageRetrieved(numOfReturnedImages, queryImageFeatureVector, dataset, metric, queryImage,axes2,axes1,edit1)


disp(dataset);
euclidean = zeros(size(dataset, 2), 1);
if (metric == 1)
    % compute euclidean distance
    disp("Fourier")
    for k = 1:size(dataset, 2)

        euclidean(k) = getEuclidianDistance( dataset(k).featFourier , queryImageFeatureVector);
    end

end


[distance, idx] = sort(euclidean);
sorted=idx(1:numOfReturnedImages);
dis =distance(1:size(dataset,2));

disp(dis);
arrayfun(@cla, findall(0, 'type', 'axes'));
delete(findall(findall(gcf,'Type','axe'),'Type','text'))

apple = 0;
bird =0;
butterfly =0;
cow =0;
chopper =0;
cup =0;
device2 =0;
device6 =0;
dog=0;
flatfish =0;
frog =0;
hat =0;
horseshoe =0;
imfish=0;
personalcar=0;
seasnake =0;
stef =0;
true =0;




for m =1:numOfReturnedImages
    imfile =dataset(sorted(m)).imageName;
    label = dataset(sorted(m)).label;
    dis1= 1.0-dis(m);
    subplot(4,5,m);
    imshow(imfile);
    str1 =['Label=',label];
    str='Similarity=';
    
    title({str,dis1,str1});
    
    if m >=2
        
        if strcmp(label,dataset(sorted(1)).label)
            true =true +1;
        end
        
        if strcmp(label,'Apple')
            apple = apple+1;
        elseif strcmp(label,'Bird')
            bird = bird +1;
        elseif strcmp(label,'Butterfly')
            butterfly = butterfly +1;
        elseif strcmp(label,'Cow')
            cow = cow +1;
        elseif strcmp(label,'Chopper')
            chopper = chopper +1;
        elseif strcmp(label,'Cup')
            cup = cup +1;
        elseif strcmp(label,'Device2')
            device2 = device2 +1;
        elseif strcmp(label,'Device6')
            device6 = device6 +1;
        elseif strcmp(label,'Dog')
            dog = dog +1;         
        elseif strcmp(label,'Flatfish')
            flatfish = flatfish +1;
        elseif strcmp(label,'Frog')
            frog = frog +1;
        elseif strcmp(label,'Hat')
            hat = hat +1;
        elseif strcmp(label,'Horseshoe')
            horseshoe = horseshoe +1;
        elseif strcmp(label,'Imfish')
            imfish = imfish +1;
        elseif strcmp(label,'PersonalCar')
            personalcar = personalcar +1;
        elseif strcmp(label,'Seasnake')
            seasnake = seasnake +1;
        elseif strcmp(label,'Stef')
            stef = stef +1;
        
        end
    end
end


X =[apple bird butterfly cow chopper cup device2 device6 dog flatfish frog hat horseshoe imfish personalcar seasnake stef];
L ={sprintf('Apple: (%.02f%%)',apple/(numOfReturnedImages-1)*100), ...
    sprintf('Bird: (%.02f%%)',bird/(numOfReturnedImages-1)*100), ...
    sprintf('Butterfly: (%.02f%%)',butterfly/(numOfReturnedImages-1)*100), ...
    sprintf('Cow: (%.02f%%)',cow/(numOfReturnedImages-1)*100), ...
    sprintf('Chopper: (%.02f%%)',chopper/(numOfReturnedImages-1)*100), ...
    sprintf('Cup: (%.02f%%)',cup/(numOfReturnedImages-1)*100), ...
    sprintf('Device2: (%.02f%%)',device2/(numOfReturnedImages-1)*100), ...
    sprintf('Device6: (%.02f%%)',device6/(numOfReturnedImages-1)*100), ...
    sprintf('Dog: (%.02f%%)',dog/(numOfReturnedImages-1)*100), ...
    sprintf('Flatfish: (%.02f%%)',flatfish/(numOfReturnedImages-1)*100), ...
    sprintf('Frog: (%.02f%%)',frog/(numOfReturnedImages-1)*100), ...
    sprintf('Hat: (%.02f%%)',hat/(numOfReturnedImages-1)*100), ...
    sprintf('Horseshoe: (%.02f%%)',horseshoe/(numOfReturnedImages-1)*100), ...
    sprintf('Imfish: (%.02f%%)',imfish/(numOfReturnedImages-1)*100), ...
    sprintf('PersonalCar: (%.02f%%)',personalcar/(numOfReturnedImages-1)*100), ...
    sprintf('Seasnake: (%.02f%%)',seasnake/(numOfReturnedImages-1)*100), ...
    sprintf('Stef: (%.02f%%)',stef/(numOfReturnedImages-1)*100)};
    
figure(1),pie(X,L);title('Precision');


set(edit1,'String',{sprintf('Precision: %.02f%%, Recall_Rate: %.02f%%',true/(numOfReturnedImages-1)*100,true/20*100)});
end

%{
load('database_cbir.mat', 'imageDatabase');
imNum = length(imageDatabase);
hello = imageDatabase(1).featHSV;

if metric == 'HSV'
    queryFeature = getColourHistHSV(queryImage);  
    disp(hello);
    for i=1:imNum        
        datasetFeature = imageDatabase(i).featHSV;
        euclidianDistance(i) = getEuclidianDistance(queryFeature, datasetFeature);        
    end   
end

if retrievalMethod == 'RGB'
    queryFeature = getColourHistRGB(queryImage);
    disp(hello);
    for i=1:imNum        
        datasetFeature = imageDatabase(i).featHSV;
        euclidianDistance(i) = getEuclidianDistance(queryFeature, datasetFeature);        
    end  
end

if retrievalMethod == 'CNN'
    queryFeature = getCNNFeatureVector(queryImage);
    disp(hello);
    for i=1:imNum        
        datasetFeature = imageDatabase(i).featHSV;
        euclidianDistance(i) = getEuclidianDistance(queryFeature, datasetFeature);        
    end  
end

[distance, idx] = sort (dist);

imagesretrieved = idx(1:10);

for j=1:10
    id = idList(j) ;
    imfile = imageDatabase(idList(j)).imageName ;
    label = imageDatabase(id).label;
    
    str = sprintf('%d',label);  str =[ '  Label = ' str] ;
    subplot(4,3,j) , imshow(imfile) , title(str) ;
end


end
%}