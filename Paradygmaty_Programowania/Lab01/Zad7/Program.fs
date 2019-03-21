open System

let x = 25
let y = 46
printf("%u %u\n") x y
printf("     %u %u\n") x y
printf("000000%u 000000%u\n") x y
if x>0 then
    if y>0 then
        printf("+%u +%u\n") x y
    elif y<0 then
        printf("+%u %u\n") x y
elif x<0 then
    if y>0 then
        printf("%u +%u\n") x y
    elif y<0 then
        printf("%u %u\n") x y
printf("%o %o\n") x y
printf("%X %X\n") x y
Console.ReadKey() |> ignore