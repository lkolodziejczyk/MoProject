% object magazyn - create amgazyn object
classdef magazyn
    
    properties
        % 0 w magazynie to puste miejsce
        % 1 to zajete miejsce
        % 8 to pusta sciezka
        % 7 to zajeta sciezka
        heigth
        width
        length
        map
        wozek_count = 4;
        paths_offsets = [2 10];
        wozek_start = [0 0];
    end % properties
    
    methods
        % class constructor
        %@param width magazyn width
        %@param length magazyn length
        %@param height magazyn heigth
        function mag = magazyn(width, length, heigth)
            mag.width = width + width/mag.paths_offsets(2) + 1;
            mag.heigth = heigth;
            mag.length = length + length/mag.paths_offsets(1) + 1;
            mag.map = zeros(mag.width, mag.length, mag.heigth);
            for i = 1 : mag.paths_offsets(1) + 1 : mag.length + 1
                mag.map(:,i,:) = 8;
            end
             for i = 1 : mag.paths_offsets(2) + 1 : mag.width + 1
                mag.map(i,:,:) = 8;
            end
            %disp(mag.map);
        end % magazyn
        
        function display_current_state(mag)
            disp(mag.map);
        end
        
        function psp = prepare_start_packs(mag, limit)
            for i = 1:limit
                 
                temp = [int8(ceil(rand()*mag.width)) int8(ceil(rand()*mag.length)) int8(ceil(rand()*mag.heigth))]';
                while ~(mag.map(temp(1), temp(2), temp(3)) == 0)
                    temp = [int8(ceil(rand()*mag.width)) int8(ceil(rand()*mag.length)) int8(ceil(rand()*mag.heigth))]';
                end %while
                mag.map(temp(1), temp(2), temp(3)) = 1;
            end % for
            disp(mag.map);
            psp = mag;
        end          
    end % methods
end     
