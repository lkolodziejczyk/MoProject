function table = loadDataFunction()
addpath('Populacja');
   
BaseName='.dat';
   for a=1:1:50 
        FileName=[num2str(a),BaseName];
        B = load(FileName,'%d %d %d');
     
        obj = subject(B);

        table(a,1) = obj;
        mutationOfSubject(obj);
    end
