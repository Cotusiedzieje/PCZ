open System

let main argv =
    let rec rekurencja a n q =
      if n<2 then
           a
       else 
           q * rekurencja a (n-1) q

    Console.WriteLine(rekurencja 1 2 5)
Console.ReadKey() |> ignore