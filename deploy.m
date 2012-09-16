% function has takes magazyn and subject list and returns subject list with
% obliczona funkcjia celu XD
% 
function deploy(magazyn, subject_tab)
   
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
        local_timer = 0;
        local_subj_count = size(subject_tab(i));
        przejazdy = [];
        local_main_array = subject_tab(i).mainArray;
        while local_subj_count
            if magazyn.free_wozek_count == 0
                local_timer =+ 1;
                continue
            end
            % TODO manage przezjazds for each pack and synchro it with wozki etc 
            finished = [];
            % sprawdzanie czy jakiœ wozek sponczyl trase
            for i = 1:size(przejazdy)
                if przejazdy(i).check_finished()
                    finished = [finished i];
                end % if
            end % for
            
            %czyszczenie wozków ktore skonczyly trasy
            for i = 1: size(finished)
                przejazdy(finished(i)) = [];
                magazyn.free_wozek_count =+ 1;
            end  % for
 %% ok i w tym momoencie mamy przejazdy wyczyszczone ze wszystkich wozkow i oczekujace na nowe         
            
            
            magazyn.free_wozek_count =-1;
            a = przejazd(local_main_array(1,5), local_timer, local_main_array(1,1));
            local_main_array(1,:) = [];
            
            przejazdy = [przejazdy a];
            
            local_timer =+ 1;
            %TODO
        end % while
    end % for

end