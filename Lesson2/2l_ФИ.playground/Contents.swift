import UIKit

//1. Написать функцию, которая определяет, четное число или нет.

var n = 21

//if (n % 2) == 0 {
//    print("Число \(n) четное")
//} else {
//    print("Число \(n) не четное")
//}

let chet: () = n % 2 == 0 ?  print("Число \(n) четное") : print("Число \(n) не четное")

//2. Написать функцию, которая определяет, делится ли число без остатка на 3

let natri: () = n % 3 == 0 ?  print("Число \(n) делится на 3") : print("Число \(n) не делится на 3")

//3. Создать возрастающий массив из 100 чисел.

var vorray = [Int]() //пустой массив
var item : Int = 0
for item in 0...99 {
    vorray.insert(item+1, at: item)
}
print("Количество элементов \(vorray.count)")
//print(vorray)

//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

var countAr = 0

for i in vorray where (i % 2 == 0) || (i % 3 != 0) {
    vorray.remove(at: (i - 1) - countAr)
    countAr += 1
}

print(vorray)

//5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.
//Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2

