%% main function for simulating GPS
clear all
close all
clc

%% initialization
% read in data for each satellite
binary = ['0000000000000101010101001'; '0000000000001010101010010'; ...
    '0000000000010100011011011'; '0000000000011110111010100';...
    '0000001111101000110110101'];

binaryInput = binary
voltage = [1 2 3 4 5];

infoStruct = [];
[r,~] = size(binary);
for i = 1:r
%    parse binary
    bin = binary(i,:);
    time_bin = bin(1:16);
    x_bin = bin(17:18);
    y_bin = bin(19:20);
    z_bin = bin(21:22);
    satelliteId_bin = bin(23:25);
    
    s = struct('timeDelay',bin2dec(time_bin),'X',bin2dec(x_bin),...
        'Y',bin2dec(y_bin),'Z',bin2dec(z_bin),'ID',bin2dec(satelliteId_bin),...
        'range',bin2dec(time_bin) * 10^-3 * 3 * 10^8);
    infoStruct = [infoStruct s];
end

%% ADC
voltageBinary = [];
for i = 1:length(voltage)
    tempBinary = ADC(voltage(i));
    voltageBinary = [voltageBinary; tempBinary];
end
voltageADC = voltageBinary
%% choose the best 4 satellites to use

[sortedValues,sortIndex] = sort(voltage(:),'descend');
maxIndex = sortIndex(1:4);


%% get the information from the 4 satellites we will be using

xi = [];
yi = [];
zi = [];
ri = [];
for i = 1:4
    xi = [xi infoStruct(maxIndex(i)).X* 10^8];
    yi = [yi infoStruct(maxIndex(i)).Y* 10^8];
    zi = [zi infoStruct(maxIndex(i)).Z* 10^8];
    ri = [ri infoStruct(maxIndex(i)).range];
end

%% mytest
xi = [ 2088202.299       11092568.240    35606984.591    3966929.048]
yi = [-11757191.370    -14198201.090     94447027.237    7362851.831] %y3 in the paper is 94447027.237, they messed up their copying
zi = [ 25391471.881      21471165.950    9101378.572     26388447.172]
ri = [23204698.51 21585835.37 31364260.01 24966798.73]
xi
yi
zi
ri
[C] = thesisGPS(xi,yi,zi,ri);
X = C(1)
Y = C(2)
Z = C(3)


%% plot the things(doesn't work)
% grs80 = referenceEllipsoid('grs80','km');
% 
% figure('Renderer','opengl')
% ax = axesm('globe','Geoid',grs80,'Grid','on', ...
%     'GLineWidth',1,'GLineStyle','-',...
%     'Gcolor',[0.9 0.9 0.1],'Galtitude',100);
% ax.Position = [0 0 1 1];
% axis equal off
% view(3)
% 
% load topo
% geoshow(topo,topolegend,'DisplayType','texturemap')
% demcmap(topo)
% land = shaperead('landareas','UseGeoCoords',true);
% plotm([land.Lat],[land.Lon],'Color','black')
% rivers = shaperead('worldrivers','UseGeoCoords',true);
% plotm([rivers.Lat],[rivers.Lon],'Color','blue')

% figure
% [x y z] = sphere;
% r= 6378100;
% surf(r*x,r*y,r*z)
% hold
% scatter3(r/1000,r/1000,r/1000)
% figure
% scatter3(xi/1000,yi/1000,zi/1000)
% scatter3(C(1)/100,C(2)/100,C(3)/100,'m');
% scatter3(0,r*2^0.5,r*2^0.5);
% [X Y Z] = enu2ecef(xi,yi,zi)
% surf(xi(1), yi(1), zi(2))