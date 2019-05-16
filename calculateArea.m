%%created by Mohammed Aun Siddiqui
% msiddiqui@mines.edu

%% calculate area after getting image and number of colours.

% read image 
function [region] = calculateArea(I, colours)
I0 = rgb2hsv(I);
numberOfColors = numel(colours);
    for x = 1: numberOfColors
        % read one colour ignore the rest of the maps by converting to hsv
        BW = ( I(:,:,1) == colours(x,1) & I(:,:,2) == colours(x,2) &  I(:,:,3) == colours(x,3) ); 
    end

end


