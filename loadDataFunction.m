function table = loadDataFunction()
addpath('Populacja');
   
BaseName='.dat';
   for a=1:1:50 
        FileName=[num2str(a),BaseName];
        array = zeros(250,5);
        B = load(FileName,'%d %d %d');

        [rowNum,columnNum]=size(B);
        
        for i=1:1:rowNum
            array(i,1) = i; %set wood index 1 - 250
            for b=1:1:columnNum
                array(i,1+b) = B(i,b); %set x y z
            end
        end
        
        obj = subject(array);

        table(a,1) = obj;
        mutationOfSubject(obj);
    end
