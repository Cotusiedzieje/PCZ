// Learn more about F# at http://fsharp.org
// See the 'F# Tutorial' project for more help.
open System
[<EntryPoint>]
let main argv = 
    let sprawdzenie (x,y) =
        if x%4 = y%4 then true
        else false
    Console.WriteLine(sprawdzenie (5,5)) 
    Console.ReadKey() |> ignore
    0
