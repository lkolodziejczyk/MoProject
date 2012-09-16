function table = loadDataFunction()
addpath('Populacja');
   
BaseName='.dat';
   for a=1:1:50 
        FileName=[num2str(a),BaseName];
        B = load(FileName,'%d %d %d');
     
        obj = subject(B);
        g = magazyn(20,6,1);
        b = mutationOfSubject(obj,g.map);

        table(a,1) = b;
    end
