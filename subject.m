classdef subject
    properties
        time;
        mainArray; %tablica: index | x | y | z | trasa 5x250
        palletsArray; %tablica: x | y | z
        
    end
    methods
        function obj = subject(A)
            obj.palletsArray = A;
            array = zeros(250,5); 
            [rowNum,columnNum]=size(A);
        
            for rows=1:1:rowNum
                array(rows,1) = rows; %set wood index 1 - 250
                for columns=1:1:columnNum
                   array(rows,1+columns) = A(rows,columns); %set x y z
                end
            end
            obj.mainArray = array;
        end

        function obj = setEndFunction(time)
            obj.time = time;
        end
        
        function obj = setRoad(index,road)
            obj.mainArray(index,4) = road;
        end
    end
end