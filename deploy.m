% function has takes magazyn and subject list and returns subject list with
% obliczona funkcjia celu XD
% 
function ret = deploy(magazyn, subject_tab)
   
    %% get_path loop - calculates and appends path for every subject
    for j  = 1:size(subject_tab,1)
        for i = 1:size(subject_tab(j).mainArray, 1)
            %disp(size(subject_tab,1))
            %disp(size(subject_tab(j).mainArray, 1))
            %disp(subject_tab(j).mainArray(i, 2:4))
            path = trasa(subject_tab(j).mainArray(i, 2:4), magazyn); % konstrutor obiektu trasa
            %disp(path.path);
            %
            %subject_tab(j).mainArray(i,5) = path;
            %disp(subject_tab(j).mainArray(i,:));
        end % for
    end % for
    
    %% timer loop - not figured out yet
    for i =  1:size(subject_tab)
        magazyn.free_wozek_count = magazyn.wozek_count;
        local_timer = 0;
        local_subj_count = size(subject_tab(i).mainArray,1);
        przejazdy = [];
        size(przejazdy)
        disp('madafakaaa')
        local_main_array = subject_tab(i).mainArray;
        disp(local_subj_count)
        while local_subj_count
            if magazyn.free_wozek_count == 0
                for i = 1:size(przejazdy)
                    przejazdy(i) = przejazdy(i).next_timeframe(local_timer);
                end % if
                local_timer = local_timer + 1;
                continue
            end % if
            % TODO manage przezjazds for each pack and synchro it with wozki etc 
            finished = [];
            %% sprawdzanie czy jakiœ wozek skonczyl trase
            %size(przejazdy)
            for i = 1:size(przejazdy)
                if przejazdy(i).check_finished()
                    finished = [finished i];
                end % if
            end % for
            %przejazdy
            %finished
            
            %czyszczenie wozków ktore skonczyly trasy
            for i = 1: size(finished)
                przejazdy(finished(i)) = [];
                magazyn.free_wozek_count = magazyn.free_wozek_count + 1;
            end  % for
 %% ok i w tym momoencie mamy przejazdy wyczyszczone ze wszystkich wozkow i oczekujace na nowe         
            temp_size = size(local_main_array, 1);
            if temp_size
                magazyn.free_wozek_count = magazyn.free_wozek_count - 1;
                %disp(size(local_main_array))
                a = przejazd(path.path, local_timer, local_main_array(1,1), magazyn.map);
                local_main_array(1,:) = [];

                przejazdy = [przejazdy a];
                %przejazdy(1)
            end
 %% zmiana parametrow istniejacych wozkow od czasu
            for i = 1:size(przejazdy)
                przejazdy(i) = przejazdy(i).next_timeframe(local_timer);
            end
            %przejazdy(1).current_trasa_id
            %przejazdy(1).location
            if local_timer == 2
                break
            end
            disp('WWWWWWWWWHAZUUUUUUUPPPPPPPPPPPPPPPPP!!')
            disp(local_timer);
            local_timer = local_timer + 1;
            %TODO
        end % while
    end % for
    ret = subject_tab;

end