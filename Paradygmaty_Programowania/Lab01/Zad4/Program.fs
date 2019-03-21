open System

let kwadrat a: float =
    a * a
let kw = kwadrat 4.2
printf "Kwadrat: %g\n" kw

let prostokat b c: float =
    b * c
let p = prostokat 2.4 4.3
printf "Prostokąt: %g\n" p

let kolo r: float =
    let pi = 3.14
    pi * r * r
let ko = kolo 3.2
printf "Koło: %g\n" ko
Console.ReadKey() |> ignore