function mutationOfSubject(obj,mag)
   
    A = obj.palletsArray;
    [magRowsNum, magColumnNum] = size(mag);
    [rowsNum, columnNum] = size(A);
   
    for rows=1:1:rowsNum
        i = randi([1,3]); % wybieramy losowo który parametr mamy zmieniæ w palecie:  x | y | z
        if (i==1)
            x =randi([1,magRowsNum]);
            
            while(mag(x,A(rows,i))==8)
                x = randi([1,magRowsNum]);
            end
            
            A(rows,i) = x;
        end
        
        if (i==2)
            y =randi([1,magRowsNum]);
            
            while(mag(y,A(rows,i))==8)
                y = randi([1,magRowsNum]);
            end
            
            A(rows,i) = y;
        end
        
        if(i==3)
            A(rows,i) = randi([1,3]);
        end
    end
    
    obj.newMainArray(A);
end
