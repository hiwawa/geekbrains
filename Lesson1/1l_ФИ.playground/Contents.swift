//: A UIKit based Playground for presenting user interface
  
import UIKit

//Задание 1: уравнениe вида ax2+bx+c=0

let a: Int = 5
let b: Int = 10
let c: Int = 2
print("Уравнениe вида ax2+bx+c=0. Значения переменных: a = 5, b = 4, c = 2")
var D: Int = (b*b) - (4*a*c)
print("Дискриминант равен: " + String(D))
var korenD = sqrt(Double(D))

if D<0{
    print("Нет корней")
};
if (D>0) {
    let x1 = (Double(-b) + korenD)/(2*Double(a))
    let x2 = (Double(-b) - korenD)/(2*Double(a))
    print("x1 равен: " + String(format: "%.2f", x1)
        + ", x2 равен: " + String(format: "%.2f", x2))
};
if (D==0) {
    let x = Int(-b)/(2*Int(a))
    print("Переменная х равна " + String(x))
};

//Задание 2: Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.

let katet1: UInt = 5 //Только положительное значение
let katet2: UInt = 3 //Только положительное значение
print("Даны катеты треугольника: " + String(katet1) + " и " + String(katet2))
var S: Double = 0.5 * Double(katet1) * Double(katet2)
print("Площадь треугольника равна " + String(S))
var G: Double = sqrt((Double(katet1)*Double(katet1)) + (Double(katet2)*Double(katet2)))
print("Гипотенуза треугольника равна " + String(format: "%.2f",G))
var P: Double = Double(katet1) + Double(katet2) + G
print("Периметр треугольника равен " + String(format: "%.2f",P))

//Задание 3: Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет

let summa : UInt = 5000 //Мы ложим положительный баланс UInt :)
let procent: Double = 3.6 //3.6% годовых
let srok : Int = 5
let profit: Double = ((Double(summa) * procent * Double(srok*365))/(365*100))
let summavozvrata: Double = (Double(summa) + profit)
print("Наш профит за " + String(srok) + " лет равен: " + String(profit) + ", поэтому общая сумма вклада через 5 лет будет равна " + String(summavozvrata))
