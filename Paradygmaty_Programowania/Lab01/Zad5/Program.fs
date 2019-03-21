open System

printf("Podaj wartość 'x': ")
let xa = Console.ReadLine()
let x = Convert.ToDouble(xa:string):float
printf("Podaj wartość 'y': ")
let ya = Console.ReadLine()
let y = Convert.ToDouble(ya:string):float

let liczba = 10 
let a = -5.0 * (y*y*y*y) 
let b = 0.33 * (x*x) 
let c = 3.0 * y
let d = -7.0

let wynik = a + b + c - d
printf("Wynik: %g") wynik
Console.ReadKey() |> ignore