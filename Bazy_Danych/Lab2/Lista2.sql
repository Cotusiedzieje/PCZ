--    **********************************
--    *          BAZY DANYCH           *
--    *                                *
--    *            LISTA 2             *
--    *          25.02.2019r           *
--    **********************************

--1     Zrealizuj poni¿sze zadania poprzez utworzenie zapytañ zwracaj¹cych stosowne informacje w oparciu o aktualne dane 
--      przechowywane w tabeli Studenci

    --1.1      Wyœwietl informacje o liczbie studentek studiów stacjonarnych pierwszego stopnia studiuj¹cych na 
    --         3-im roku informatyki
    
                     select count(*) as "liczba studentek" from studenci
                     where imiona like '%a' and tryb like 'STACJONARNY' and rok=3 and stopien=1 and kierunek like 'INFORMATYKA';
            
    --1.2      Wyœwietl informacje o liczbie Nowakowskich (nazwisko) wœród studentów (w zapytaniu wykorzystaj jedn¹ 
    --         z funkcji: lower lub upper)
    
                     select count(nazwisko) as "liczba Nowakowskich" from studenci
                     where lower(nazwisko) like 'nowak' and imiona not like '%a';
    
    --1.3      Wyœwietl informacje (w ramach jednego zapytania) na temat ogólnej liczby studentów mê¿czyzn, których imiê 
    --         rozpoczyna siê na literê M oraz ile takich imion (ró¿nych) znajduje siê w tabeli
    
                     select count(*) as "liczba studentów na Litere M", count(distinct imiona) as "Liczba ro¿nych imion na M"
                     from studenci where imiona like 'M%' and imiona not like '%a';
    
    --1.4      Wyœwietl uporz¹dkowan¹ alfabetycznie listê zawieraj¹c¹ imiona i nazwiska doktorantów 4-tego roku 
    --         (studia 3-ego stopnia) w postaci pojedynczych ³añcuchów – 
    --         patrz Rys. 1.4 (min. 2 sposoby w tym zastosuj funkcjê concat)
    
                     select concat(nazwisko,concat(' ',imiona)) as "Personalia studentow" from studenci
                     where rok=4 and STOPIEN=3 order by nazwisko;
    
    --1.5      Wyœwietl listê, w ramach której jedna z kolumn bêdzie zwiera³a pierwsze 3 litery imion a druga kolumna ostatnie 
    --         3 litery nazwisk studentów nieposiadaj¹cych zdefiniowanej specjalnoœci
    
                     select substr(imiona,1,3) as "3 litery imiona", 
                     substr(nazwisko,length(nazwisko)-2,length(nazwisko)) as "3 ostatnie litery nazwiska",
                     imiona, nazwisko from studenci where specjalnosc is null;
                     
    --1.6      Wyœwietl listê zawieraj¹c¹ nazwiska i imiona studentów wraz z ich inicja³ami w formie 'A.A.', których ³¹czna 
    --         liczba liter w imieniu i nazwisku wynosi 9, 11 lub 13
    
                     select substr(nazwisko,1,1)||'.'||substr(imiona,1,1)||'.' as "Inicialy",imiona, nazwisko,length(concat(nazwisko,imiona))
                     as "£¹czna suma liter"
                     from studenci where length(concat(nazwisko,imiona)) IN(9,11,13);
                     
    --1.7      Wyœwietl listê zawieraj¹c¹ kierunki studiów reprezentowane przez studentów w formie pierwsza litera ka¿dego 
    --         wyrazu bêdzie du¿a a pozosta³e ma³e oraz tylko pierwsza litera bêdzie du¿a a pozosta³e ma³e (patrz Rys. 1.7); 
    --         zadanie wykonaj na 2 sposoby poprzez zastosowanie funkcji Initcap i Concat
 
                     select distinct initcap(kierunek) as Kierunek from studenci;
                     select distinct Concat(Upper(Substr(kierunek,1,1)),lower(substr(kierunek,2,length(kierunek)-1))) Kierunek
                     from studenci;

    --1.8      Wyœwietl listê, w ramach której pierwsza kolumna bêdzie zawieraæ nazwiska studentów bez pierwszych dwóch liter 
    --         'Ko' a druga kolumna imiona tych studentów bez dwóch ostatnich liter 'sz' (patrz Rys. 1.8). 
    --         Oznacza to, ¿e w wyniku nale¿y uwzglêdniæ tylko studentów, których nazwiska rozpoczynaj¹ siê na 'Ko' a imiona 
    --         koñcz¹ na 'sz' (bez zastosowania funkcji substr)
 
                     select Replace(nazwisko,'Ko') as "nazwisko bez KO", replace(imiona,'sz') as "imie bez SZ",
                     concat(nazwisko,concat(' ',imiona)) as "Personalia"
                     from studenci
                     where nazwisko like 'Ko%' and imiona like '%sz';
 
    --1.9      Wyœwietl listê studentów 2-ego roku, których nazwiska sk³adaj¹ siê od 6 do 9 liter, z których przynajmniej 
    --         jedna litera to a, wraz z informacj¹ o liczbie liter w nazwisku oraz pozycji wyst¹pienia pierwszej litery A 
    --         (patrz Rys. 1.9). Lista ma byæ uporz¹dkowana nierosn¹co wg liczby liter w nazwisku.
    
                     select nazwisko, length(nazwisko) as Liczba_liter,
                     instr(nazwisko,'a',1,1) as "Pozycja A w nazwisku" from studenci
                     where rok=2 and length(nazwisko) between 6 and 9 and nazwisko like '%a%'
                     order by Liczba_liter desc;
 
    --1.10     Wyœwietl listê (patrz Rys. 1.10) zawieraj¹c¹ zmodyfikowane nazwiska i imiona studentek, których nazwiska 
    --         rozpoczynaj¹ siê od liter Ba (bez zastosowania funkcji substr): 
    --
    --         ->   zamiast Ba na pocz¹tku nazwiska wstaw formu³ê 'Start', 
    --         ->   zamiast litery a na koñcu imienia staw formu³ê 'End'.
 
                     select nazwisko, Replace(nazwisko,'Ba','Start') as "Po zmianie", imiona,
                     concat(Rtrim(imiona,'a'),'End') as "Po zmianie im" from studenci
                     where nazwisko like 'Ba%' and imiona like '%a';
 
    --1.11     Wykorzystuj¹c funkcje Rpad() i Lpad() wyœwietl nazwiska studentów poprzedzone 3 gwiazdkami (*) oraz 
    --         zakoñczone 4 plusikami (+)  (patrz Rys. 1.11)
    
                     select rpad(lpad(nazwisko,length(nazwisko)+3,'*'),
                     length(nazwisko)+7,'+') as "Nazwisko po zmianie" from studenci;
    
