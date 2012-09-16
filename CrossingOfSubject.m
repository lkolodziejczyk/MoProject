function object=CrossingOfSubject(do_mutowania,Palety,M)
   
     
    [rowsNum, columnNum] = size(do_mutowania());
    A = zeros(Palety,3);
    miejsce = rand(1,1);
    miejsce = round(miejsce*Palety);
    pierwszy = rand(1,1);
    pierwszy = round(pierwszy*M);
    drugi = rand(1,1);
    drugi = round(drugi*M);
    while pierwszy == drugi 
        drugi = rand(1,1);
        drugi = round(drugi*M);
    end;

        
    for rows=1:1:miejsce
            A(rows,1) = do_mutowania(1,pierwszy(rows,1));
            A(rows,2) = do_mutowania(1,pierwszy(rows,2));
            A(rows,3) = do_mutowania(1,pierwszy(rows,3));
    end;
       for rows=miejsce:1:Palety
           A(rows,1) = do_mutowania(1,drugi(rows,1));
           A(rows,2) = do_mutowania(1,drugi(rows,2));
           A(rows,3) = do_mutowania(1,drugi(rows,3));
       end;
        
    obj.newMainArray(A);
    object = obj;
end
