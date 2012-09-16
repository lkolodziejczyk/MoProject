classdef subject
    properties
        time;
        A;
        
    end
    methods
        function obj = subject(A)
            obj.A = A;
        end

        function obj = setEndFunction(time)
            obj.time = time;
        end
        
        function obj = setRoad(index,road)
            obj.A(index,4) = road;
        end
    end
end