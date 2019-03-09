--    **********************************
--    *          BAZY DANYCH           *
--    *                                *
--    *            LISTA 2             *
--    *          25.02.2019r           *
--    **********************************

--1     Zrealizuj poni�sze zadania poprzez utworzenie zapyta� zwracaj�cych stosowne informacje w oparciu o aktualne dane 
--      przechowywane w tabeli Studenci

    --1.1      Wy�wietl informacje o liczbie studentek studi�w stacjonarnych pierwszego stopnia studiuj�cych na 
    --         3-im roku informatyki
    
                     select count(*) as "liczba studentek" from studenci
                     where imiona like '%a' and tryb like 'STACJONARNY' and rok=3 and stopien=1 and kierunek like 'INFORMATYKA';
            
    --1.2      Wy�wietl informacje o liczbie Nowakowskich (nazwisko) w�r�d student�w (w zapytaniu wykorzystaj jedn� 
    --         z funkcji: lower lub upper)
    
                     select count(nazwisko) as "liczba Nowakowskich" from studenci
                     where lower(nazwisko) like 'nowak' and imiona not like '%a';
    
    --1.3      Wy�wietl informacje (w ramach jednego zapytania) na temat og�lnej liczby student�w m�czyzn, kt�rych imi� 
    --         rozpoczyna si� na liter� M oraz ile takich imion (r�nych) znajduje si� w tabeli
    
                     select count(*) as "liczba student�w na Litere M", count(distinct imiona) as "Liczba ro�nych imion na M"
                     from studenci where imiona like 'M%' and imiona not like '%a';
    
    --1.4      Wy�wietl uporz�dkowan� alfabetycznie list� zawieraj�c� imiona i nazwiska doktorant�w 4-tego roku 
    --         (studia 3-ego stopnia) w postaci pojedynczych �a�cuch�w � 
    --         patrz Rys. 1.4 (min. 2 sposoby w tym zastosuj funkcj� concat)
    
                     select concat(nazwisko,concat(' ',imiona)) as "Personalia studentow" from studenci
                     where rok=4 and STOPIEN=3 order by nazwisko;
    
    --1.5      Wy�wietl list�, w ramach kt�rej jedna z kolumn b�dzie zwiera�a pierwsze 3 litery imion a druga kolumna ostatnie 
    --         3 litery nazwisk student�w nieposiadaj�cych zdefiniowanej specjalno�ci
    
                     select substr(imiona,1,3) as "3 litery imiona", 
                     substr(nazwisko,length(nazwisko)-2,length(nazwisko)) as "3 ostatnie litery nazwiska",
                     imiona, nazwisko from studenci where specjalnosc is null;
                     
    --1.6      Wy�wietl list� zawieraj�c� nazwiska i imiona student�w wraz z ich inicja�ami w formie 'A.A.', kt�rych ��czna 
    --         liczba liter w imieniu i nazwisku wynosi 9, 11 lub 13
    
                     select substr(nazwisko,1,1)||'.'||substr(imiona,1,1)||'.' as "Inicialy",imiona, nazwisko,length(concat(nazwisko,imiona))
                     as "��czna suma liter"
                     from studenci where length(concat(nazwisko,imiona)) IN(9,11,13);
                     
    --1.7      Wy�wietl list� zawieraj�c� kierunki studi�w reprezentowane przez student�w w formie pierwsza litera ka�dego 
    --         wyrazu b�dzie du�a a pozosta�e ma�e oraz tylko pierwsza litera b�dzie du�a a pozosta�e ma�e (patrz Rys. 1.7); 
    --         zadanie wykonaj na 2 sposoby poprzez zastosowanie funkcji Initcap i Concat
 
                     select distinct initcap(kierunek) as Kierunek from studenci;
                     select distinct Concat(Upper(Substr(kierunek,1,1)),lower(substr(kierunek,2,length(kierunek)-1))) Kierunek
                     from studenci;

    --1.8      Wy�wietl list�, w ramach kt�rej pierwsza kolumna b�dzie zawiera� nazwiska student�w bez pierwszych dw�ch liter 
    --         'Ko' a druga kolumna imiona tych student�w bez dw�ch ostatnich liter 'sz' (patrz Rys. 1.8). 
    --         Oznacza to, �e w wyniku nale�y uwzgl�dni� tylko student�w, kt�rych nazwiska rozpoczynaj� si� na 'Ko' a imiona 
    --         ko�cz� na 'sz' (bez zastosowania funkcji substr)
 
                     select Replace(nazwisko,'Ko') as "nazwisko bez KO", replace(imiona,'sz') as "imie bez SZ",
                     concat(nazwisko,concat(' ',imiona)) as "Personalia"
                     from studenci
                     where nazwisko like 'Ko%' and imiona like '%sz';
 
    --1.9      Wy�wietl list� student�w 2-ego roku, kt�rych nazwiska sk�adaj� si� od 6 do 9 liter, z kt�rych przynajmniej 
    --         jedna litera to a, wraz z informacj� o liczbie liter w nazwisku oraz pozycji wyst�pienia pierwszej litery A 
    --         (patrz Rys. 1.9). Lista ma by� uporz�dkowana nierosn�co wg liczby liter w nazwisku.
    
                     select nazwisko, length(nazwisko) as Liczba_liter,
                     instr(nazwisko,'a',1,1) as "Pozycja A w nazwisku" from studenci
                     where rok=2 and length(nazwisko) between 6 and 9 and nazwisko like '%a%'
                     order by Liczba_liter desc;
 
    --1.10     Wy�wietl list� (patrz Rys. 1.10) zawieraj�c� zmodyfikowane nazwiska i imiona studentek, kt�rych nazwiska 
    --         rozpoczynaj� si� od liter Ba (bez zastosowania funkcji substr): 
    --
    --         ->   zamiast Ba na pocz�tku nazwiska wstaw formu�� 'Start', 
    --         ->   zamiast litery a na ko�cu imienia staw formu�� 'End'.
 
                     select nazwisko, Replace(nazwisko,'Ba','Start') as "Po zmianie", imiona,
                     concat(Rtrim(imiona,'a'),'End') as "Po zmianie im" from studenci
                     where nazwisko like 'Ba%' and imiona like '%a';
 
    --1.11     Wykorzystuj�c funkcje Rpad() i Lpad() wy�wietl nazwiska student�w poprzedzone 3 gwiazdkami (*) oraz 
    --         zako�czone 4 plusikami (+)  (patrz Rys. 1.11)
    
                     select rpad(lpad(nazwisko,length(nazwisko)+3,'*'),
                     length(nazwisko)+7,'+') as "Nazwisko po zmianie" from studenci;
    
