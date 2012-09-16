function table = loadDataFunction(mag, i)
addpath(pwd);
strcat(pwd)   
BaseName='.dat';
   for a=1:1:i 
        FileName=[num2str(a),BaseName];
        B = load(FileName,'%d %d %d');
     
        obj = subject(B);
        g = magazyn(20,6,1);
%        b = mutationOfSubject(obj,mag.map);
obj
        table(a,1) = obj;
   end
end
