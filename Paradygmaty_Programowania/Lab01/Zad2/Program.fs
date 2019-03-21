open System

printf "Podaj swoje imię: " 
let a = Console.ReadLine() 
printf "Podaj swoje nazwisko: " 
let b = Console.ReadLine() 
printf "Twoje imie i nazwisko: %s %s" a b
Console.ReadKey() |> ignore