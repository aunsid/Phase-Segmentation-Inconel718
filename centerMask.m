function I = centerMask(F)
% takes in an image and masks out the center region 

% find the center of the image
center= uint8(size(F)/2);
% write down the coods that you need to be masked
points_x = [center(1)-12, center(1)+12, center(1)+12, center(1)-12];
points_y = [center(2)+12, center(2)+12, center(2)-12, center(2)-12];
% create mask 
mask = poly2mask(double(points_x), double(points_y), size(F,1),size(F,2));
mask = imcomplement(mask);
F(~mask) = 0;       
I = F;
end