open System

let walec radius length : float =
    let pi = 3.14
    length * pi * radius * radius
let w = walec 4.0 6.0
printf "Wynik: %g" w
Console.ReadKey() |> ignore