import UIKit
import Foundation

class Car {
    var brand: String
    
    func status () -> String{
        return "Автомобиль \(brand)."
    }
    
    init(brand: String) {
        self.brand = brand
    }
    
}

//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.

struct Queue<T> {
    var elements: [T] = []           // массив типа Т
    
    mutating func push(_ element: T) {      // добавляем элемент типа Т
        elements.append(element)
    }
    mutating func pop() -> T? {            // извлекаем элемент типа Т
        return elements.removeLast()
    }
    
    mutating func get() -> Array<Any> {            // извлекаем элемент типа Т
        return elements
    }
}
//
//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)

var carADD = Queue<Car>()
carADD.push(Car(brand: "BMW M3"))
carADD.push(Car(brand: "BMW M5"))
carADD.push(Car(brand: "Mercedes S 350"))
carADD.push(Car(brand: "Mercedes C 180"))

//3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
