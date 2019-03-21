// Learn more about F# at http://fsharp.org

open System

[<EntryPoint>]
let main argv =
    let a= "Imie Nazwisko"
    Console.WriteLine("Moje imie i nazwisko: {0}",a)
    Console.ReadKey() |> ignore
    0 // return an integer exit code
