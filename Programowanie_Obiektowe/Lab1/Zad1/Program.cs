﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp2
{
    public class Samochod
    {
        private string marka;
        private string model;
        private int iloscDrzwi;
        private int pojemnoscSilnika;
        private double srednieSpalanie;
        private static int liczbaSamochodow = 0;


        public Samochod()
        {
            marka = "nieznana";
            model = "nieznany";
            iloscDrzwi = 0;
            pojemnoscSilnika = 0;
            srednieSpalanie = 0.0;
            liczbaSamochodow++;
        }
        public Samochod(string marka_,string model_,int iloscDrzwi_,int pojemnoscSilnika_,double srednieSpalanie_)
        {
            marka = marka_;
            model = model_;
            iloscDrzwi = iloscDrzwi_;
            pojemnoscSilnika = pojemnoscSilnika_;
            srednieSpalanie = srednieSpalanie_;
            liczbaSamochodow++;
        }
        public string Marka { get { return marka; } set { marka = value; } }
        public string Model { get { return model; } set { model = value; } }
        public int IloscDrzwi { get { return iloscDrzwi; } set { iloscDrzwi = value; } }
        public int PojemnoscSilnika { get { return pojemnoscSilnika; } set { pojemnoscSilnika = value; } }
        public double SrednieSpalanie { get { return srednieSpalanie; } set { srednieSpalanie = value; } }





        private double ObliczSpalanie(double dlugoscTrasy)
        {
            double spalanie = 0.0;
            spalanie = (srednieSpalanie * dlugoscTrasy) / 100.0;
            return spalanie;
        }
        public double ObliczKosztPrzejazdu(double dlugoscTrasy, double cenaPaliwa)
        {
            double spalanie = 0.0;
            spalanie = (srednieSpalanie * dlugoscTrasy) / 100.0;
            double kosztPrzejazdu = 0.0;
            kosztPrzejazdu = spalanie * cenaPaliwa;
            return kosztPrzejazdu;
        }
        public void WypiszInfo()
        {
            Console.WriteLine("Marka: " + marka + "  Model: " + model + "  Ilość drzwi: " + iloscDrzwi + "  Pojemność silnika: " + pojemnoscSilnika + "  Średnie spalanie:" + srednieSpalanie);
        }
        public static void WypiszIloscSamochodow()
        {
            Console.WriteLine("Ilość samochodów: " + liczbaSamochodow);
        }
    }
    class Program
    {
        static void Main(string[] args)
        {

            Samochod s1 = new Samochod();
            s1.WypiszInfo();
            s1.Marka = "Fiat";
            s1.Model = "126p";
            s1.IloscDrzwi = 2;
            s1.PojemnoscSilnika = 650;
            s1.SrednieSpalanie = 6.0;
            s1.WypiszInfo();
            Samochod s2 = new Samochod("Syrena", "105", 2, 800, 7.6);
            s2.WypiszInfo();
            double kosztPrzejazdu = s2.ObliczKosztPrzejazdu(30.5, 4.85); Console.WriteLine("Koszt przejazdu: " + kosztPrzejazdu);
            Samochod.WypiszIloscSamochodow();
            Console.ReadKey();
        }
    }
}
