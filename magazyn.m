% object magazyn - create amgazyn object
classdef magazyn
    
    properties
        % 0 w magazynie to puste miejsce
        % 1 to zajete miejsce
        % 2 to jest miejsce zaklepane - tylko na potrzeby check_place
        % 8 to pusta sciezka
        % 7 to zajeta sciezka
        heigth;
        width;
        length;
        map;
        wozek_count = 4;
        free_wozek_count;
        paths_offsets = [2 10];
        wozek_start = [0 0];
    end % properties
    
    methods
        %% class constructor
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
            mag.free_wozek_count = mag.wozek_count;
            %disp(mag.map);
        end % magazyn
        
        %% checks if place is empty
        %@param destination place to check
        function ret = check_place(mag, destination)
            dest_width = tra.destination(1);    %destination width
            dest_length = tra.destination(2);   %destination length
            dest_heigth = tra.destination(3);   %destination heigth
            
            
            
            
            ret = destination;
        end
        
        %% check if place is empty
        %@ param destination place to check
        function ret = is_place_occupied(mag, destination)
            ret = mag.map(destination(1), destination(2), destination(3)) == 1;
        end % is_place_empty
        
        %% check if place is reserved
        %@ param destination place to check
        function ret = is_place_reserved(mag, destination)
            ret = mag.map(destination(1), destination(2), destination(3)) == 2;
        end % is_place_reserved
        
        %% dispaly maazyn map
        function display_current_state(mag)
            disp(mag.map);
        end % display_current_state
        
        %% prepare start state ofmagazyn map (there are some packs there already)
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
