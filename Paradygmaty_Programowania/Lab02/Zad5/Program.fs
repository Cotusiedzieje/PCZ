// Learn more about F# at http://fsharp.org
// See the 'F# Tutorial' project for more help.
open System
[<EntryPoint>]
let main argv = 
    let funkcja (x,y) =
        match x%y with
        | 0-> None
        | _-> Some (x%y)
    Console.WriteLine(funkcja (20,12)) 
    Console.ReadKey() |> ignore
    0
