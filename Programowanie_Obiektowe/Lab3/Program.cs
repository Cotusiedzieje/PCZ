using System;
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

    class Garaz
    {
        private string adres;
        private int pojemnosc;
        private int liczbaSamochodow = 0;
        private Samochod[] samochody;

        public Garaz()
        {
            adres = "nieznany";
            pojemnosc = 0;
            samochody = null;
        }
        public Garaz(string adres_,int pojemnosc_)
        {
            adres = adres_;
            pojemnosc = pojemnosc_;
            samochody = new Samochod[pojemnosc];
        }

        public string Adres { get { return adres; } set { adres = value; } }
        public int Pojemnosc { get { return pojemnosc; } set { pojemnosc = value; samochody = new Samochod[pojemnosc]; } }
        

        public void WprowadzSamochod(Samochod s)
        {

            if (liczbaSamochodow == pojemnosc)
            {
                Console.WriteLine("Brak miejsca!");
            }
            else
            {
                samochody[liczbaSamochodow] = s;
                liczbaSamochodow++;
            }
        }

        public Samochod WyprowadzSamochod()
        {
            if (liczbaSamochodow == 0)
            {
                Console.WriteLine("Garaż jest pusty!");
            }
            else
            {
                samochody[liczbaSamochodow - 1] = null;
                liczbaSamochodow--;
            }
            return samochody[liczbaSamochodow];
        }

        public void WypiszInfo()
        {
            Console.WriteLine("Adres grażu: " + adres);
            Console.WriteLine("Pojemność garażu: " + pojemnosc);
            Console.WriteLine("Liczba Samochodów: " + liczbaSamochodow);
            for (int i = 0; i < liczbaSamochodow; i++)
            {
                samochody[i].WypiszInfo();
            }
        }
    }


    class Program
    {
        static void Main(string[] args)
        {

            Samochod s1 = new Samochod("Fiat", "126p", 2, 650, 6.0); Samochod s2 = new Samochod("Syrena", "105", 2, 800, 7.6);
            Garaz g1 = new Garaz(); g1.Adres = "ul. Garażowa 1"; g1.Pojemnosc = 1;
            Garaz g2 = new Garaz("ul. Garażowa 2", 2);

            g1.WprowadzSamochod(s1);
            g1.WypiszInfo();
            g1.WprowadzSamochod(s2);

            g2.WprowadzSamochod(s2);
            g2.WprowadzSamochod(s1);
            g2.WypiszInfo();
            g2.WyprowadzSamochod();
            g2.WypiszInfo();
            g2.WyprowadzSamochod();
            g2.WyprowadzSamochod();

            Console.ReadKey();
        }
    }
}