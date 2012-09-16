% object magazyn - create amgazyn object
classdef magazyn
    
    properties
        heigth
        width
        length
        map
        wozek_count = 4;
        paths_offsets = [2,10];
    end % properties
    
    methods
        function mag = magazyn(width, length, heigth)
            mag.width = width;
            mag.heigth = heigth;
            mag.length = length;
            mag.map = zeros(width, length, heigth);
            disp(mag.map);
        end
        
        function dcs = display_current_state(mag)
            disp(mag.map);
        end
        
        function psp = prepare_start_packs(mag, limit)
            packs_tab = [];
            for i = 1:limit
                temp = [int8(rand()*mag.width) int8(rand()*mag.length) int8(rand()*mag.heigth)]';
                if ~(ismember(temp, packs_tab))
                    packs_tab = [packs_tab temp];
                end   
            end
            disp(packs_tab);
        end          
    end % methods
end     
