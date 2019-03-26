--laboratorium 3
--zad 1
select placa+placa*dod_staz*0.01 + nvl(dod_funkcyjny,0)-nvl(koszt_ubezpieczenia,0)  Pensja,
abs(placa+placa*dod_staz*0.01 + nvl(dod_funkcyjny,0)-nvl(koszt_ubezpieczenia,0) - 4521.45) as Odchylenie,
abs(round(placa+placa*dod_staz*0.01 + nvl(dod_funkcyjny,0)-nvl(koszt_ubezpieczenia,0) - 4521.45,1)) as "Trunc do 0.1",
abs(round(placa+placa*dod_staz*0.01 + nvl(dod_funkcyjny,0)-nvl(koszt_ubezpieczenia,0) - 4521.45,-2)) as "Trunc do 100-ek"
from pracownicy;

--zad 2
select nazwisko, stanowisko, placa*0.82 as "Placa netto",
round(placa*0.82,-2) as "Placa zaokraglona",
round(placa*0.82,-2)-trunc(placa*0.82*placa,-2) "Roznica round-Trunc"
from pracownicy
order by 3;
--zad 3 
select sqrt(power(12.34,2)+power(77,1/3)) as Wynik, round(sqrt(power(12.34,2)+power(77,1/3))) as Round,
Trunc(sqrt(power(12.34,2)+power(77,1/3))) as Trunc, ceil(sqrt(power(12.34,2)+power(77,1/3))) as Ceil,
floor(sqrt(power(12.34,2)+power(77,1/3))) as Floor
from dual;

--zad 4
select INTERVAL '101-11' year(3) to month, interval '25 03:05:35.6' day(2) to second,
timestamp '101-11-25 03:05:35.6' 
from dual;
--zad 5
select systimestamp+interval '321' day(3) as "321 dni +",
systimestamp-interval '321' day(3) as "321 dni -",
Months_between(systimestamp+interval '321' day(3),systimestamp-interval '321' day(3)) as "Roznica w miesiacach",
extract( day from (systimestamp+interval '321' day(3))-(systimestamp-interval '321' day(3))) as "Roznica w dniach"
from dual;

--zad 6
select systimestamp-interval '117 8:09:00' day(3) to second,
Systimestamp + interval '19-10' year (2) to month
from dual;
--zad 7
select timestamp '2018-12-11 19:07:00' - timestamp '2015-02-15 22:04:19' as "Roznica w dniach"
--??

from dual;
--zad 8
select extract(year from systimestamp) Rok, extract(month from systimestamp) Miesiac,
extract(day from systimestamp) Dzien, extract(hour from systimestamp) Godzina,
extract(minute from systimestamp) minuta, extract(second from systimestamp) Sekunda
from dual;
--zad 9
select * from studenci
where extract(month from data_urodzenia) =extract(month from sysdate)
and extract(day from data_urodzenia) = extract(day from sysdate);
--zad 10
select add_months(sysdate,42) as "data +42 miesiace",
trunc((add_months(sysdate,42) - to_date('2022-01-01','YYYY-MM-DD')) / 7 ,0)  as "tygodni"
from dual;
--zad 11
select last_day(sysdate) as "Ostanio dzien miesiaca", to_char(last_day(sysdate),'day') as "Jaki dzien"
from dual;
--zad 12
select sysdate,trunc(sysdate,'YYYY') as "Do lat", Round(sysdate,'MM') as Miesiecy,
round(sysdate,'CC') as Wiek
from dual;
--zad 13
select nazwisko,imiona, extract(year from sysdate)- extract(year from data_urodzenia) as Wiek
from studenci
where imiona like 'M%'
order by 3 desc;
select * from studenci;
--zad 14
select Current_timestamp "Aktulany czas",Cast(Current_timestamp AS date) as Data from dual;
--zad 15
select Concat('987','654') as Lancuch, to_number(Concat('987','654')) as Liczba,
to_number(Concat('987','654'))-123456 as "Roznica"
from dual;
--zad 16
select to_char(to_number(substr(extract(year from sysdate),1,2))+1,'RN') Wiek from dual;
--zad 17
select 'czesc, jest dzisiaj '|| to_char(sysdate,'day, dd month yyyy')||' roku'
from dual;
--zad 18
select to_number(substr(extract(year from to_date('12-09-1683','DD-MM-YYYY')),1,2))+1 || ' wiek ' ||
to_char(to_date('12-09-1683','DD-MM-YYYY'),'Q') || ' kwartal ' || 
to_char(to_date('12-09-1683','DD-MM-YYYY'),'month') || 
to_char(to_date('12-09-1683','DD-MM-YYYY'),'W') || ' tydzien ' ||
' '|| to_char(to_date('12-09-1683','DD-MM-YYYY'),'day')
as "Szczegoly daty 12-09-1683"
from dual;
--zad 19
select nazwisko,imiona,data_urodzenia,to_char(data_urodzenia,'day')
from studenci
where imiona like '%a' and trim(to_char(DATA_URODZENIA,'day')) in('sobota','niedziela')
and trim(to_char(DATA_URODZENIA,'month')) in('lipiec','sierpie?')
and mod(extract(day from DATA_URODZENIA),5)!=0;
--zad 20
select nazwisko, stanowisko, data_zatr, data_zwol,
trunc(Months_between(sysdate,data_zatr)/12) || ' lat '  --??
as "Pracuje juz"
from pracownicy
where data_zwol is null or data_zwol>=sysdate
order by 1;

--zad 21
select nazwisko,stanowisko data_zatr,data_zwol,placa+placa*dod_staz*0.01 + 
nvl(DOD_FUNKCYJNY,0) -nvl(KOSZT_UBEZPIECZENIA,0) as pensja
from pracownicy
where data_zatr <= to_date('2010-01-01','yyyy-mm-dd') and
(data_zwol >= to_date('2010-01-31','yyyy-mm-dd') or data_zwol is null);
--zad 22
select * from studenci
where data_urodzenia>=to_date('13-02-1995','dd-mm-yyyy') and data_urodzenia<=to_date('28-11-1998','dd-mm-yyyy')
and trim(to_char(data_urodzenia,'day')) like 'sobota' and to_char(data_urodzenia,'W')=1;
--zad 23
select imiona,nazwisko from studenci
where regexp_count(imiona,'[[:alpha:]]')=5
and regexp_like(nazwisko,'^(Ko)[[:alpha:]]{0,}(ski)$');
--zad 24
select adres, regexp_Replace(regexp_Replace(adres,'[[:alpha:]]{3,}','Alpha'),'[[:digit:]]{1,}','Digit')
as "zaszyfrowany adres "
from studenci;
--zad 25
select ADRES from studenci
where regexp_like(adres,'^(al. )(W|P|B|T)')
and regexp_like(adres,'\s68\s');
--zad 26

-- zad 28
select extract(year from czas) as rok, ID_GATUNKU,waga,
min(waga) keep(Dense_rank first order by waga) over (partition by id_gatunku,extract(year from czas)) 
as "Min waga gatunku",
max(waga) keep(Dense_rank last order by waga) over (partition by id_gatunku,extract(year from czas)) 
as "Max waga gatunku"
from REJESTRY
where id_gatunku is not null
order by 1;


 