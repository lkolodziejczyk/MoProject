<<<<<<< HEAD
function table = loadDataFunction(mag, i)
=======
function table = loadDataFunction(i)
>>>>>>> remotes/origin/lukasz
addpath(strcat(pwd,'\Populacja'));
BaseName='.dat';
   for a=1:1:i 
        FileName=[num2str(a),BaseName];
        B = load(FileName,'%d %d %d');
<<<<<<< HEAD
     
        obj = subject(B);
        g = magazyn(20,6,1);
%        b = mutationOfSubject(obj,mag.map);

        table(a,1) = obj;
    end
=======
        obj = subject(B);
        g = magazyn(20,6,1);
%        b = mutationOfSubject(obj,mag.map);
        table = [table obj];
   end
end
>>>>>>> remotes/origin/lukasz
