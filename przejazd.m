classdef przejazd
 %%  
    properties
        % cel dla paczki
        pid; % paczka_id ?
        trasa; % trasa tab
        current_trasa_id;
        %subject;
        sync;
        timer_start; % internal counter for przejazd
        timer_stop; % internal counter for przejazd
        location; % miejsce w ktorym aktuualnie jestesmy
        destination; %= [x y z]
        map; % current map of magazyn
    end % properties
%%
    methods
        %% class constructor
        % @param trasa trasa_object
        % @param time current timer value
        % @param pid paczka_id
        % @param subject subject object
        function prz = przejazd(trasa, time, pid, map)
            prz.timer_start = time;
            prz.sync = time;
            prz.trasa = trasa;
            prz.current_trasa_id = 1;
            prz.location = trasa(prz.current_trasa_id,:);
            prz.pid = pid;
            prz = prz.update_mag_map(map);
            prz.map(prz.trasa(prz.current_trasa_id)) = 7;
            
   
        % TODO
        end % przejazd
        
        %% updates map to aviod conflicts
        %@param magazyn.map table
        function prz = update_mag_map(prz, map)
            prz.map = map;
        end  %update_map
        
        function ret = check_destination(prz, )
            
        % increment timer by 1 
        % @param time current timer 
        function ret = next_timeframe(prz, time)
            prz.sync = time;

                
            
            %prz.location = prz.; % todo
            ret = prz;
            % TODO
        end % next_timeframe
        
        %% check if road ahead is free
        function ret = check_free_road(prz)
            ret = false;
            temp = prz.trasa(prz.current_trasa_id + 1,:);
            disp(prz.map(temp(1), temp(2), temp(3)));
            if prz.map(prz.trasa(prz.current_trasa_id + 1,:)) == 8
                ret = true;
            elseif prz.trasa(prz.current_trasa_id) == prz.trasa(prz.current_trasa_id + 1)
                ret = true;
            end
            %TODO
        end
        
        function ret = check_finished(prz)
            ret = false;
            if prz.current_trasa_id == size(prz.trasa(:,1))
                ret = true;
            else
               ret = false;
            end
            
        end % check_finished
    end % methods
end     