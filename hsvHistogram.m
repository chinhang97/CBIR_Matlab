%image= rgb2hsv(image)

%r = image(:, :, 1);
%g = image(:, :, 2);
%b = image(:, :, 3);
%[rows, cols, numOfBands] = size(image);


%rhist = imhist(r,20);
%ghist =imhist(g,20);
%bhist =imhist(b,20);


%total =rhist(:)+ghist(:)+bhist(:);

image= rgb2gray(image);

grayhis =imhist(image)

%fv =[grayhis];

%fv =[rhist ghist bhist];