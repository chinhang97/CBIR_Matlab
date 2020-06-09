function PrecisionList = getPrecision(imageDatabase, numImageRetrieved)

imNum = length(imageDatabase);


for i=1:imNum

    for k=1:imNum 
        RGBEuclidean(k) = sqrt( sum( power( imageDatabase(k).featRGB - imageDatabase(i).featRGB, 2 ) ) );
        HSVEuclidean(k) = sqrt( sum( power( imageDatabase(k).featHSV - imageDatabase(i).featHSV, 2 ) ) );
        CNNEuclidean(k) = sqrt( sum( power( imageDatabase(k).featCNN - imageDatabase(i).featCNN, 2 ) ) );    
    end
    
    [RGBDistance, RGBidx] = sort(RGBEuclidean);
    RGBSorted = RGBidx(1:numImageRetrieved);
    
    [HSVDistance, HSVidx] = sort(HSVEuclidean);
    HSVSorted = HSVidx(1:numImageRetrieved);

    [CNNDistance, CNNidx] = sort(CNNEuclidean);
    CNNSorted = CNNidx(1:numImageRetrieved);
    
    RGBcrt = 0;
    HSVcrt = 0;
    CNNcrt = 0;   
    disp(CNNSorted);
    
    for m=1:10
        
        RGBLabel = imageDatabase(RGBSorted(m)).label;
        HSVLabel = imageDatabase(HSVSorted(m)).label;
        CNNLabel = imageDatabase(CNNSorted(m)).label;
        
        disp(HSVLabel);
        %disp(CNNLabel);
        
        if imageDatabase(i).label == RGBLabel
            RGBcrt = RGBcrt + 1;
        end
        
        if imageDatabase(i).label == HSVLabel
            HSVcrt = HSVcrt + 1;
        end
        
        if imageDatabase(i).label == CNNLabel
            CNNcrt = CNNcrt + 1;
        end        
    end
    
    RGBPrecision(i) = (RGBcrt/numImageRetrieved)*1;
    HSVPrecision(i) = (HSVcrt/numImageRetrieved)*1;
    CNNPrecision(i) = (CNNcrt/numImageRetrieved)*1;
    
    disp('Running I %d', i);
end

%%
BeachRGBPrecision = 0;
BeachHSVPrecision = 0;
BeachCNNPrecision = 0;

for j=1:100
    BeachRGBPrecision = BeachRGBPrecsion + RGBPrecision(j);
    BeachHSVPrecision = BeachHSVPrecsion + HSVPrecision(j);
    BeachCNNPrecision = BeachCNNPrecsion + CNNPrecision(j);
    disp('Running J %d', j);
end
PrecisionList.AvgBeachRGBPrecision = BeachRGBPrecision/100;
PrecisionList.AvgBeachHSVPrecision = BeachHSVPrecision/100;
PrecisionList.AvgBeachCNNPrecision = BeachCNNPrecision/100;

%%
BuildingRGBPrecision = 0;
BuildingHSVPrecision = 0;
BuildingCNNPrecision = 0;

for j=101:200
    BuildingRGBPrecision = BuildingRGBPrecsion + RGBPrecision(j);
    BuildingHSVPrecision = BuildingHSVPrecsion + HSVPrecision(j);
    BuildingCNNPrecision = BuildingCNNPrecsion + CNNPrecision(j);
    disp('Running J %d', j);
end
PrecisionList.AvgBuildingRGBPrecision = BuildingRGBPrecision/100;
PrecisionList.AvgBuildingHSVPrecision = BuildingHSVPrecision/100;
PrecisionList.AvgBuildingCNNPrecision = BuildingCNNPrecision/100;

%%
BusRGBPrecision = 0;
BusHSVPrecision = 0;
BusCNNPrecision = 0;

for j=201:300
    BusRGBPrecision = BusRGBPrecsion + RGBPrecision(j);
    BusHSVPrecision = BusHSVPrecsion + HSVPrecision(j);
    BusCNNPrecision = BusCNNPrecsion + CNNPrecision(j);
    disp('Running J %d', j);
end
PrecisionList.AvgBusRGBPrecision = BusRGBPrecision/100;
PrecisionList.AvgBusHSVPrecision = BusHSVPrecision/100;
PrecisionList.AvgBusCNNPrecision = BusCNNPrecision/100;

%%
DinoRGBPrecision = 0;
DinoHSVPrecision = 0;
DinoCNNPrecision = 0;

for j=301:400
    DinoRGBPrecision = DinoRGBPrecsion + RGBPrecision(j);
    DinoHSVPrecision = DinoHSVPrecsion + HSVPrecision(j);
    DinoCNNPrecision = DinoCNNPrecsion + CNNPrecision(j);
    disp('Running J %d', j);
end
PrecisionList.AvgDinoRGBPrecision = DinoRGBPrecision/100;
PrecisionList.AvgDinoHSVPrecision = DinoHSVPrecision/100;
PrecisionList.AvgDinoCNNPrecision = DinoCNNPrecision/100;

%%
EleRGBPrecision = 0;
EleHSVPrecision = 0;
EleCNNPrecision = 0;