--2     Zrealizuj poni¿sze zadania poprzez utworzenie zapytañ zwracaj¹cych stosowne informacje w oparciu o aktualne dane 
--      przechowywane w tabeli Pojazdy

    --2.1      Wyœwietl wszystkie pojazdy zarejestrowane w Czêstochowie (o numerach rejestracyjnych rozpoczynaj¹cych siê od  SC 
    --         i posiadaj¹cych cyfry na 3-ich pozycjach, np. SCZ to powiat czêstochowski a nie miasto:)) o pojemnoœciach 
    --         silników mieszcz¹cych siê w przedziale od 1000 do 2000 cm3 
    
    -- ******************************* WERSJA 1 ******************************* 
    
                     select * from pojazdy where nr_rejestr  between 'SC0%' and 'SC9%' and pojemnosc Between 1000 and 2000;
    
    -- ******************************* WERSJA 2 ******************************* 
    
                     select * from pojazdy
                     where nr_rejestr like 'SC%' and
                     substr(nr_rejestr,3,1) in ('0','1','2','3','4','5','6','7','8','9')
                     and pojemnosc between 1000 and 2000;

    --2.2      Wyœwietl pojazdy marki Ford w kolorze metalik (np. zielony metalik), których liczby utworzone przez dwie ostatnie 
    --         cyfry numeru rejestracyjnego dziel¹ siê przez liczbê 3 np. SC12345 ? 45 / 3 =15 (patrz Rys. 2.2). 
    --         Wszystkie numery rejestracyjne koñcz¹ siê siê 3 lub 4-ma cyframi (konwersja na liczbê ? to_number()).
    
                     select nr_rejestr ,substr(nr_rejestr,length(nr_rejestr)-3,2) as "LICZBA", kolor,marka
                     from pojazdy where marka like 'Ford' and kolor like '%metalik%' and 
                     (to_number(substr(nr_rejestr,length(nr_rejestr)-3,1))+ to_number(substr(nr_rejestr,length(nr_rejestr)-2,1)))/3 in(0,3,6,9);
    
    --2.3      Wyœwietl wszystkie motocykle posiadaj¹ce w numerach rejestracyjnych przynajmniej dwie cyfry 6 (np. SCZ1626), 
    --         których kolory okreœlaj¹ przynajmniej dwucz³onowe nazwy (np. zielony metalik) a pojemnoœci silników nie 
    --         mieszcz¹ siê w przedziale od  250 do 500 (patrz Rys. 3.3).

    --2.4      Wyœwietl wszystkie pojazdy innego typu ni¿ samochod ciezarowy maj¹ce pojemnoœci silnika równe 1000, 2000 lub 3000
    --         wraz z komentarzami w zakresie oceny tego parametru (Rys. 2.4):  
    --         ->   maly pojazd  wobec pojazdów o pojemnoœci 1000, 
    --         ->   sredni pojazd  wobec pojazdów o pojemnoœci 2000, 
    --         ->   duzy pojazd  wobec pojazdów o pojemnoœci 3000.
    
                     select marka,modell,typ,pojemnosc,decode(pojemnosc,1000,'maly pojazd',2000,'sredni samochod',
                     3000,'duzy samochod') as "ROZMIAR" from pojazdy
                     where typ not like 'samochod ciezarowy' and pojemnosc in(1000,2000,3000);
    
    --2.5      W oparciu o analizê numerów rejestracyjnych zidentyfikuj pochodzenie pojazdów marki Opel o pojemnoœciach 
    --         silnia nie nale¿¹cych do przedzia³u [1600, 2200]. W procesie klasyfikacji pojazdów uwzglêdniaj dwie pierwsze 
    --         litery numerów rejestracyjnych wg nastêpuj¹cych zasad (patrz Rys. 2.5): 
    --         ->   SC (równoczeœnie SCZ), 
    --         ->   SK –  slaskie, 
    --         ->   OP – opolskie, 
    --         ->   DW – dolnoslaskie, 
    --         ->   KR – malopolskie, 
    --         ->   inne  – niezidentyfikowane.
 
                     select nr_rejestr, modell, pojemnosc, 
                     decode(substr(nr_rejestr,1,2),'SC','slaskie','OP','opolskie','DW','dolnoslaskie','KR','malopolskie','niezindyfikowany')
                     as województwo from pojazdy
                     where marka like 'Opel' and pojemnosc not between 1600 and 2200;
 
