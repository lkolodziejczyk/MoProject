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
        
        %% checks if place is empty - if not, returns next empty place
        % to reserve place use: mag = mag.reserve_place(mag.check_place(destination, max_number_of_attempts));
        %@param destination place to check
        %@param max_number_of_attempts maximum number of tries to find free space
        %@return empty place
        %@throws error when there is no more free slots or max number of
        %               attempts was exceeded
        function ret = check_place(mag, destination, max_number_of_attempts)
            if (mag.is_place_alley(destination))    %if destination is an alley throw error
                error(['Place [', num2str(destination(1)), ' ', num2str(destination(2)), ' ', num2str(destination(3)), '] is an alley!']);
            end;
            
            if (mag.is_place_occupied(destination) || mag.is_place_reserved(destination))   %if place is occupied or reserved
                if (ismember(0, mag.map) == 0)
                    error('There is no more free slots in magazyn!');
                end %if

                new_destination_to_check = destination;
                other_place = mag.check_other_heights_in_destination(new_destination_to_check);     %check other heights in destination place
                number_of_attempts = mag.heigth;
                
                while (other_place == false)        % while other place is non-empty
                    
                    if (number_of_attempts >= max_number_of_attempts)
                        error(['Max number of attempts exceeded: ', num2str(max_number_of_attempts)]);
                    end %if
                    
                    new_destination_to_check(1) = new_destination_to_check(1) + 1;      %increse width
                    
                    if (mag.is_place_alley(new_destination_to_check))                   %if width will be to large, then go to next length and start from first non-alley width
                        new_destination_to_check(1) = 2;
                        
                        new_destination_to_check(2) = new_destination_to_check(2) + 1;  % increase length
                        
                        if (mag.is_place_alley(new_destination_to_check))               % if new place is alley
                            new_destination_to_check(2) = new_destination_to_check(2) + 1; %increase length
                        end %if
                        
                        if (new_destination_to_check(2) > mag.length - 1)               % if length will be too large then go to the first non-alley
                            new_destination_to_check(2) = 2;
                        end %if
                    end %if
                    other_place = mag.check_other_heights_in_destination(new_destination_to_check);     %check other heights in new destination place
                    number_of_attempts = number_of_attempts + mag.heigth;
                end %while
                
                ret = other_place;
            else
                ret = destination;
            end %if
        end %check_place
        
        %% check other heights in destination
        %@param destination
        %@return first free destination or false if all places in
        %   destination are non-empty
        function ret = check_other_heights_in_destination(mag, destination)
            ret = false;
            for i = 1 : mag.heigth
                new_destination = [destination(1), destination(2), i];
                if (~mag.is_place_occupied(new_destination) && ~mag.is_place_reserved(new_destination))
                    ret = new_destination;
                end %if
            end %for
        end %check_other_heights_in_destination
        
        %% reserves given place
        %@param destination
        %@return magazyn object
        function ret = reserve_place(mag, place)
            mag.map(place(1), place(2), place(3)) = 2;
            ret = mag;
        end %reserve_place
        
        %% check if place is occupied
        %@ param destination place to check
        %@ return boolean - true is occupied
        function ret = is_place_occupied(mag, destination)
            ret = mag.map(destination(1), destination(2), destination(3)) == 1;
        end % is_place_empty
        
        %% check if place is reserved
        %@ param destination place to check
        %@ return boolean - true if place is reserved
        function ret = is_place_reserved(mag, destination)
            ret = mag.map(destination(1), destination(2), destination(3)) == 2;
        end % is_place_reserved
        
        %% check if place is alley
        %@ param destination place to check
        %@ return boolean - true if place is an alley
        function ret = is_place_alley(mag, destination)
            ret = mag.map(destination(1), destination(2), destination(3)) == 8;
        end %is_place_alley
        
        %% set value on place from destination paremeter
        %@ param destination place to set
        %@ param value - value to set
        function ret = set_place_from_destination(mag, destination, value)
            mag.map(destination(1), destination(2), 1) = value;
            ret = mag;
        end %set_place_from_destination
        
        %% dispaly magazyn map
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
%             disp(mag.map);
            psp = mag;
        end % prepare start packs         
    end % methods
end     
