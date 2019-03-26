using System;

namespace ConsoleApp1
{

    // ---------- KLASA ELEMENT ----------


    class Element
    {
        private object wartosc;
        private Element nastepnyElement;
        public Element()
        {
            wartosc = 0;
            nastepnyElement = null;
        }
        public Element(object wartosc_)
        {
            wartosc = wartosc_; 
        }

        public void DodajElement(Element nowy)
        {
            nastepnyElement = nowy;
        }
        public object PobierzWartosc()
        {
            return wartosc;
        }
        public Element PobierzNastepny()
        {
            return nastepnyElement;
        }
    }



    // ---------- KLASA KOLEJKA ----------


    class Kolejka
    {
        public Element pierwszyElement;
        public Element ostatniElement;
        public int liczbaElementow;

        public Kolejka()
        {
            pierwszyElement = null;
            ostatniElement = null;
            liczbaElementow = 1;
        }

        public Kolejka(Element pierwszyElement_,Element ostatniElement_,int liczbaElementow_)
        {
            pierwszyElement = pierwszyElement_;
            ostatniElement = ostatniElement_;
            liczbaElementow = liczbaElementow_;
        }

        public void Dodaj(object wartosc_)
        {
            Element temp = new Element(wartosc_);
            if(pierwszyElement == null)
            {
                pierwszyElement = ostatniElement = temp;
            }
            else
            {
                ostatniElement.DodajElement(temp);
                ostatniElement = temp;
                liczbaElementow++;
            }
        }



        public int Pobierz()
        {
            if (pierwszyElement != null)
            {
                if (pierwszyElement.PobierzNastepny() == null)
                {
                    ostatniElement = null;
                    return 0;
                }

                pierwszyElement = pierwszyElement.PobierzNastepny();
                liczbaElementow--;
                return 1;
            }
            else Console.WriteLine("KOLEJKA JEST PUSTA");
            return 0;
        }




        public void Wypisz()
        {
            if (pierwszyElement != null)
            {
                Element temp = pierwszyElement;
                while (temp != null)
                {
                    Console.Write(temp.PobierzWartosc() + " ");
                    temp = temp.PobierzNastepny();
                }
                Console.WriteLine();
            }
            else
            {
                Console.WriteLine("KOLEJKA JEST PUSTA");
            }
        }

    }


    class Program
    {
        static void Main(string[] args)
        {
            Kolejka k = new Kolejka();
            k.Dodaj(1);
            k.Dodaj(5);
            k.Dodaj(3);
            k.Dodaj(8);
            k.Wypisz();
            Console.WriteLine("Liczba elementow: {0}",k.liczbaElementow);
            int element = (int)k.Pobierz();
            Console.WriteLine("Pobranych elementow: {0}", element);
            k.Wypisz();
            Console.WriteLine("Liczba elementow: {0}", k.liczbaElementow);
            k.Dodaj(7);
            k.Dodaj(4);
            k.Wypisz();
            Console.WriteLine("Liczba elementow: {0}", k.liczbaElementow);
            element = (int)k.Pobierz();
            Console.WriteLine("Pobranych elementow: {0}", element);
            k.Wypisz();
            Console.WriteLine("Liczba elementow: {0}", k.liczbaElementow);
            Console.ReadKey();


        }
    }
}
