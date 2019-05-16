  function  numberPhases = getPhases (I)
I = imcrop(I,[0 0 2051 2048]);
I = imresize(I,[2560 2560]);
%dimensions of the image
[row, col]=size(I);
%box Size
Size = 256;
%step size
step = 256;
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
%       Kmedian = medfilt2(J);
% 
        [U,S,V]=svd(J);
        S([1],:)=0; 
        D0=U*S*V';

        
        c = reshape(D0,1,[]);


        X=[X;c];
    end
end



eva = evalclusters(X,'kmeans','gap','KList',[1:6]);
numberPhases = eva.OptimalK;
figure(), plot(eva), title("Evaluation");
end