--2     Zrealizuj poni�sze zadania poprzez utworzenie zapyta� zwracaj�cych stosowne informacje w oparciu o aktualne dane 
--      przechowywane w tabeli Pojazdy

    --2.1      Wy�wietl wszystkie pojazdy zarejestrowane w Cz�stochowie (o numerach rejestracyjnych rozpoczynaj�cych si� od  SC 
    --         i posiadaj�cych cyfry na 3-ich pozycjach, np. SCZ to powiat cz�stochowski a nie miasto:)) o pojemno�ciach 
    --         silnik�w mieszcz�cych si� w przedziale od 1000 do 2000 cm3 
    
    -- ******************************* WERSJA 1 ******************************* 
    
                     select * from pojazdy where nr_rejestr  between 'SC0%' and 'SC9%' and pojemnosc Between 1000 and 2000;
    
    -- ******************************* WERSJA 2 ******************************* 
    
                     select * from pojazdy
                     where nr_rejestr like 'SC%' and
                     substr(nr_rejestr,3,1) in ('0','1','2','3','4','5','6','7','8','9')
                     and pojemnosc between 1000 and 2000;

    --2.2      Wy�wietl pojazdy marki Ford w kolorze metalik (np. zielony metalik), kt�rych liczby utworzone przez dwie ostatnie 
    --         cyfry numeru rejestracyjnego dziel� si� przez liczb� 3 np. SC12345 ? 45 / 3 =15 (patrz Rys. 2.2). 
    --         Wszystkie numery rejestracyjne ko�cz� si� si� 3 lub 4-ma cyframi (konwersja na liczb� ? to_number()).
    
                     select nr_rejestr ,substr(nr_rejestr,length(nr_rejestr)-3,2) as "LICZBA", kolor,marka
                     from pojazdy where marka like 'Ford' and kolor like '%metalik%' and 
                     (to_number(substr(nr_rejestr,length(nr_rejestr)-3,1))+ to_number(substr(nr_rejestr,length(nr_rejestr)-2,1)))/3 in(0,3,6,9);
    
    --2.3      Wy�wietl wszystkie motocykle posiadaj�ce w numerach rejestracyjnych przynajmniej dwie cyfry 6 (np. SCZ1626), 
    --         kt�rych kolory okre�laj� przynajmniej dwucz�onowe nazwy (np. zielony metalik) a pojemno�ci silnik�w nie 
    --         mieszcz� si� w przedziale od  250 do 500 (patrz Rys. 3.3).

    --2.4      Wy�wietl wszystkie pojazdy innego typu ni� samochod ciezarowy maj�ce pojemno�ci silnika r�wne 1000, 2000 lub 3000
    --         wraz z komentarzami w zakresie oceny tego parametru (Rys. 2.4):  
    --         ->   maly pojazd  wobec pojazd�w o pojemno�ci 1000, 
    --         ->   sredni pojazd  wobec pojazd�w o pojemno�ci 2000, 
    --         ->   duzy pojazd  wobec pojazd�w o pojemno�ci 3000.
    
                     select marka,modell,typ,pojemnosc,decode(pojemnosc,1000,'maly pojazd',2000,'sredni samochod',
                     3000,'duzy samochod') as "ROZMIAR" from pojazdy
                     where typ not like 'samochod ciezarowy' and pojemnosc in(1000,2000,3000);
    
    --2.5      W oparciu o analiz� numer�w rejestracyjnych zidentyfikuj pochodzenie pojazd�w marki Opel o pojemno�ciach 
    --         silnia nie nale��cych do przedzia�u [1600, 2200]. W procesie klasyfikacji pojazd�w uwzgl�dniaj dwie pierwsze 
    --         litery numer�w rejestracyjnych wg nast�puj�cych zasad (patrz Rys. 2.5): 
    --         ->   SC (r�wnocze�nie SCZ), 
    --         ->   SK �  slaskie, 
    --         ->   OP � opolskie, 
    --         ->   DW � dolnoslaskie, 
    --         ->   KR � malopolskie, 
    --         ->   inne  � niezidentyfikowane.
 
                     select nr_rejestr, modell, pojemnosc, 
                     decode(substr(nr_rejestr,1,2),'SC','slaskie','OP','opolskie','DW','dolnoslaskie','KR','malopolskie','niezindyfikowany')
                     as wojew�dztwo from pojazdy
                     where marka like 'Opel' and pojemnosc not between 1600 and 2200;
 
