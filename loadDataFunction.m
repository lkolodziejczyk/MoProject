function table = loadDataFunction(i)
addpath(strcat(pwd));
BaseName='.dat';
table = [];
   for a=1:1:i 
        FileName=[num2str(a),BaseName];
        B = load(FileName,'%d %d %d');
        obj = subject(B);
        g = magazyn(20,6,1);
%        b = mutationOfSubject(obj,mag.map);
        table = [table obj];
   end
end