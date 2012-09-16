classdef trasa
    
    properties
        % cel dla paczki
        destination %= [x y z]
    end % properties
    
    methods
        % class constructor
        function tra = trasa()
        end % trasa
        
        % get trasa for destination
        function gt = get_path(tra)
            
        end
        
        % sets destination
        function set_destination(tra, dest)
            tra.dest = dest;
        end
        
        %checks if destination is empty
        % @param magazyn current magazyn instance
        function cide = check_if_dest_empty(tra, magazyn)
            if ~tra.dest
                return
            end
            if magazyn.map[tra.dest[0]][tra.dest[1]][tra.dest[2]] == 0
                cide = true;
                return
            end
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