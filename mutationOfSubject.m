function object = mutationOfSubject(obj,mag)
   
    A = obj.palletsArray;
    [magRowsNum, magColumnNum] = size(mag);
    [rowsNum, columnNum] = size(A);
   
    for rows=1:1:rowsNum
         % wybieramy losowo który parametr mamy zmieniæ w palecie:  x | y | z
        
        i = rand(1,1);
            i_i = round(i*3);
            
            if (i_i == 0) 
                i_i = 1;
            end
            
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
            z = rand(1,1);
                z_z = round(z*3);
               
                if (z_z == 0) 
                    z_z = 1;
                end
            A(rows,i) = z_z;
         end
            
       end
    
    obj.newMainArray(A);
    object = obj;
end
