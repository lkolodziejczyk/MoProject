classdef trasa
    
    properties
        % cel dla paczki
        destination;            %= [x y z],
        path;                   %array with coords for each point on the path
        startPoint = [1 1 1];
        magazyn;                %magazyn object
    end % properties
    
    methods
        % class constructor
        %@param destination - end of path [width length height]
        %@param magazyn - magazyn object
        function tra = trasa(destination, magazyn)
            tra.destination = destination;
            tra.magazyn = magazyn;
            
            if (destination(3) > magazyn.heigth)
                error(['Paczka too high! - invalid height: ' num2str(destination(3)), ' is bigger than magazyn height: ', magazyn.heigth]);
            end %if
            
            if (~tra.check_if_dest_empty()) %validation - is destination empty
                error(['Destination: [', num2str(destination(1)), ' ', num2str(destination(2)), ' ', num2str(destination(3)), '] is not empty!']);
            end %if
            
            tra.path = tra.get_path(magazyn);
        end % trasa
        
        % get trasa for destination
        %@param magazyn - magazyn object
        %@return array with coords for each point on the path
        function path = get_path(tra, magazyn)
            dest_width = tra.destination(1);    %destination width
            dest_length = tra.destination(2);   %destination length
            dest_heigth = tra.destination(3);   %destination heigth
            
            path(1,:) = tra.startPoint;         %add start point as first step on our path
                      
            behind_middle = dest_width > magazyn.width / 2;     %check if destination width is above or below midle
            
            if (dest_width == 1 || dest_width == magazyn.width)
                error(['Paczka on alley! - invalid width: ' num2str(dest_width)]);
            end %if
            
            path_iterator = 1;
            
            
            %% go up
            if (behind_middle && dest_length > 2)          %%if detination is above middle the go up
                for i = 1 : magazyn.width
%                     path_iterator = path_iterator + 1;
                    path(path_iterator, :) = [i 1 1];  
                    path_iterator = path_iterator + 1;
                end %for
            end %if
            
            
            %% go right
            
            %from which alley you'll place your paczka
            switch mod(int8(dest_length - 1), 3)
                case 1 %alley on the left from paczka
                    turn_on_length = dest_length - 1;
                case 2 %alley on the right from paczka
                    turn_on_length = dest_length + 1;
                otherwise
                    error(['Paczka on alley! - invalid length: ' num2str(dest_length)]);
            end %switch

            path_width = path(size(path, 1), 1);
            flag = 0;
            
            %go right to the alley when you will turn
            for i = 2 : turn_on_length
                if (behind_middle && dest_length > 2) && flag == 0
                    flag = 1;
                else
                    path_iterator = path_iterator + 1;
                end
                path(path_iterator, :) = [path_width, i, 1];
            end %for
            
            path_length = path(size(path, 1), 2);
            
            %% go down or up depends on destination width
            if (behind_middle && dest_length > 2) %go down
                length_diff = path_width - dest_width;
                for i = 1 : length_diff
                    path_iterator = path_iterator + 1;
                    path(path_iterator, :) = [path_width - i, path_length, 1];
                end %if
            else %go up
                for i = 2 : dest_width
                    path_iterator = path_iterator + 1;
                    path(path_iterator, :) = [i, path_length, 1];
                end %for
            end %if
            
            %% lift package up (height)
            path_width = path(size(path, 1), 1);
            for i = 2 : dest_heigth
                path_iterator = path_iterator + 1;
                path(path_iterator, :) = [path_width, path_length, i];
            end;
        end % get_path
        
        %checks if destination is empty
        %@return boolean - true if empy
        function cide = check_if_dest_empty(tra)
            cide = tra.magazyn.map(tra.destination(1), tra.destination(2), tra.destination(3)) ~= 1;
        end
    end % methods
end     