--3     Zrealizuj poni¿sze zadania poprzez utworzenie zapytañ zwracaj¹cych stosowne informacje w oparciu o aktualne dane 
--      przechowywane w tabeli Rejestry. 

    --3.1      W postaci jednego zdania (jak na Rys. 3.1) wyœwietl informacjê od kiedy do kiedy odnotowywano zdarzenia po³owów 
    --         ryb, ile by³o wszystkich takich zdarzeñ w tym ile by³o udanych po³owów (okreœlona wartoœæ kolumny id_gatunku) 
    --         oraz wody ilu zarz¹dców odwiedzili wêdkarze (za³o¿enie: elementem identyfikuj¹cym zarz¹dców wód jest pierwszy 
    --         znak identyfikatora ³owiska czyli id_lowiska).
    
                     select 'od '||Trunc(Min(czas))||' do '||Trunc(Max(czas))||
                     ' odnotowano '||Count(czas)||' polowow w tym udanych '||
                     Count(id_gatunku)||' na wodach '|| count(distinct(substr(id_lowiska,1,1)))|| 'zarzadcow.'
                     from rejestry;
    
    --3.2      Wyœwietl listê zawieraj¹c¹ wszystkie po³owy dotycz¹ce ryb o identyfikatorach (id_gatunku) 1, 3, 9 lub 10 z³owione 
    --         na wodach zarz¹dzanych przez PZW Czêstochowa (id_lowiska rozpoczynaj¹ce siê od litery C) o d³ugoœciach od 40 do 60 cm.,
    --         których waga zosta³a ustalona z precyzj¹ nie wiêksz¹ ni¿ 0.1 (1.0 kg czy 1.1 kg jest ok ale 1.05 kg. ju¿ nie; 
    --         patrz Rys. 3.2).
    
                     select * from rejestry
                     where id_gatunku in (1,3,9,10) and id_lowiska like 'C%' and 
                     dlugosc between 40 and 60 and mod(waga,0.1)=0;
    
    --3.3      Wyœwietl statystyki po³owów gatunku o identyfikatorze 1 w zakresie liczby z³owionych sztuk, liczby ³owców 
    --         (ró¿nych wêdkarzy, którzy z³owili ten gatunek), liczby ³owisk (ró¿nych ³owisk, na których odnotowano po³ów tego gatunku),
    --         ³¹cznej wagi wszystkich z³owionych ryb oraz ich œredniej wagi (z dok³adnoœci¹ do 1 grama) i œredniej d³ugoœci 
    --         (z dok³adnoœci¹ do 1 cm.; patrz Rys. 3.3).   
 
                     select count(*) as "LICZBA RYB",
                     count(distinct id_wedkarza) as "LICZBA £OWCÓW",
                     count(distinct id_lowiska) as "LICZBA £OWISK",
                     sum(waga) as "£¥CZNA WAGA",
                     round(avg(waga),3) as "ŒREDNIA WAGA",
                     round(avg(dlugosc)) as "ŒREDNIA D£UGOŒÆ"
                     from rejestry;
 
    --3.4      Wyœwietl podstawowe informacje zwi¹zane z wpisami dotycz¹cymi zdarzeñ z³owienia ryb o nastêpuj¹cych identyfikatorach 
    --         2 (lin), 4 (amur), 15 (ploc), 17 (okon) oraz dotycz¹cymi nieudanych po³owów (nieokreœlona wartoœæ id_gatunku ? brak polowu).
    --         Informacje podaj w formie: dzien polowu, id_gatunku oraz s³owna nazwa gatunku (patrz Rys. 3.4).  
 
                     select trunc(czas) as "dzien polowu",id_gatunku, decode(id_gatunku,2,'lin',4,'amur',15,'ploc',17,'okon','Brak polowu')
                     from rejestry where id_gatunku in(2,4,15,17) or id_gatunku is null
                     order by czas desc;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 