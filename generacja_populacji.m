function [ output_args ] = generacja_populacji( P,Palety )
%GENERACJA Summary of this function goes here
for i=1:P 
 
    x=rand(Palety,3);
    (((100 - 1) .* x) + 1) - mod((((100 - 1) .* x) + 1) , 1);
    x = round(x*100);
    x(:,3)=1 + (rand(Palety,1) * 2);
   % x=int32(x);
   savefile=strcat(int2str(i),'.dat');
   save(savefile, 'x','-ASCII');
    
end;
%   Detailed explanation goes here
