open System
[<EntryPoint>]
let main argv = 
    let tablica = [|1;2;3|]
    printfn "Tablica %A" tablica
    let tablica1 = Array.create 5 1
    printfn "Tablica1 %A" tablica1
    tablica.[2] <-7
    printfn "Tablica zmiana %A" tablica
    Array.set tablica1 2 7
    printfn "Tablica1 %A" tablica1

    printfn "indeks 2 tablicy %A" tablica.[2]
    printfn "indeks 2 tablicy1 %A" (Array.get tablica1 2)

    let tablica2 = Array.empty
    printfn "Pusta tab2 %A" tablica2

    let tablica3 : int array = Array.zeroCreate 5
    printfn "Tablica3 %A" tablica3

    Array.fill tablica3 1 3 5
    printfn "Tablica3 %A" tablica3

    let tablica5 = Array.sub tablica3 1 2
    printfn "Tablica5 %A" tablica5

    let tablica6 = Array.append tablica3 tablica5
    printfn "Tablica5 i 3 %A" tablica6

    let tablica7 = Array2D.init 2 3 (fun i j -> (i+1)*(j+1))
    printfn "Tablica7 %A" tablica7
    Console.ReadKey() |> ignore
    0
