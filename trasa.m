classdef trasa
    
    properties
        % cel dla paczki
        destination             %= [x y z],
        path                    %array with coords for each point on the path
        startPoint = [1 1 1];
    end % properties
    
    methods
        % class constructor
        %@param destination - end of path [length
        function tra = trasa(destination)
             tra.destination = destination;
        end % trasa
        
        % get trasa for destination
        %@param magazyn - magazyn object
        function path = get_path(tra, magazyn)
            dest_width = tra.destination(1);
            dest_length = tra.destination(2);
            dest_height = tra.destination(3);
            
            path(1,:) = tra.startPoint;
            
                      
            behind_middle = dest_width > magazyn.width / 2;
            
            path_iterator = 1;
            
            %% go up
            if (behind_middle)
                for path_iterator = path_iterator : magazyn.width
                    path(path_iterator+1, :) = [path_iterator 1 1];
%                 tra.path(i) = [1 1 1];
                end %for
            end %if
            path_iterator = path_iterator + 1;
            
            %% go right
            
            %from which alley you'll place your paczka
            switch mod(int8(dest_length - 1), 3)
                case 1 %left side
                    path_length = dest_length - 1;
                case 2 %right side
                    path_length = dest_length + 1;
                otherwise
                    error('Paczka on alley!');
            
            end %switch
            path
            dlu = length(path)
            path_width = path(length(path), 1)

            for i = 2 : path_length
                path_iterator = path_iterator + 1;
                path(path_iterator, :) = [path_width, i, 1];
            end %for
            
            path_length = path(length(path), 2)
            dest_length
            
            %% go down or up depends on destination width
            if (behind_middle) %go down
                display('true');
                length_diff = path_width - dest_width;
                for i = 1 : length_diff
                    path_iterator = path_iterator + 1;
                    path(path_iterator, :) = [path_width - i, path_length, 1];
                end %if
            else %go up
                
            end %if
            
            
%             magazyn.heigth
%             magazyn.width
%             magazyn.length
        end % get_path
        
        % sets destination
        function set_destination(tra, dest)
            tra.destination = dest;
        end
        
        %checks if destination is empty
        % @param magazyn current magazyn instance
        function cide = check_if_dest_empty(tra, magazyn)
            if ~tra.dest
                return
            end
%             if magazyn.map[tra.dest[0]][tra.dest[1]][tra.dest[2]] == 0
%                 cide = true;
%                 return
%             end
            cide = false;
            return    
        end
        
        % if place is taken find another one
        function fap = find_another_place(tra, magazyn)
            if ~tra.check_if_dest_empty(magazyn)
                % TODO
            end
        end
        
        % calsulates path based on destination
        function cp = calculate_path(tra)
            % TODO
        end

        
        
        
    end % methods
end     