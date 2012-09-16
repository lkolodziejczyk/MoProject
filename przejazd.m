classdef przejazd
    
    properties
        % cel dla paczki
        pid; % paczka_id ?
        trasa; % trasa object
        timer; % internal counter for przejazd
        location; % miejsce w ktorym aktuualnie jestesmy
        destination; %= [x y z]
        start = [0 0 0];
        map % current map of magazyn
    end % properties
    
    methods
        % class constructor
        function prz = przejazd(trasa)
            prz.timer = 1;
            prz.trasa = trasa;
            prz.location = prz.start;
            
            
        % TODO
        end % przejazd
        
        % updates map to aviod conflicts
        %@param magazyn.map table
        function prz = update_mag_map(prz, map)
            prz.map = map;
        end  %update_map
        
        
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