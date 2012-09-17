% function has takes magazyn and subject list and returns subject list with
% obliczona funkcjia celu XD komentarz
% 
function ret = deploy(magazyn, subject_tab)
   
    paths = cell(0,0);
    %% get_path loop - calculates and appends path for every subject
    for j  = 1:size(subject_tab,1)
        for i = 1:size(subject_tab(j).mainArray, 1)
            %disp(size(subject_tab,1))
            %disp(size(subject_tab(j).mainArray, 1))
            disp(subject_tab(j).mainArray(i, 2:4))
            paths{j}{i} = trasa(subject_tab(j).mainArray(i, 2:4), magazyn); % konstrutor obiektu trasa
                %j - subject
                %i - pack_id
            
            
            %disp(path.path);
            %
            %subject_tab(j).mainArray(i,5) = path;
            %disp(subject_tab(j).mainArray(i,:));
        end % for
    end % for
    
%     paths
%     return;
    
    %% timer loop - not figured out yet
    for j = 1:size(subject_tab)    %for each subject
        magazyn.free_wozek_count = magazyn.wozek_count;
        local_timer = 0;
        subject_timer = 0;
        local_subj_count = size(subject_tab(j).mainArray, 1);
        przejazdy = [];
%         size(przejazdy)
%         disp('madafakaaa')
        local_main_array = subject_tab(j).mainArray;
        pack_id = 0;
        
        
        while local_subj_count      %while there are some packs left
            
            subject_timer = subject_timer + 1;
            
            display('---------------------------------------');
            disp(local_subj_count)
            disp(['Wolne wozki: ', num2str(magazyn.free_wozek_count)]);
            
%             if magazyn.free_wozek_count == 0    %just move other wozki forward
%                 disp('Brak wolnych wozkow');
%                 for przejazd_id = 1:size(przejazdy)
%                     przejazdy(przejazd_id) = przejazdy(przejazd_id).next_timeframe(local_timer);
%                 end % if
%                 local_timer = local_timer + 1;
%                 continue
%             end % if
            
            % TODO manage przezjazds for each pack and synchro it with wozki etc 
            finished = [];
            
            
            %przejazdy
            %finished
            
            %czyszczenie wozków ktore skonczyly trasy
%             for i = finished_id: size(finished)
%                 przejazdy(finished(i)) = [];
%                 magazyn.free_wozek_count = magazyn.free_wozek_count + 1;
%             end  % for
            
%             size(przejazdy)
 %% ok i w tym momoencie mamy przejazdy wyczyszczone ze wszystkich wozkow i oczekujace na nowe 
%  local_main_array
%  aaq = local_main_array(1,1);
%  przejazd(path.path, local_timer, aaq, magazyn.map)
%  return;

%             temp_size = size(local_main_array, 1);
            
                
            for przejazd_id = 1 : size(przejazdy, 2)    % go to next location if empty
                
                display(['OBS£UGA PRZEJADZU NR: ',num2str(przejazd_id)]);
                przejazdy(przejazd_id) = przejazdy(przejazd_id).next_timeframe(local_timer, magazyn.map);
                przejazdy(przejazd_id).map = magazyn.map;
%                 przejazdy(przejazd_id).trasa(przejazdy(przejazd_id).current_trasa_id - 1, :)
%                 przejazdy(przejazd_id).trasa(przejazdy(przejazd_id).current_trasa_id, :)

                
                if przejazdy(przejazd_id).current_trasa_id > 1 %if there was location before
                    display(['-> Przejazd ', num2str(przejazd_id), ' jedzie z/do']);
                    display(przejazdy(przejazd_id).trasa(przejazdy(przejazd_id).current_trasa_id - 1, :));
                    display(przejazdy(przejazd_id).trasa(przejazdy(przejazd_id).current_trasa_id, :));
                    magazyn = magazyn.set_place_from_destination(przejazdy(przejazd_id).trasa(przejazdy(przejazd_id).current_trasa_id - 1, :), 8);    %free last slot
                end %if
                
                magazyn = magazyn.set_place_from_destination(przejazdy(przejazd_id).trasa(przejazdy(przejazd_id).current_trasa_id, :), 7);        %go to new location
                
                
%                 return;
            end %for
            
            true;
            
            %% sprawdzanie czy jakiœ wozek skonczyl trase
%             size(przejazdy)
            for przejazd_id = 1:size(przejazdy, 2)
                
%                 if pack_id == 6
%                     display(['packid6 finished? ', num2str(przejazdy(przejazd_id).check_finished())]);
%                 end
                if strcmp(class(przejazdy(przejazd_id)), 'przejazd') && przejazdy(przejazd_id).check_finished()
                    magazyn.free_wozek_count = magazyn.free_wozek_count + 1;
                    local_subj_count = local_subj_count - 1;
                    display(['Skonczyl przejazd nr ', num2str(przejazd_id)]);
                    magazyn = magazyn.set_place_from_destination(przejazdy(przejazd_id).trasa(przejazdy(przejazd_id).current_trasa_id, :), 8);    %free last slot
                    przejazdy(przejazd_id).destination
                    magazyn = magazyn.set_place_from_destination(przejazdy(przejazd_id).destination, 1);
                    finished(size(finished)+1) = przejazd_id;
                end % if
                
            end % for
            
            
            for finished_przejazd_id = 1 : size(finished)
                przejazdy(finished_przejazd_id) = [];
            end %for
                
            
            
            if (magazyn.is_place_alley(paths{1}{1}.startPoint) && magazyn.free_wozek_count > 0) %get packs for free wozki if start point is free
                pack_id = pack_id + 1;
                display('Biore paczke');
                magazyn.free_wozek_count = magazyn.free_wozek_count - 1;
                nowy_przejazd = przejazd(paths{j}{pack_id}.path, local_timer, local_main_array(1,1), magazyn.map);
                nowy_przejazd.destination = subject_tab(j).mainArray(pack_id, 2:4);
                nowy_przejazd.pack_id = pack_id;
                magazyn.map(nowy_przejazd.location) = 7; % goto location
                przejazdy = [przejazdy nowy_przejazd];
            end %if
            
            true;
                
%                 magazyn.map
                                
                %disp(size(local_main_array))
%                 nowy_przejazd = przejazd(paths{1}{1}, local_timer, local_main_array(1,1), magazyn.map);
%                 magazyn.map(
%                 local_main_array(1,:) = [];

%                 przejazdy = [przejazdy nowy_przejazd];
%                 przejazdy(1).map
%                 display(przejazdy(1).current_trasa_id)
                

%             display(['Czy sa 7 w mag.map: ',num2str(ismember(7, magazyn.map(:,:,1)))]);
%             paths;
%             return;
            
 %% zmiana parametrow istniejacych wozkow od czasu
%             for i = 1:size(przejazdy)
%                 przejazdy(i) = przejazdy(i).next_timeframe(local_timer);
%             end
%             %przejazdy(1).current_trasa_id
%             %przejazdy(1).location
%             if local_timer == 2
%                 break
%             end
%             disp('WWWWWWWWWHAZUUUUUUUPPPPPPPPPPPPPPPPP!!')
%             disp(local_timer);
%             local_timer = local_timer + 1;
            %TODO
        end % while
    end % for
    ret = subject_tab;

end