function table = loadDataFunction(mag)
addpath('Populacja');
   
BaseName='.dat';
   for a=1:1:50 
        FileName=[num2str(a),BaseName];
        B = load(FileName,'%d %d %d');
     
        obj = subject(B);
        g = magazyn(20,6,1);
        b = mutationOfSubject(obj,mag.map);

        table(a,1) = b;
    end
