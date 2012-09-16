function table = loadDataFunction()
   BaseName='.dat';

   for a=3:1:3 
        FileName=[num2str(a),BaseName];
        array = zeros(250,5);
        B = load(FileName,'%d %d %d');

        [rowNum,columnNum]=size(B);
        
        for i=1:1:rowNum
            array(i,1) = i; %set wood index 1 - 250
            for a=1:1:columnNum
                array(i,1+a) = B(i,a); %set x y z
            end
        end
        
        obj = subject(array);

        table(1,1) = obj;
        table(2,1) = obj;
    end
