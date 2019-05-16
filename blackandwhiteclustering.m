%%created by Mohammed Aun Siddiqui
% msiddiqui@mines.edu


% This programs uses black and white images of the fft. And then plots the 
% according to the number of clusters inputed by the user.




clear all; close all;clc;

%collect training samples
srcFiles = dir('\\hornet\Users\m\msiddiqui\adit\My Documents\MATLAB\xzhang\Training Images Phase Recognition\non-labeled\*.tif');  % the folder in which ur images exists
for z = 1: 21
    filename = strcat('\\hornet\Users\m\msiddiqui\adit\My Documents\MATLAB\xzhang\Training Images Phase Recognition\non-labeled\',srcFiles(z).name);
    I = imread(filename);
    I = imcrop(I,[0 0 2051 2048]);
    I = imresize(I,[1000 1000]);
    %dimensions of the image
    [row, col]=size(I);
    %box Size
    Size = 40;
    %step size
    step = 20;
    %normalize
    normalizedSize=[40 40];

    %spatial info
    INF=[];
    ind = 4;

    a=0;
    X=[];



%row
for i=1:step:row-Size
    %column
    for j=1:step:col-Size
        a=a+1;
        
        %INF: a, ind of image, size, intial point
        INF=[INF;a ind Size j i];
        
        %inital point of the box
        p0=[i,j];
        
        %coners of the box
        c=[p0(1) p0(2); p0(1)+Size p0(2)+Size];
        
        %crop image 
        I2=I(p0(1):p0(1)+Size-1,p0(2):p0(2)+Size-1);
        %fft transform
        F = imageFft(I2);
        
        
        % rotate
        R_I = imrotate(F,180);
        % multiply
        J = immultiply(F,R_I); 
        [U,S,V]=svd(J);
        S([1],:)=0; 
        D0=U*S*V';

        
        c = reshape(D0,1,[]);


        X=[X;c];
    end
end

% Get Phases from bigger boxes.
NUM = getPhases(I);
[idx,C] = kmeans(X,NUM,'Distance','cityblock','Replicates',5);




% Visualize the results
% Plot
figure(),
x0=10;
y0=10;
width=500;
height=480;
set(gcf,'units','points','position',[x0,y0,width,height])
imshow(I,'InitialMagnification','fit')
title('fft pattern clustering')
hold on;
a=0.1;

% Get cluster colours 
cmap = hsv(NUM);


for k=1:size(INF,1)
    %read locations of the filter box
    Size=INF(k,3);%box size
    p0=[INF(k,4) INF(k,5)];%%inital point of the box
    c=[p0(1) p0(2); p0(1)+Size p0(2)+Size];%coners of the box
    % I= imresize(I, 0.3);
    color=[cmap(idx(k),:) a];
    rectangle('Position', [c(1,1) c(1,2) Size Size], 'FaceColor',color ,'EdgeColor', color)%# Plot each column with a different color
    
    hold on;
    
    pause(0.1)
end
end