function [ output_args ] = main( magazynX,magazynY,magazynZ,P,N,G,M,K,ILE )

%parametry WEJ�CIOWE, definicja i odczytywanie zwej�cia
	%(P)Populacja=liczba osobnikow w populacji, default=50;
	%(N)Niezmienione=% osobnikow przepisywanych 1:1 w g��wnym cyklu, default 20;
	%(G)Genetyka = % osobnikow na kt�rych wykonujemy mutacje i krzy�owanie, default 25;
	%(M)Mutacja = % osobnikow stworzonych poprzez mutacj�, def=40, max=80;
	%(K)Krzy�owanie =% osobnikow stworzonych przez krzy��wanie, def=40, max80;
	%(ILE) Ilo�� populacji = ile du�ych p�tli robimy.	
    Palety=250;
%	WARUNEK:(jak nie spe�niony, to mo�na bra� default dla u�atwienia)
if	(N+M+K)~=100
    Disp('warunek nie spe�nony, u�ywane domy�lne parametry: Niezmienione=20%, Mutacja=40%, Krzy�owanie=40%');
    N=20;
    M=40;
    K=40;
end;
%generuj magazyn
    obiektMagazyn = magazyn(magazynX,magazynY,magazynZ);
    
%generuj populacje
	generacja_populacji(P,Palety,obiektMagazyn.map);
    
%�aduj populacje
    tablicaPopulacji = loadDataFunction(obiektMagazyn);
    
%du�a p�tla(po populacjach)
	for i=1:ILE
    
	%GENETYKA, jak pierwsza p�tla to omi� genetyk�
	if(i~=1) 
%%%%%%%%%%%przepisywanie najlepszych osobnikow
		for k=1:(P*N*0.01)
		%	best[k][]=populacja[k][];	
        end;
%%%%%%%%%%przepisanie randomowego z gorszych wynikow
		%ktory=rand z 10% najgorszych wynik�w
		ktory = P*0,9 + (rand * 2);
        %bad[]=populacja([ktory][]);
%%%%%%%%%%%do krzy�owania
		for m=1:M
			%mutowane[m][]=populacja[m][]; %pierwsze M osobnikow
			%najlepszych s�u�y do krzy�owania potem
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
		for ile=poczatek:(poczatek+M*0.01) %zaczynmy w nast�pnym po przepisanych, ko�czymy po M% kolejnych
			%populacja[ile][]=Mutacja(mutowanie);
        end;
%%%%%%%%%%%%%Krzy�owanie
		poczatek2=poczatek+M*0.01+1; %zaczynmy w nast�pnym po zmutowanych, ko�czymy po K% kolejnych-> czyli na ko�cu
        for ile=poczatek2:P
			%populacja[ile][]=Krzy�owanie(mutowanie);
        end;
   end;
	%p�tla ma�a (po osobnikach)
		for j=0:P
%%%%%%%%%%%%%%%%%PUDE�KO MAGAZYU
		%populacja[j][]=MAGAZYN(populacja[j])    %przekazujemy osobnika, a
		%w wyniku do otrzymujemy osobnika po przej�ciu przezmagazyn wraz z
		%warto�ci� funkcji celu
        end;
%%%%%%%%%%%%%%SORTOWANIE TABLICY OSOBNIKOW
	%populacja[][]=sortuj_populacje(populacja[][]); %sortowanie populacji
	%(osobnikow) wg warto�ci funkcji celu: najlepsze (o najmniejszej
	%warto�ci funkcji celu wy�ej)
	
%%%%%%%%5%ZAPYSYWANIE WYNiKOW.... (?) dla ka�dej p�tli: min,�r i max
%%%%%%%%warto�� funkcji celu 
	%jakas_funkcja_zapisujaca_jakos_wyniki(populacja[][]);
        
    end;    

%%%%%%%%%%% wy�wietlanie wykresu z wcze�niej zapisanych warto�ci min,�r i
%%%%%%%%%%% max
    %plot(odczego�tam);

   
end