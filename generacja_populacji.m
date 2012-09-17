function [ output_args ] = generacja_populacji( P,Palety,mag )
%GENERACJA Summary of this function goes here
addpath(strcat(pwd,'\Populacja'));
for i=1:P 
 [magRowsNum, magColumnNum, magZNum] = size(mag);

%    x=rand(Palety,3);
 %   (((100 - 1) .* x) + 1) - mod((((100 - 1) .* x) + 1) , 1);
  %  x = round(x*100);
   % x(:,3)=1 + (rand(Palety,1) * 2);
   % x=int32(x);
%   savefile=strcat(int2str(i),'.dat');
 %  save(savefile, 'x','-ASCII');
 array = zeros(Palety,3);
 for p=1:1:Palety
    x = rand(1,1);
    x_x = round(x*magRowsNum);
    if (x_x == 0) 
        x_x = 1;
    end
    
    array(p,1) = x_x;
    
    y = rand(1,1);
    y_y = round(y*magColumnNum);
    
    if (y_y == 0) 
        y_y = 1;
    end
    
    index = 1;
    while(mag (x_x,y_y)==8)
        y = rand(1,1);
        y_y = round(y*magColumnNum);
        
        if (y_y == 0) 
            y_y = 1;
        end
        
        index = index + 1;
        
        if(index == 50)
            x = rand(1,1);
            x_x = round(x*magRowsNum);
            
            if (x_x == 0) 
                x_x = 1;
            end
            
            array(p,1) = x_x; 
            
            index = 1;
        end
    end
    
    array(p,2) = y_y;
    
    z = rand(1,1);
    z_z = round(z*3);
    
    if (z_z == 0) 
        z_z = 1;
    end
    
    array(p,3) = z_z;    
 end
<<<<<<< Temporary merge branch 1
=======
    addpath(strcat(pwd,'\Populacja'));
>>>>>>> Temporary merge branch 2
    savefile=strcat(int2str(i),'.dat');
    
	savefile=strcat('Populacja\',int2str(i),'.dat');
    save(savefile, 'array','-ASCII');
end;
%   Detailed explanation goes here