for j=401:500
    EleRGBPrecision = EleRGBPrecsion + RGBPrecision(j);
    EleHSVPrecision = EleHSVPrecsion + HSVPrecision(j);
    EleCNNPrecision = EleCNNPrecsion + CNNPrecision(j);
    disp('Running J %d', j);
end
PrecisionList.AvgEleRGBPrecision = EleRGBPrecision/100;
PrecisionList.AvgEleHSVPrecision = EleHSVPrecision/100;
PrecisionList.AvgEleCNNPrecision = EleCNNPrecision/100;

%%
FlowerRGBPrecision = 0;
FlowerHSVPrecision = 0;
FlowerCNNPrecision = 0;
    
for j=501:600
    FlowerRGBPrecision = FlowerRGBPrecsion + RGBPrecision(j);
    FlowerHSVPrecision = FlowerHSVPrecsion + HSVPrecision(j);
    FlowerCNNPrecision = FlowerCNNPrecsion + CNNPrecision(j);
    disp('Running J %d', j);
end
PrecisionList.AvgFlowerRGBPrecision = FlowerRGBPrecision/100;
PrecisionList.AvgFlowerHSVPrecision = FlowerHSVPrecision/100;
PrecisionList.AvgFlowerCNNPrecision = FlowerCNNPrecision/100;

%%
HorseRGBPrecision = 0;
HorseHSVPrecision = 0;
HorseCNNPrecision = 0;
    
for j=601:700
    HorseRGBPrecision = HorseRGBPrecsion + RGBPrecision(j);
    HorseHSVPrecision = HorseHSVPrecsion + HSVPrecision(j);
    HorseCNNPrecision = HorseCNNPrecsion + CNNPrecision(j);
    disp('Running J %d', j);
end
PrecisionList.AvgHorseRGBPrecision = HorseRGBPrecision/100;
PrecisionList.AvgHorseHSVPrecision = HorseHSVPrecision/100;
PrecisionList.AvgHorseCNNPrecision = HorseCNNPrecision/100;

%%
MountRGBPrecision = 0;
MountHSVPrecision = 0;
MountCNNPrecision = 0;
    
for j=701:800
    MountRGBPrecision = MountRGBPrecsion + RGBPrecision(j);
    MountHSVPrecision = MountHSVPrecsion + HSVPrecision(j);
    MountCNNPrecision = MountCNNPrecsion + CNNPrecision(j);
    disp('Running J %d', j);
end
PrecisionList.AvgMountRGBPrecision = MountRGBPrecision/100;
PrecisionList.AvgMountHSVPrecision = MountHSVPrecision/100;
PrecisionList.AvgMountCNNPrecision = MountCNNPrecision/100;

%%
FoodRGBPrecision = 0;
FoodHSVPrecision = 0;
FoodCNNPrecision = 0;
    
for j=801:900
    FoodRGBPrecision = FoodRGBPrecsion + RGBPrecision(j);
    FoodHSVPrecision = FoodHSVPrecsion + HSVPrecision(j);
    FoodCNNPrecision = FoodCNNPrecsion + CNNPrecision(j);
    disp('Running J %d', j);
end

PrecisionList.AvgFoodRGBPrecision = FoodRGBPrecision/100;
PrecisionList.AvgFoodHSVPrecision = FoodHSVPrecision/100;
PrecisionList.AvgFoodCNNPrecision = FoodCNNPrecision/100;

PrecisionList.AvgRGBPrecision = (PrecisionList.AvgBeachRGBPrecision + PrecisionList.AvgBuildingRGBPrecision + PrecisionList.AvgBusRGBPrecision + PrecisionList.AvgDinoRGBPrecision + PrecisionList.AvgEleRGBPrecision + PrecisionList.AvgFlowerRGBPrecision + PrecisionList.AvgHorseRGBPrecision + PrecisionList.AvgMountRGBPrecision + PrecisionList.AvgFoodRGBPrecision)/9;
PrecisionList.AvgHSVPrecision = (PrecisionList.AvgBeachHSVPrecision + PrecisionList.AvgBuildingHSVPrecision + PrecisionList.AvgBusHSVPrecision + PrecisionList.AvgDinoHSVPrecision + PrecisionList.AvgEleHSVPrecision + PrecisionList.AvgFlowerHSVPrecision + PrecisionList.AvgHorseHSVPrecision + PrecisionList.AvgMountHSVPrecision + PrecisionList.AvgFoodHSVPrecision)/9;
PrecisionList.AvgCNNPrecision = (PrecisionList.AvgBeachCNNPrecision + PrecisionList.AvgBuildingCNNPrecision + PrecisionList.AvgBusCNNPrecision + PrecisionList.AvgDinoCNNPrecision + PrecisionList.AvgEleCNNPrecision + PrecisionList.AvgFlowerCNNPrecision + PrecisionList.AvgHorseCNNPrecision + PrecisionList.AvgMountCNNPrecision + PrecisionList.AvgFoodCNNPrecision)/9;

save('precisionInfo.mat', 'PrecisionList');
end