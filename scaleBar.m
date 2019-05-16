%% Read the scale and the Image
% input:  image
% output : scale, pixels and text



function [value , unit, k ]=  scaleBar(I)
%crop image


Is=I(2050:2115,770:1280);%scale info region
Iruler=I(2050:2115,770:1100);%ruler
Itext=I(2050:2115,1100:1260);%scale:value+unit

%count pixel on the ruler
ind=Iruler==255;
k=max(sum(ind,2));%pixel number on the ruler
imshow(Is)

%text recognition
results = ocr(Itext);
value = results.Words{1};
unit = results.Words{2};
% wordBBox = results.WordBoundingBoxes(2,:);
loc=[770 2050 510 60];
figure();
Iname = insertObjectAnnotation(I, 'rectangle', loc,...
    strcat('ruler:',num2str(k),'pixels; ',' scale:',num2str(value),unit,'.'),...
   'LineWidth',7, 'TextBoxOpacity',0.5,'FontSize',70,'TextColor','green');
imshow(Iname);
end
