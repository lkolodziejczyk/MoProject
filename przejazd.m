classdef przejazd
 %%  komentarz
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
        pack_id;
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
            prz.trasa
            %disp(prz.trasa(prz.current_trasa_id,:));
%             prz.map(prz.trasa(prz.current_trasa_id,:)) = 7;
            
   
        % TODO
        end % przejazd
        
        %% updates map to aviod conflicts
        %@param magazyn.map table
        function prz = update_mag_map(prz, map)
            prz.map = map;
        end  %update_map

            
        %% increment timer by 1 
        % @param time current timer 
        function ret = next_timeframe(prz, time, map)
            prz.sync = time;
            prz.update_mag_map(map);
            if prz.check_free_road(map)
%                 disp('go')
%                 temp = prz.trasa(prz.current_trasa_id,:);
%                 prz.map(temp(1), temp(2), temp(3)) = 8;
                prz.current_trasa_id  = prz.current_trasa_id + 1;
%                 temp = prz.trasa(prz.current_trasa_id,:);
                prz.location = prz.trasa(prz.current_trasa_id, :);
%                 prz.map(temp(1), temp(2), temp(3)) = 7;
            end % if
                
            
            %prz.location = prz.; % todo
            ret = prz;
            % TODO
        end % next_timeframe
        
        %% check if road ahead is free - works
        function ret = check_free_road(prz, map)
            ret = false;
            if ~prz.check_finished()
                temp = prz.trasa(prz.current_trasa_id + 1,:);

                if map(temp(1), temp(2), temp(3)) == 8
                    ret = true;
                end
 %           elseif prz.trasa(prz.current_trasa_id) == prz.trasa(prz.current_trasa_id + 1)
 %               ret = true;
            end %if
            %TODO
        end % check_free_road
        
        
        %% check if operation is finished - dzia³a
        function ret = check_finished(prz)
            ret = false;
%             display(['Prz.check_finished: ', num2str(prz.current_trasa_id), ' ', num2str(size(prz.trasa,1))]);
            ret = prz.current_trasa_id == size(prz.trasa,1);
            
        end % check_finished
    end % methods
end     