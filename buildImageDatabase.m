function imageDatabase = buildImageDatabase(imageFolderPath)

filepattern = fullfile(imageFolderPath, '*.jpg')
fileList = dir(filepattern);

for i=1:20 %length(fileList)
    
  baseFileName = fileList(i).name;
  disp(baseFileName);
  fullFileName = strcat(imageFolderPath,'\',baseFileName) ;
  
  i=i+1;
  % store in an array of structure 
  imageDatabase(i).imageName = fullFileName; % read the file name
  imageDatabase(i).label = 'Apple'; 
  
  imageDatabase(i).featFourier = getFourier(fullFileName);

  
  
  fprintf('\n The image %s assigned to label = %d category = %d', baseFileName, ...
      imageDatabase(i).label);
  
end

%% img 100 - 199 assign to Beach label = 2
for i=21:40 %length(fileList)

  baseFileName = fileList(i).name;
  disp(baseFileName);
  fullFileName = strcat(imageFolderPath,'\',baseFileName) ;
  
  i=i+1;
  % store in an array of structure 
  imageDatabase(i).imageName = fullFileName; % read the file name
  imageDatabase(i).label = 'Bird'; 
  
  imageDatabase(i).featFourier = getFourier(fullFileName);

  
  
  fprintf('\n The image %s assigned to label = %d category = %d', baseFileName, ...
      imageDatabase(i).label);
      
end

%% img % 300 - 399 assign to Bus label = 4
for i=41:60 %length(fileList)
    
  baseFileName = fileList(i).name;
  disp(baseFileName);
  fullFileName = strcat(imageFolderPath,'\',baseFileName) ;
  
  i=i+1;
  % store in an array of structure 
  imageDatabase(i).imageName = fullFileName; % read the file name
  imageDatabase(i).label = 'Butterfly'; 
  
  imageDatabase(i).featFourier = getFourier(fullFileName);

  
  
  fprintf('\n The image %s assigned to label = %d category = %d', baseFileName, ...
      imageDatabase(i).label);
      
end

%% img 400 - 499 assign to Dinasour label = 5

for i=61:80 %length(fileList)
    
  baseFileName = fileList(i).name;
  disp(baseFileName);
  fullFileName = strcat(imageFolderPath,'\',baseFileName) ;
  
  i=i+1;
  % store in an array of structure 
  imageDatabase(i).imageName = fullFileName; % read the file name
  imageDatabase(i).label = 'Cow'; 
  
  imageDatabase(i).featFourier = getFourier(fullFileName);

  
  
  fprintf('\n The image %s assigned to label = %d category = %d', baseFileName, ...
      imageDatabase(i).label);
      
end

%% % 500-599.jpg assign to Elephant label = 6
for i=81:100 %length(fileList)
    
  baseFileName = fileList(i).name;
  disp(baseFileName);
  fullFileName = strcat(imageFolderPath,'\',baseFileName) ;
  
  i=i+1;
  % store in an array of structure 
  imageDatabase(i).imageName = fullFileName; % read the file name
  imageDatabase(i).label = 'Chopper'; 
  
  imageDatabase(i).featFourier = getFourier(fullFileName);

  
  fprintf('\n The image %s assigned to label = %d category = %d', baseFileName, ...
      imageDatabase(i).label);
      
end

%% % 600-699.jpg assign to Flower label = 7
for i=101:120 %length(fileList)
    
  baseFileName = fileList(i).name;
  disp(baseFileName);
  fullFileName = strcat(imageFolderPath,'\',baseFileName) ;
  
  i=i+1;
  % store in an array of structure 
  imageDatabase(i).imageName = fullFileName; % read the file name
  imageDatabase(i).label = 'Cup'; 
  
  imageDatabase(i).featFourier = getFourier(fullFileName);

  
  
  fprintf('\n The image %s assigned to label = %d category = %d', baseFileName, ...
      imageDatabase(i).label);
      
end

%% % 700-799.jpg assign to Horse label = 8
for i=121:140 %length(fileList)
    
  baseFileName = fileList(i).name;
  disp(baseFileName);
  fullFileName = strcat(imageFolderPath,'\',baseFileName) ;
  
  i=i+1;
  % store in an array of structure 
  imageDatabase(i).imageName = fullFileName; % read the file name
  imageDatabase(i).label = 'Device2'; 
  
  imageDatabase(i).featFourier = getFourier(fullFileName);

  
  
  fprintf('\n The image %s assigned to label = %d category = %d', baseFileName, ...
      imageDatabase(i).label);
      
end

%% % 800-899.jpg assign to Mountain label = 9
for i=141:160 %length(fileList)
    
  baseFileName = fileList(i).name;
  disp(baseFileName);
  fullFileName = strcat(imageFolderPath,'\',baseFileName) ;
  
  i=i+1;
  % store in an array of structure 
  imageDatabase(i).imageName = fullFileName; % read the file name
  imageDatabase(i).label = 'Device6'; 
  
  imageDatabase(i).featFourier = getFourier(fullFileName);

  
  
  fprintf('\n The image %s assigned to label = %d category = %d', baseFileName, ...
      imageDatabase(i).label);
      
end

%%
for i=161:180 %length(fileList)
    
  baseFileName = fileList(i).name;
  disp(baseFileName);
  fullFileName = strcat(imageFolderPath,'\',baseFileName) ;
  
  i=i+1;
  % store in an array of structure 
  imageDatabase(i).imageName = fullFileName; % read the file name
  imageDatabase(i).label = 'Dog'; 
  
  imageDatabase(i).featFourier = getFourier(fullFileName);

  
  fprintf('\n The image %s assigned to label = %d category = %d', baseFileName, ...
      imageDatabase(i).label);
      
end

for i=181:200 %length(fileList)
    
  baseFileName = fileList(i).name;
  disp(baseFileName);
  fullFileName = strcat(imageFolderPath,'\',baseFileName) ;
  
  i=i+1;
  % store in an array of structure 
  imageDatabase(i).imageName = fullFileName; % read the file name
  imageDatabase(i).label = 'Flatfish'; 
  
  imageDatabase(i).featFourier = getFourier(fullFileName);

  
  fprintf('\n The image %s assigned to label = %d category = %d', baseFileName, ...
      imageDatabase(i).label);
      
end

for i=201:220 %length(fileList)
    
  baseFileName = fileList(i).name;
  disp(baseFileName);
  fullFileName = strcat(imageFolderPath,'\',baseFileName) ;
  
  i=i+1;
  % store in an array of structure 
  imageDatabase(i).imageName = fullFileName; % read the file name
  imageDatabase(i).label = 'Frog'; 
  
  imageDatabase(i).featFourier = getFourier(fullFileName);

  
  fprintf('\n The image %s assigned to label = %d category = %d', baseFileName, ...
      imageDatabase(i).label);
      
end

for i=221:240 %length(fileList)
    
  baseFileName = fileList(i).name;
  disp(baseFileName);
  fullFileName = strcat(imageFolderPath,'\',baseFileName) ;
  
  i=i+1;
  % store in an array of structure 
  imageDatabase(i).imageName = fullFileName; % read the file name
  imageDatabase(i).label = 'Hat'; 
  
  imageDatabase(i).featFourier = getFourier(fullFileName);
  
  fprintf('\n The image %s assigned to label = %d category = %d', baseFileName, ...
      imageDatabase(i).label);
      
end

for i=241:260 %length(fileList)
    
  baseFileName = fileList(i).name;
  disp(baseFileName);
  fullFileName = strcat(imageFolderPath,'\',baseFileName) ;
  
  i=i+1;
  % store in an array of structure 
  imageDatabase(i).imageName = fullFileName; % read the file name
  imageDatabase(i).label = 'Horseshoe'; 
  
  imageDatabase(i).featFourier = getFourier(fullFileName);

  
  fprintf('\n The image %s assigned to label = %d category = %d', baseFileName, ...
      imageDatabase(i).label);
      
end

for i=261:280 %length(fileList)
    
  baseFileName = fileList(i).name;
  disp(baseFileName);
  fullFileName = strcat(imageFolderPath,'\',baseFileName) ;
  
  i=i+1;
  % store in an array of structure 
  imageDatabase(i).imageName = fullFileName; % read the file name
  imageDatabase(i).label = 'Imfish'; 
  
  imageDatabase(i).featFourier = getFourier(fullFileName);

  fprintf('\n The image %s assigned to label = %d category = %d', baseFileName, ...
      imageDatabase(i).label);
      
end

for i=281:300 %length(fileList)
    
  baseFileName = fileList(i).name;
  disp(baseFileName);
  fullFileName = strcat(imageFolderPath,'\',baseFileName) ;
  
  i=i+1;
  % store in an array of structure 
  imageDatabase(i).imageName = fullFileName; % read the file name
  imageDatabase(i).label = 'PersonalCar'; 
  
  imageDatabase(i).featFourier = getFourier(fullFileName);

  
  fprintf('\n The image %s assigned to label = %d category = %d', baseFileName, ...
      imageDatabase(i).label);
      
end

for i=301:320 %length(fileList)
    
  baseFileName = fileList(i).name;
  disp(baseFileName);
  fullFileName = strcat(imageFolderPath,'\',baseFileName) ;
  
  i=i+1;
  % store in an array of structure 
  imageDatabase(i).imageName = fullFileName; % read the file name
  imageDatabase(i).label = 'Seasnake'; 
  
  imageDatabase(i).featFourier = getFourier(fullFileName);

  fprintf('\n The image %s assigned to label = %d category = %d', baseFileName, ...
      imageDatabase(i).label);
      
end

for i=321:340 %length(fileList)
    
  baseFileName = fileList(i).name;
  disp(baseFileName);
  fullFileName = strcat(imageFolderPath,'\',baseFileName) ;
  
  i=i+1;
  % store in an array of structure 
  imageDatabase(i).imageName = fullFileName; % read the file name
  imageDatabase(i).label = 'Stef'; 
  
  imageDatabase(i).featFourier = getFourier(fullFileName);

  fprintf('\n The image %s assigned to label = %d category = %d', baseFileName, ...
      imageDatabase(i).label);
      
end
save('database_cbir.mat', 'imageDatabase');
    
end