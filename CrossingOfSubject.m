function object=CrossingOfSubject(do_mutowania,Palety,M)
   
     
    [rowsNum, columnNum] = size(do_mutowania(1));
    A = zeros(Palety,3);
    miejsce = rand(1,1);
    miejsce = round(miejsce*Palety);
    pierwszy = rand(1,1);
    pierwszy = round(miejsce*M);
    drugi = rand(1,1);
    drugi = round(miejsce*M);
    while pierwszy ~= drugi 
        drugi = rand(1,1);
        drugi = round(miejsce*M);
    end;
        
    for rows=1:1:miejsce
            A(rows,1) = do_mutowania(pierwszy(rows,1),1);
            A(rows,2) = do_mutowania(pierwszy(rows,2),1);
            A(rows,3) = do_mutowania(pierwszy(rows,3),1);
    end;
       for rows=miejsce:1:rowsNum
           A(rows,1) = do_mutowania(drugi(rows,1),1);
           A(rows,2) = do_mutowania(pierwszy(rows,2),1);
           A(rows,3) = do_mutowania(pierwszy(rows,3),1);
       end;
        
    obj.newMainArray(A);
    object = obj;
end
