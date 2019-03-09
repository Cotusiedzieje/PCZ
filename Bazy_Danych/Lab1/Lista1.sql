--    **********************************
--    *          BAZY DANYCH           *
--    *                                *
--    *            LISTA 1             *
--    *          11.02.2019r           *
--    **********************************


--Zad 1
DESC studenci;

--Zad 2
select * from studenci;

--Zad 3.1
select imiona||' '||nazwisko from studenci;

--Zad 3.2
select DISTINCT kierunek from studenci;

--Zad 3.3
select nazwisko, imiona, tryb, rok,gr_dziekan, specjalnosc from studenci
ORDER BY rok, nazwisko DESC;

--Zad 3.4
select * from studenci
WHERE rok=3 and gr_dziekan=2;


--Zad 3.5
select * from studenci
where specjalnosc is null;

--Zad 3.6
select tryb, nazwisko, imiona, rok from studenci
where stopien=1 and tryb='STACJONARNY' and rok IN(2,3,4)
order by nazwisko;

--Zad 3.7
select imiona, nazwisko from studenci
where imiona like '%a';

--Zad 3.8
select imiona, nazwisko from studenci
where imiona not like '%a';

--Zad 3.9
select nazwisko,imiona from studenci
where imiona like 'Adam' or imiona like 'Konrad' or imiona like 'Magdalena';

--Zad 3.10
select * from studenci
where nazwisko like 'Kowalsk_' or nazwisko like 'Nowak';

--Zad 3.11

select imiona from studenci
where imiona between 'Do%' and 'Mi%'
order by imiona;

--Zad 4
Desc pracownicy;
--Zad 5.1
select nazwisko,placa from pracownicy;

--Zad 5.2
select nazwisko, placa/20 as Dniowka from pracownicy;

--Zad 5.3
select nazwisko,nr_akt, NVL(placa,0)+NVL(dod_funkcyjny,0)+NVL(dod_staz,0)-NVL(koszt_ubezpieczenia,0) as "Pensja"
from pracownicy
where data_zwol is null
order by 3;

--Zad 5.4
select nazwisko,nr_akt,(NVL(placa,0)+NVL(dod_funkcyjny,0)+NVL(dod_staz,0)-NVL(koszt_ubezpieczenia,0))*12 as "Roczna Pensja"
from pracownicy
where data_zwol is null and stanowisko not like 'Prezes' and stanowisko not like 'Dyrektor'
order by 3 desc;

--Zad 5.5
select nazwisko||' aktualnie pracuje w dziale '||id_dzialu||'-tym na stanowisku '
||stanowisko||' w firmie od '||data_zatr
from pracownicy
where data_zwol is null;


--Zad 6
desc pojady;
select * from pojazdy;

--Zad 7
select * from pojazdy
where nr_rejestr like 'SC____5%'
and pojemnosc between 1500 and 2000 
and kolor like '%z%'
and kolor like '%y';
