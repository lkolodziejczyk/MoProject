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
    tablicaPopulacji = loadDataFunction(obiektMagazyn,P);
    
%du�a p�tla(po populacjach)
	for i=1:ILE
    
	%GENETYKA, jak pierwsza p�tla to omi� genetyk�
	if(i~=1) 
%%%%%%%%%%%przepisywanie najlepszych osobnikow
		for k=1:1:round(P*N*0.01)
			best(k)=tablicaPopulacji(k);	
        end;
%%%%%%%%%%przepisanie randomowego z gorszych wynikow
		%ktory=rand z 10% najgorszych wynik�w
		ktory = round(P*0.9+(rand*P*0.1));
        bad=tablicaPopulacji(ktory);
%%%%%%%%%%%do krzy�owania
		for m=1:1:round(P*M*0.01)
			mutowanie(m)=tablicaPopulacji(m); %pierwsze M osobnikow
			%najlepszych s�u�y do krzy�owania potem
        end;
%%%%%%%%%%%%%czyszczenie tablicyPopulacji        
        for m=1:1:P
          tablicaPopulacji(m).palletsArray=zeros(Palety,3);
          %cotam jeszcze jest do wyszyczenia?
        end;    
%%%%%%%%%%przepisywanie najlepszych
        for k=1:1:(P*N*0.01)
		tablicaPopulacji(k)=best(k);	
        end;
        %kolejny_osobnik=bad;
           tablicaPopulacji((P*N*0.01)+1)=bad();
%%%%%%%%%%%%%%%Mutowane
        poczatek=round((P*N*0.01)+2);
		for ile=poczatek:1:round(poczatek+M*0.01) %zaczynmy w nast�pnym po przepisanych, ko�czymy po M% kolejnych
			tablicaPopulacji(ile,1) = mutationOfSubject(tablicaPopulacji(ile,1), obiektMagazyn.map);
        end;
%%%%%%%%%%%%%Krzy�owanie
		poczatek2=poczatek+round(M*0.01)+1; %zaczynmy w nast�pnym po zmutowanych, ko�czymy po K% kolejnych-> czyli na ko�cu
        for ile=poczatek2:1:P
			tablicaPopulacji(ile).palletsArray=CrossingOfSubject(mutowanie,Palety,M,P);
        end;
   end;
	
%%%%%%%%%%%%%%%%%PUDE�KO MAGAZYU
        %tablicaPopulacji=deploy(obiektMagazyn,tablicaPopulacji);
		%w wyniku do otrzymujemy tablice osobnik�w po przej�ciu przezmagazyn wraz z
		%warto�ci� funkcji celu
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