%%created by Mohammed Aun Siddiqui
% msiddiqui@mines.edu

clear all;
close all;
clc;
 
rect = [95.5100000000000,49.5100000000000,503.980000000000,504.980000000000];
%fagrect =[93.5100000000000,552.510000000000,503.980000000000,18.9800000000000]; 
% read the original image
RGB = imread('15.jpg');
% figure();
% imshow(RGB,[]);
% fagI = imcrop(RGB,fagrect); 
cropRGB = imcrop(RGB, rect);
% figure();
% imshow(cropRGB,[]);
% figure;
% imshow(fagI,[]);

 HSV = rgb2hsv(cropRGB);
 H = HSV(:,:,1);
 S = HSV(:,:,2);
 V = HSV(:,:,3);
 
 figure();
 subplot(1,3,1), imshow(H,[]), title('H');
 subplot(1,3,2), imshow(S,[]), title('S');
 subplot(1,3,3), imshow(V,[]), title('V');
 
% % segment red
%  Hmask = (H>0.1) & (H<0.9);  % blue
%  Smask = (S>0.01);
%  Vmask = (V>0.02);
%  
% %  figure();
% %  subplot(1,3,1), imshow(Hmask,[]);
% %  subplot(1,3,2), imshow(Smask,[]);
% %  subplot(1,3,3), imshow(Vmask,[]);
%  
% % Combine
%  Result = Hmask & Smask & Vmask;
% % Clean up
%  Result = imopen(Result, strel('disk', 2));
%  Result = imclose(Result, strel('disk', 2));
%  figure(), imshow(Result);title("result");
%  
%  
% 
% i = imread('5.tif');
% [v, u, k] = scaleBar(i);
% 
% Area = numel(~Result)-nnz(~Result);
% Area = Area * (k*k)/(10*10);
% position = [400 50 20 20];
% label_str = ['Red Area:   ' num2str(Area,'%0.2f') '  Units :   ' num2str(u,'%0.2f') ' ^2'];
% RGBshow = insertObjectAnnotation(cropRGB,'rectangle',position,label_str,'TextBoxOpacity',1 ,'FontSize',18);
% figure(), imshow(RGBshow);title("Area");
% 
% 
% 
% 
% % find the area of the image (back pixels)
% % https://www.mathworks.com/matlabcentral/answers/255527-i-have-a-black-and-white-image-how-can-i-find-the-area-percentage-of-the-black-areas
% 
% % Area = numel(Result)-nnz(Result);
% % position = [10 10 10 10];
% % label_str = ['Area: ' num2str(Area,'%0.2f') 'nm^2'];
% % RGBshow = insertObjectAnnotation(Result,'rectangle',position,label_str,'TextBoxOpacity',0.9,'FontSize',18);
% % figure, imshow(RGBshow);title("result");
%  
% % Overlay
%  boundaries = bwboundaries(Result);
%  figure, imshow(cropRGB);
%  hold on
%  for k=1:length(boundaries)
%      b = boundaries{k};
%      plot(b(:,2),b(:,1),'g','LineWidth',3);
%  end
% hold off
% 
% 
% 
