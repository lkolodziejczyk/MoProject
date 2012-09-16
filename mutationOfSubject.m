function Subject = mutationOfSubject(obj)
   
    A = obj.palletsArray;
    
    [rowsNum, columnNum] = size(A);
   
    for rows=1:1:rowsNum
        
        i = int8(rand*3); % wybieramy losowo który parametr mamy zmieniæ w palecie:  x | y | z
        if (i ~= 0)
            disp('true');
        elseif (i==0)
            disp('false');
        end
    end
end
