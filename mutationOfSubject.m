function object = mutationOfSubject(obj,mag)
   
    A = obj.palletsArray;
    [magRowsNum, magColumnNum] = size(mag);
    [rowsNum, columnNum] = size(A);
   
    for rows=1:1:rowsNum
        i = randi([1,3]); % wybieramy losowo kt�ry parametr mamy zmieni� w palecie:  x | y | z
        if (i==1)
            x = rand(1,1);
            x_x = round(x*magRowsNum);
            
            if (x_x == 0) 
                x_x = 1;
            end
            
            while(mag(int8(x_x),A(rows,2))==8)
                x = rand(1,1);
                x_x = round(x*magRowsNum);
               
                if (x_x == 0) 
                    x_x = 1;
                end
            end
            
            A(rows,i) = int8(x_x);
        end
        
        if (i==2)
            y = rand(1,1);
            y_y = round(y*magColumnNum);
            
            if (y_y == 0) 
                y_y = 1;
            end
            
            while(mag(A(rows,1),int8(y_y))==8)
                y = rand(1,1);
                y_y = round(y*magColumnNum);
                
                if (y_y == 0) 
                    y_y = 1;
                end
            end
            
            A(rows,i) = int8(y_y);
        end
        
        if(i==3)
            A(rows,i) = randi([1,3]);
        end
    end
    obj.newMainArray(A);
    object = obj;
end
