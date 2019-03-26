/*  KAMIL GRODZKI
 *  LAB.2
 *  PRACA DOMOWA NR.2
 */


using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1
{
    class Osoba
    {
        protected string imie;
        protected string nazwisko;
        protected string dataUrodzenia;

        public Osoba(string imie_, string nazwisko_, string dataUrodzenia_)
        {
            imie = imie_;
            nazwisko = nazwisko_;
            dataUrodzenia = dataUrodzenia_;
        }

        public virtual void WypiszInfo()
        {
            Console.WriteLine(imie + ", " + nazwisko + ", " + dataUrodzenia);
        }
    }
    class Student : Osoba
    {
        protected int rok;
        protected int grupa;
        protected int nrIndeksu;

        public Student(string imie_, string nazwisko_, string dataUrodzenia_, int rok_, int grupa_, int nrIndeksu_) : base(imie_, nazwisko_, dataUrodzenia_)
        {
            rok = rok_;
            grupa = grupa_;
            nrIndeksu = nrIndeksu_;
        }

        public override void WypiszInfo()
        {
            Console.WriteLine(imie + ", " + nazwisko + ", " + dataUrodzenia + ", " + rok + ", " + grupa + ", " + nrIndeksu);
        }

    }
    class Pilkarz : Osoba
    {
        protected string pozycja;
        protected string klub;
        protected int liczbaGoli = 0;

        public Pilkarz(string imie_, string nazwisko_, string dataUrodzenia_, string pozycja_, string klub_) : base(imie_, nazwisko_, dataUrodzenia_)
        {
            pozycja = pozycja_;
            klub = klub_;

        }

        public override void WypiszInfo()
        {
            Console.WriteLine(imie + ", " + nazwisko + ", " + dataUrodzenia + ", " + pozycja + ", " + klub + ", " + liczbaGoli);
        }

        public virtual void StrzelGola()
        {
            liczbaGoli++;
        }
    }

    class PilkarzReczny : Pilkarz
    {
        public PilkarzReczny(string imie_, string nazwisko_, string dataUrodzenia_, string pozycja_, string klub_)
            : base(imie_, nazwisko_, dataUrodzenia_, pozycja_, klub_)
        {

        }
        public override void StrzelGola()
        {
            base.StrzelGola();
            Console.WriteLine("Ręczny strzelił!");
        }
    }

    class PilkarzNozny : Pilkarz
    {
        public PilkarzNozny(string imie_, string nazwisko_, string dataUrodzenia_, string pozycja_, string klub_)
            : base(imie_, nazwisko_, dataUrodzenia_, pozycja_, klub_)
        {

        }
        public override void StrzelGola()
        {
            base.StrzelGola();
            Console.WriteLine("Nożny strzelił!");
        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            Osoba o = new Osoba("Adam", "Miś", "20.03.1980");
            Osoba o2 = new Student("Michał", "Kot", "13.04.1990", 2, 1, 12345);
            Osoba o3 = new Pilkarz("Mateucz", "Żbik", "10.08.1986", "obrońca", "FC Czestochowa");

            o.WypiszInfo();
            o2.WypiszInfo();
            o3.WypiszInfo();

            Student s = new Student("Krzysztof", "Jeż", "22.12.1990", 2, 5, 54321);
            Pilkarz p = new Pilkarz("Piotr", "Kos", "14.09.1984", "napastnik", "FC Politechnika");

            s.WypiszInfo();
            p.WypiszInfo();

            ((Pilkarz)o3).StrzelGola();
            p.StrzelGola();
            p.StrzelGola();

            o3.WypiszInfo();
            p.WypiszInfo();

            Console.ReadKey();


        }
    }
}
