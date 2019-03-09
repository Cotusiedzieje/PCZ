--    **********************************
--    *          BAZY DANYCH           *
--    *     SPRAWDè JAK TO DZIALA      *
--    *            LISTA 2             *
--    **********************************



SELECT * FROM STUDENCI WHERE rok=1 OR rok=2 OR rok=3; 
SELECT * FROM STUDENCI WHERE rok BETWEEN 1 AND 3; 
SELECT * FROM STUDENCI WHERE rok IN (1,2,3); 
SELECT * FROM STUDENCI WHERE rok BETWEEN 1 AND 3 AND (gr_dziekan=1 OR gr_dziekan=3); 
SELECT * FROM STUDENCI WHERE kierunek='INFORMATYKA'; 
SELECT * FROM STUDENCI WHERE kierunek LIKE 'INFORMATYKA'; 
SELECT nazwisko, imiona, kierunek, rok FROM STUDENCI WHERE kierunek LIKE 'INFORMATYKA' ORDER BY nazwisko, 2 DESC; 
SELECT DISTINCT(kierunek) FROM STUDENCI WHERE kierunek NOT LIKE 'INFORMATYKA'; 
SELECT DISTINCT(imiona) FROM STUDENCI WHERE imiona LIKE 'A_a%a'; 
SELECT DISTINCT(imiona) FROM STUDENCI WHERE imiona BETWEEN 'K%' AND 'M%' ORDER BY 1; 
SELECT nazwisko||' '||imiona||' studiuje na kierunku '||kierunek Opis FROM STUDENCI; 
SELECT nazwisko||' '||imiona||' studiuje na kierunku '||kierunek as "Podpis kolumny" FROM STUDENCI; 
SELECT nazwisko, dod_funkcyjny, dod_staz  FROM PRACOWNICY WHERE dod_funkcyjny IS NULL AND dod_staz IS NOT NULL; 
SELECT nazwisko, NVL(dod_funkcyjny,0)/placa * 100 as "dodatek/placa w %" FROM PRACOWNICY



--    ******************************************************************************************************************************
--    *                                                        NOTATKA                                                             *
--    ******************************************************************************************************************************
--    *          DESC nazwa_tabeli                                                    --     OBEJRZENIE STRUKTURY TABELI           *
--    *          SELECT [zawartosc] FROM nazwa_tabeli                                 --     ZWRACA ZAWARTOSC TABELI               *
--    *          SELECT [zawartosc] FROM [z_czego] WHERE [zawartosc] LIKE [warunek]   --     ZWRACA ZAWARTOSC TABELI z warunkiem   *
--    *          [polecenie] ORDER BY [alias]                                         --     ZWRACA ZAWARTOSC Z ALIASEM            *
--    *          DISTINCT                                                             --     ZAPEWNIA NIEPOWTARZALNOSC             *
--    *          ORDER BY                                                             --     UPORZADKOWANIE                        *
--    *          DESC                                                                 --     UPORZADKOWANIE ODWROTNE               *
--    *          SELECT [zawartosc] FROM nazwa_tabeli                                 --     ZWRACA ZAWARTOSC TABELI               *
--    *                                                                                                                            *
--    *                  porÛwnania: =, !=, <>, <, <=, >, >=, IS NULL, IS NOT NULL, LIKE, NOT LIKE,                                *
--    *                  logiczne: NOT, AND, OR,                                                                                   *
--    *                  zawarcia w zbiorze: IN,                                                                                   *
--    *                  zawarcia w przedziale: BETWEEN ... AND ... .                                                              *
--    ******************************************************************************************************************************

