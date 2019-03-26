-- LAB 4
--zad 1
select * from pojazdy join kierowcy on(wlasciciel = id_kierowcy)
where extract (year from data_prod) = 2018;

--zad.2
select nr_rejestr,marka,modell,data_prod,wlasciciel,id_kierowcy, nazwisko,imie,data_urodzenia,
floor(months_between(data_prod,data_urodzenia)/12) from 
kierowcy join pojazdy on(id_kierowcy=wlasciciel)where data_prod<data_urodzenia;

--zad 3
select * from pracownicy;
select * from stanowisko;

select * from pracownicy join stanowiska using (stanowisko)
where placa not between placa_min and placa_max;

--zad 4
select trunc(czas), nazwisko, imie, gatunki.nazwa, lowiska.nazwa, dlugosc, waga 
from rejestry join wedkarze using(id_wedkarza) join gatunki
using(id_gatunku) join lowiska using(id_lowiska); 

--zad 5
select trunc(czas),nazwisko, nvl(gatunki.nazwa,'Brak polowu')
from REJESTRY join wedkarze using(ID_WEDKARZA) left join gatunki using(id_gatunku)
join lowiska using (id_lowiska)
where czas>= sysdate - interval '1' year;

--zad 6
select * from licencje;
select id_wedkarza,nazwisko,imie,id_licencji,id_okregu from wedkarze join licencje using (id_wedkarza)
where rodzaj='podstawowa' and rok=extract(year from current_date)
and id_okregu like 'PZW%';

--zad 8
select * from licencje;
select * from oplaty;
select id_wedkarza,nazwisko,id_okregu,id_licencji,
od_dnia||'-'||rok,do_dnia||'-'||rok,
to_date(do_dnia||'-'||rok,'DD-MM-YYYY')-to_date(od_dnia||'-'||rok,'DD-MM-YYYY')+1dni,
(to_date(do_dnia||'-'||rok,'DD-MM-YYYY')-to_date(od_dnia||'-'||rok,'DD-MM-YYYY')+1)*dzienna_oplata koszt
from licencje join oplaty using(rok,id_okregu)join wedkarze using(id_wedkarza)
where not(od_dnia like'01-01'and do_dnia like'31-12');

--zad 9 
select p.ID_DZIALU,p.nazwisko, p.NR_AKT, p.placa,
p1.id_dzialu, p1.NR_AKT,p1.NAZWISKO,p1.PLACA
from pracownicy p cross join pracownicy p1
where p.id_dzialu =20 and p1.id_dzialu=30;

--zad.10
select p1.nr_akt,p1.nazwisko,p1.imiona,p2.nr_akt,p2.nazwisko||' '||p2.imiona
from pracownicy p1 left join pracownicy p2 on(p1.przelozony=p2.nr_akt);

--zad.11
select rok,count (*) from studenci where lower(kierunek) like 'informatyka' group by rok;

--zad 12
select tryb,kierunek,count(kierunek) from studenci
group by kierunek,tryb
having count(kierunek)>=100;

--zad 13
select rok,stopien,gr_dziekan,count(*)liczba_studentek,round(avg(srednia),2)
from studenci where imiona like '%a' and kierunek like 'MATEMATYKA'
group by rok,stopien,gr_dziekan;

--zad 14
select kierunek,rok,min(data_urodzenia),max(data_urodzenia),
trunc(months_between (min(data_urodzenia),max(data_urodzenia)))
from studenci where stopien=1
and tryb like 'STACJONARNY' group by rok,kierunek
having trunc(months_between (max(data_urodzenia),min(data_urodzenia))) >=150;

--zad 15
select extract(year from czas), to_char (czas,'day'),
count(*), count (id_gatunku)
from rejestry 
where mod(extract(day from czas),2)=0
group by extract(year from czas), to_char(czas,'day') 
order by 3 desc,4 desc;

--zad 16
select *from pojazdy;
select * from kierowcy;
select wlasciciel,nazwisko,imie,count(*),count(distinct marka) from kierowcy join pojazdy on(Wlasciciel=id_kierowcy )
where typ like'samochod ciezarowy' group by wlasciciel,nazwisko,imie having count(*) between 5 and 15;

--zad 17
select* from pracownicy;
select *from dzialy;
select id_dzialu,nazwa,round(avg(placa),2) from pracownicy left join dzialy using(id_dzialu) 
where data_zwol is NULL or data_zwol>=sysdate group by id_dzialu,nazwa;

--zad 19 (B£¥D)
select st.stanowisko, count(nr_akt),
avg(placa*placa*dod_staz*0.1*nvl(pr.dod_funkcyjny,0)-nvl(koszt_ubezpieczenia,0)) srednia_pensja,
min(placa*placa*dod_staz*0.1*nvl(pr.dod_funkcyjny,0)-nvl(koszt_ubezpieczenia,0)) min_pensja,
max(placa*placa*dod_staz*0.1*nvl(pr.dod_funkcyjny,0)-nvl(koszt_ubezpieczenia,0)) maks_pensja
from stanowiska st left join pracownicy pr on(st.stanowisko=pr.stanowisko) where data_zwol is null or
data_zwol>=sysdate group by st.stanowisko;

--zad 20
select * from rejestry;
select * from gatunki ;
select decode (id_gatunku,null,'brak',id_gatunku) , nazwa,count(*),sum(nvl(waga,0)),round(avg(nvl(waga,0)),3),round(avg(nvl(dlugosc,0))) from rejestry left join gatunki using (id_gatunku)
group by id_gatunku,nazwa;

--zad 21
select id_lowiska, nazwa, count(*) as "liczba polowów", 
count(id_gatunku)  as "Liczba ryb", count(distinct id_wedkarza)  as "liczba wedkarzy"
from rejestry natural join lowiska lowis
where czas between timestamp '2016-03-11 15:15:00' 
and timestamp '2016-03-11 15:15:00' +  interval '2' year +interval '21 21:21:21' day(2) to second
GROUP by id_lowiska,nazwa
having count(*)>4 and count(*)-count(id_gatunku)>=2;

--zad 22
select * from oplaty;
select rok, id_okregu, count(id_licencji), count(distinct(id_wedkarza)) 
from licencje right join oplaty using(rok, id_okregu)join okregi using(id_okregu)
group by rok,id_okregu;

--zad 23
select id_kierowcy,nazwisko,imie,count(nr_rejestr), count(distinct(marka)) from kierowcy
left join pojazdy on(id_kierowcy=wlasciciel) group by id_kierowcy,nazwisko,imie 
having count(nr_rejestr)=0 or count(distinct marka)=3 and count(nr_rejestr)=3;

--zad 24
select *from rejestry;
select *from gatunki;
select nazwa,rekord_waga,max(waga),round((max(waga)/rekord_waga)*100,2) from gatunki left join rejestry using (id_gatunku)
where rekord_waga is not null
group by nazwa,rekord_waga
having (max(nvl(waga,0))/rekord_waga)*100=0 or 
 (max(nvl(waga,0))/rekord_waga)*100>=25;