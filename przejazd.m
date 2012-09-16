classdef przejazd
    
    properties
        % cel dla paczki
        pid % paczka_id ?
        trasa % trasa object
        timer % internal counter for przejazd
        location % miejsce w ktorym aktuualnie jestesmy
        destination %= [x y z]
    end % properties
    
    methods
        % class constructor
        function prz = przejazd()
        % TODO
        end % przejazd
        
        % increment timer by 1 
        function nt = next_timeframe(prz)
            % TODO
        end % next_timeframe
        
        % check if road ahead is free
        function cfr = check_free_road(prz)
            %TODO
        end
        
        
    end % methods
end     