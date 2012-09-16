% object magazyn - create amgazyn object
classdef magazyn
    
    properties
        % 0 w magazynie to puste miejsce
        % 1 to zajete miejsce
        % 8 to pusta sciezka
        % 7 to zajeta sciezka
        heigth;
        width;
        length;
        map;
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
            if width < 10
                width = 10;
                disp('width nie moze byc mniejsze niz 10');
            end
            if length < 4
                length = 4;
                disp('length nie moze byc mniejsze niz 4');
            end
            if heigth < 1
                length = 1;
                disp('heigth nie moze byc mniejsze niz 1');
            end
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
        
        % dispaly maazyn map
        function display_current_state(mag)
            disp(mag.map);
        end % display_current_state
        
        % prepare start state ofmagazyn map (there are some packs there already)
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
        end % prepare start packs         
    end % methods
end     
