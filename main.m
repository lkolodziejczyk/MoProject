function [ output_args ] = main( magazynX,magazynY,magazynZ,P,N,G,M,K,ILE )

%parametry WEJŒCIOWE, definicja i odczytywanie zwejœcia
	%(P)Populacja=liczba osobnikow w populacji, default=50;
	%(N)Niezmienione=% osobnikow przepisywanych 1:1 w g³ównym cyklu, default 20;
	%(G)Genetyka = % osobnikow na których wykonujemy mutacje i krzy¿owanie, default 25;
	%(M)Mutacja = % osobnikow stworzonych poprzez mutacjê, def=40, max=80;
	%(K)Krzy¿owanie =% osobnikow stworzonych przez krzy¿ówanie, def=40, max80;
	%(ILE) Iloœæ populacji = ile du¿ych pêtli robimy.	
    Palety=250;
%	WARUNEK:(jak nie spe³niony, to mo¿na braæ default dla u³atwienia)
if	(N+M+K)~=100
    Disp('warunek nie spe³nony, u¿ywane domyœlne parametry: Niezmienione=20%, Mutacja=40%, Krzy¿owanie=40%');
    N=20;
    M=40;
    K=40;
end;
%generuj magazyn
    obiektMagazyn = magazyn(magazynX,magazynY,magazynZ);
    
%generuj populacje
	generacja_populacji(P,Palety,obiektMagazyn.map);
    
%³aduj populacje
    tablicaPopulacji = loadDataFunction(obiektMagazyn);
    
%du¿a pêtla(po populacjach)
	for i=1:ILE
    
	%GENETYKA, jak pierwsza pêtla to omiñ genetykê
	if(i~=1) 
%%%%%%%%%%%przepisywanie najlepszych osobnikow
		for k=1:(P*N*0.01)
		%	best[k][]=populacja[k][];	
        end;
%%%%%%%%%%przepisanie randomowego z gorszych wynikow
		%ktory=rand z 10% najgorszych wyników
		ktory = P*0,9 + (rand * 2);
        %bad[]=populacja([ktory][]);
%%%%%%%%%%%do krzy¿owania
		for m=1:M
			%mutowane[m][]=populacja[m][]; %pierwsze M osobnikow
			%najlepszych s³u¿y do krzy¿owania potem
        end;
%%%%%%%%%5czyszczenie populacji (tworzenie kolejnej)
		for j=0:P
			%populacja[j][]=0; %czyszczenie tablic nowej populacji
        end;
%%%%%%%%%%przepisywanie najlepszych
        for k=1:(P*N*0.01)
		%	populacja[k][]=best[k][];	
        end;
        %kolejny_osobnik=bad;
            %populacja[(P*N*0.01)+1]=bad[];
%%%%%%%%%%%%%%%Mutowane
        poczatek=(P*N*0.01)+2;
		for ile=poczatek:(poczatek+M*0.01) %zaczynmy w nastêpnym po przepisanych, koñczymy po M% kolejnych
			%populacja[ile][]=Mutacja(mutowanie);
        end;
%%%%%%%%%%%%%Krzy¿owanie
		poczatek2=poczatek+M*0.01+1; %zaczynmy w nastêpnym po zmutowanych, koñczymy po K% kolejnych-> czyli na koñcu
        for ile=poczatek2:P
			%populacja[ile][]=Krzy¿owanie(mutowanie);
        end;
   end;
	%pêtla ma³a (po osobnikach)
		for j=0:P
%%%%%%%%%%%%%%%%%PUDE£KO MAGAZYU
		%populacja[j][]=MAGAZYN(populacja[j])    %przekazujemy osobnika, a
		%w wyniku do otrzymujemy osobnika po przejœciu przezmagazyn wraz z
		%wartoœci¹ funkcji celu
        end;
%%%%%%%%%%%%%%SORTOWANIE TABLICY OSOBNIKOW
	%populacja[][]=sortuj_populacje(populacja[][]); %sortowanie populacji
	%(osobnikow) wg wartoœci funkcji celu: najlepsze (o najmniejszej
	%wartoœci funkcji celu wy¿ej)
	
%%%%%%%%5%ZAPYSYWANIE WYNiKOW.... (?) dla ka¿dej pêtli: min,œr i max
%%%%%%%%wartoœæ funkcji celu 
	%jakas_funkcja_zapisujaca_jakos_wyniki(populacja[][]);
        
    end;    

%%%%%%%%%%% wyœwietlanie wykresu z wczeœniej zapisanych wartoœci min,œr i
%%%%%%%%%%% max
    %plot(odczegoœtam);

   
end