--3     Zrealizuj poni�sze zadania poprzez utworzenie zapyta� zwracaj�cych stosowne informacje w oparciu o aktualne dane 
--      przechowywane w tabeli Rejestry. 

    --3.1      W postaci jednego zdania (jak na Rys. 3.1) wy�wietl informacj� od kiedy do kiedy odnotowywano zdarzenia po�ow�w 
    --         ryb, ile by�o wszystkich takich zdarze� w tym ile by�o udanych po�ow�w (okre�lona warto�� kolumny id_gatunku) 
    --         oraz wody ilu zarz�dc�w odwiedzili w�dkarze (za�o�enie: elementem identyfikuj�cym zarz�dc�w w�d jest pierwszy 
    --         znak identyfikatora �owiska czyli id_lowiska).
    
                     select 'od '||Trunc(Min(czas))||' do '||Trunc(Max(czas))||
                     ' odnotowano '||Count(czas)||' polowow w tym udanych '||
                     Count(id_gatunku)||' na wodach '|| count(distinct(substr(id_lowiska,1,1)))|| 'zarzadcow.'
                     from rejestry;
    
    --3.2      Wy�wietl list� zawieraj�c� wszystkie po�owy dotycz�ce ryb o identyfikatorach (id_gatunku) 1, 3, 9 lub 10 z�owione 
    --         na wodach zarz�dzanych przez PZW Cz�stochowa (id_lowiska rozpoczynaj�ce si� od litery C) o d�ugo�ciach od 40 do 60 cm.,
    --         kt�rych waga zosta�a ustalona z precyzj� nie wi�ksz� ni� 0.1 (1.0 kg czy 1.1 kg jest ok ale 1.05 kg. ju� nie; 
    --         patrz Rys. 3.2).
    
                     select * from rejestry
                     where id_gatunku in (1,3,9,10) and id_lowiska like 'C%' and 
                     dlugosc between 40 and 60 and mod(waga,0.1)=0;
    
    --3.3      Wy�wietl statystyki po�ow�w gatunku o identyfikatorze 1 w zakresie liczby z�owionych sztuk, liczby �owc�w 
    --         (r�nych w�dkarzy, kt�rzy z�owili ten gatunek), liczby �owisk (r�nych �owisk, na kt�rych odnotowano po��w tego gatunku),
    --         ��cznej wagi wszystkich z�owionych ryb oraz ich �redniej wagi (z dok�adno�ci� do 1 grama) i �redniej d�ugo�ci 
    --         (z dok�adno�ci� do 1 cm.; patrz Rys. 3.3).   
 
                     select count(*) as "LICZBA RYB",
                     count(distinct id_wedkarza) as "LICZBA �OWC�W",
                     count(distinct id_lowiska) as "LICZBA �OWISK",
                     sum(waga) as "��CZNA WAGA",
                     round(avg(waga),3) as "�REDNIA WAGA",
                     round(avg(dlugosc)) as "�REDNIA D�UGO��"
                     from rejestry;
 
    --3.4      Wy�wietl podstawowe informacje zwi�zane z wpisami dotycz�cymi zdarze� z�owienia ryb o nast�puj�cych identyfikatorach 
    --         2 (lin), 4 (amur), 15 (ploc), 17 (okon) oraz dotycz�cymi nieudanych po�ow�w (nieokre�lona warto�� id_gatunku ? brak polowu).
    --         Informacje podaj w formie: dzien polowu, id_gatunku oraz s�owna nazwa gatunku (patrz Rys. 3.4).  
 
                     select trunc(czas) as "dzien polowu",id_gatunku, decode(id_gatunku,2,'lin',4,'amur',15,'ploc',17,'okon','Brak polowu')
                     from rejestry where id_gatunku in(2,4,15,17) or id_gatunku is null
                     order by czas desc;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 