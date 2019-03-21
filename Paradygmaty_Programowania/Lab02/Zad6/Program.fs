// Learn more about F# at http://fsharp.org
// See the 'F# Tutorial' project for more help.
open System
[<EntryPoint>]
let main argv = 
    let posortowana = List.sort [-4; 2; 9; -11; 0; 4]
    printfn "Lista posortowana: %A" posortowana
    let suma = List.sum[5..67]
    printfn "suma %d" suma
    let srednia = List.average[3.5;6.3;632.3;]
    printfn "srednia %.2f " srednia
    let srednia2 = List.averageBy (fun x-> x*x) [3.5;6.3;632.3;]
    printfn "srednia %.2f " srednia2

    let lista = [1..5]
    let lista2 = [for i in 1..5 -> i*i]
    let zip2 = List.zip lista lista2
    printfn "polaczenie 2 list %A " zip2

    let nowa = List.map (fun x-> x*x+1) lista
    printfn "nowa lista %A" nowa

    let parzyste = List.filter (fun x-> x%2 =0 )[1..100]
    printfn "parzyste: %A "parzyste
    Console.ReadKey() |> ignore
    0
