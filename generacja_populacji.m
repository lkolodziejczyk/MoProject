function [ output_args ] = generacja_populacji( P,Palety,mag )
%GENERACJA Summary of this function goes here
for i=1:P 
 [magRowsNum, magColumnNum] = size(mag);

%    x=rand(Palety,3);
 %   (((100 - 1) .* x) + 1) - mod((((100 - 1) .* x) + 1) , 1);
  %  x = round(x*100);
   % x(:,3)=1 + (rand(Palety,1) * 2);
   % x=int32(x);
%   savefile=strcat(int2str(i),'.dat');
 %  save(savefile, 'x','-ASCII');
 array = zeros(Palety,3);
 for p=1:1:Palety
    x = randi([1,magRowsNum]);
    array(p,1) = x;
    
    y = randi([1,magColumnNum]);
    index = 1;
    while(mag(x,y)==8)
        y = randi([1,magColumnNum]);
        index = index + 1;
        
        if(index == 50)
            x = randi([1,magRowsNum]);
            array(p,1) = x; 
            
            index = 1;
        end
    end
    
    array(p,2) = y;
    array(p,3) = randi([1,3]);    
 end
    savefile=strcat('Populacja/',int2str(i),'.dat');
    save(savefile, 'array','-ASCII');
end;
%   Detailed explanation goes here
