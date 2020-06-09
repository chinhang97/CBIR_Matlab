function PrecisionList = getPrecision1(imageDatabase)

numImageRetrieved=20;
imNum = length(imageDatabase);


for i=1:imNum

    for k=1:imNum
        FEuclidean(k) = sqrt( sum( power( imageDatabase(k).featFourier - imageDatabase(i).featFourier, 2 ) ) );
    end
    
    [FDistance, Fidx] = sort(FEuclidean);
    FSorted = Fidx(1:numImageRetrieved);
    
    Fcrt = 0;

    for m=1:numImageRetrieved
        FLabel = imageDatabase(FSorted(m)).label;

        
        if strcmp(imageDatabase(i).label, FLabel)
            Fcrt = Fcrt + 1;
        end
        
    end
    
    FPrecision(i) = (Fcrt/numImageRetrieved)*1;

   
   
end


appleP = 0;
birdP =0;
butterflyP =0;
cowP =0;
chopperP =0;
cupP =0;
device2P =0;
device6P =0;
dogP=0;
flatfishP =0;
frogP =0;
hatP =0;
horseshoeP =0;
imfishP=0;
personalcarP=0;
seasnakeP =0;
stefP =0;


for j=1:20
    appleP = appleP + FPrecision(j);

end
PrecisionList.AvgApplePrecision = appleP/20;

for j=21:40
    birdP = birdP + FPrecision(j);

end
PrecisionList.AvgBirdPrecision = birdP/20;

for j=41:60
    butterflyP = butterflyP + FPrecision(j);

end
PrecisionList.AvgButterflyPrecision = butterflyP/20;

for j=61:80
    cowP = cowP + FPrecision(j);

end
PrecisionList.AvgCowPrecision = cowP/20;

for j=81:100
    chopperP = chopperP + FPrecision(j);

end
PrecisionList.AvgChopperPrecision = chopperP/20;

for j=101:120
    cupP = cupP + FPrecision(j);

end
PrecisionList.AvgCupPrecision = cupP/20;

for j=121:140
    device2P = device2P + FPrecision(j);

end
PrecisionList.AvgDevice2Precision = device2P/20;

for j=141:160
    device6P = device6P + FPrecision(j);

end
PrecisionList.AvgDevice6Precision = device6P/20;

for j=161:180
    dogP = dogP + FPrecision(j);

end
PrecisionList.AvgDogPrecision = dogP/20;

for j=181:200
    flatfishP = flatfishP + FPrecision(j);

end
PrecisionList.AvgFlatfishPrecision = flatfishP/20;

for j=201:220
    frogP = frogP + FPrecision(j);

end
PrecisionList.AvgFrogPrecision = frogP/20;


for j=221:240
    hatP = hatP + FPrecision(j);

end
PrecisionList.AvgHatPrecision = hatP/20;

for j=241:260
    horseshoeP = horseshoeP + FPrecision(j);

end
PrecisionList.AvgHorseshoePrecision = horseshoeP/20;


for j=261:280
    imfishP = imfishP + FPrecision(j);

end
PrecisionList.AvgImfishPrecision = imfishP/20;


for j=281:300
    personalcarP = personalcarP + FPrecision(j);

end
PrecisionList.AvgPersonalCarPrecision = personalcarP/20;


for j=301:320
    seasnakeP = seasnakeP + FPrecision(j);

end
PrecisionList.AvgSeasnakePrecision = seasnakeP/20;


for j=321:340
    stefP = stefP + FPrecision(j);

end
PrecisionList.AvgStefPrecision = stefP/20;


PrecisionList.AvgPrecision = (PrecisionList.AvgApplePrecision + PrecisionList.AvgBirdPrecision + PrecisionList.AvgButterflyPrecision + PrecisionList.AvgCowPrecision + PrecisionList.AvgChopperPrecision + PrecisionList.AvgCupPrecision + PrecisionList.AvgDevice2Precision + PrecisionList.AvgDevice6Precision + PrecisionList.AvgDogPrecision+ PrecisionList.AvgFlatfishPrecision+ PrecisionList.AvgFrogPrecision+ PrecisionList.AvgHatPrecision+ PrecisionList.AvgHorseshoePrecision+ PrecisionList.AvgImfishPrecision+ PrecisionList.AvgPersonalCarPrecision+ PrecisionList.AvgSeasnakePrecision+ PrecisionList.AvgStefPrecision)/17;

save('precisionInfo.mat', 'PrecisionList');

end