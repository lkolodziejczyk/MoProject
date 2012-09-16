function object=CrossingOfSubject(do_mutowania,Palety,M,P)
   
    A=zeros(Palety,3);
    miejsce = rand(1,1);
    miejsce = round(miejsce*Palety);
    if miejsce==0
        miejsce=1;
    end;
    pierwszy = rand(1,1);
    pierwszy =round(pierwszy*M*P*0.01);
    if pierwszy==0
        pierwszy=1;
    end;
    drugi = rand(1,1);
    drugi = round(drugi*M*P*0.01);
    if drugi==0
        drugi=1;
    end;
    while pierwszy == drugi 
        drugi = rand(1,1);
        drugi = round(drugi*M*P*0.01);
        if drugi==0
        drugi=1;
    end;
    end;
  
   %miejsce
   %pierwszy
   %drugi
   %size(do_mutowania)
    for rows=1:1:miejsce
      do_mutowania(pierwszy).palletsArray(rows,1)
            A(rows,1) = do_mutowania(pierwszy).palletsArray(rows,1);
            A(rows,2) = do_mutowania(pierwszy).palletsArray(rows,2);
            A(rows,3) = do_mutowania(pierwszy).palletsArray(rows,3);
    end;
        
   object=do_mutowania(pierwszy);
end
