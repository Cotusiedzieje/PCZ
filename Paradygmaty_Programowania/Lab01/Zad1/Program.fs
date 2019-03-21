// Learn more about F# at http://fsharp.org

open System

printf "Podaj swoje imię: " 
let a = Console.ReadLine() 
printfn "Twoje imię: %s" a    
Console.ReadKey() |> ignore