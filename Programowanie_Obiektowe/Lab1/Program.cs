using System;

namespace PracaDomowa
{
    class Samochod
    {
        private string marka;
        private string model;
        private int iloscDrzwi;
        private int pojemnoscSilnika;
        private double srednieSpalanie;
        private string numerRejestracyjny;

        private static int iloscSamochodow = 0;
        //konstruktory
        public Samochod()
        {
            marka = "nieznana";
            model = "nieznany";
            iloscDrzwi = 0;
            pojemnoscSilnika = 0;
            srednieSpalanie = 0.0;
            numerRejestracyjny = "nieznany";
            iloscSamochodow++;
        }
        public Samochod(string marka_, string model_, int iloscDrzwi_, int pojemnoscSilnika_, double srednieSpalanie_, string numerRejestracyjny_)
        {
            marka = marka_;
            model = model_;
            iloscDrzwi = iloscDrzwi_;
            pojemnoscSilnika = pojemnoscSilnika_;
            srednieSpalanie = srednieSpalanie_;
            numerRejestracyjny = numerRejestracyjny_;
            iloscSamochodow++;
        }

        //setery getery
        public string Marka { get { return marka; } set { marka = value; } }
        public string Model { get { return model; } set { model = value; } }
        public int IloscDrzwi { get { return iloscDrzwi; } set { iloscDrzwi = value; } }
        public int PojemnoscSilnika { get => pojemnoscSilnika; set => pojemnoscSilnika = value; }
        public double SrednieSpalanie { get => srednieSpalanie; set => srednieSpalanie = value; }
        public string NumerRejestracyjny { get => numerRejestracyjny; set => numerRejestracyjny = value; }

        //metody
        public double ObliczSpalanie(double dlugoscTrasy)
        {
            return (srednieSpalanie * dlugoscTrasy) / 100.0;
        }

        public double ObliczKosztPrzejazdu(double dlugoscTrasy, double cenaPaliwa)
        {
            return ObliczSpalanie(dlugoscTrasy) * cenaPaliwa;
        }
        public void WypiszInfo()
        {
            Console.WriteLine("Marka: " + marka);
            Console.WriteLine("Model: " + model);
            Console.WriteLine("Ilość drzwi: " + iloscDrzwi);
            Console.WriteLine("Pojemność silnika: " + pojemnoscSilnika);
            Console.WriteLine("Średnie spalanie: " + srednieSpalanie);
            Console.WriteLine("Numer rejestracyjny: " + numerRejestracyjny);
        }
        public static void WypiszIloscSamochodow()
        {
            Console.WriteLine("Ilość samochodów: " + iloscSamochodow);
        }
    }

    class Garaz
    {
        private string adres;
        private int pojemnosc;
        private int liczbaSamochodow = 0;
        private Samochod[] samochody;

        //konstruktory
        public Garaz()
        {
            adres = "nieznany";
            pojemnosc = 0;
            samochody = null;
        }
        public Garaz(string adres_, int pojemnosc_)
        {
            adres = adres_;
            pojemnosc = pojemnosc_;
            samochody = new Samochod[pojemnosc];
        }

        //settery gettery
        public string Adres { get => adres; set => adres = value; }
        public int Pojemnosc
        {
            get { return pojemnosc; }
            set
            {
                pojemnosc = value;
                samochody = new Samochod[pojemnosc];
            }
        }
        //metody

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
    class PracaDomowa
    {
        static void Main(string[] args)
        {


            Samochod s1 = new Samochod("Fiat", "126p", 2, 650, 6.0, "SC1023");
            Samochod s2 = new Samochod("Syrena", "105", 2, 800, 7.6, "SKL5921");

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
