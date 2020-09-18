import UIKit

class Car {
    var brand: String
    
    init(brand: String) {
        self.brand = brand
    }
    
}

//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.

struct Queue<T> {
    private var elements: [T] = []           // массив типа Т
    
    mutating func push(_ element: T) {      // добавляем элемент типа Т
        elements.append(element)
    }
    mutating func pop() -> T? {            // извлекаем элемент типа Т
        return elements.removeLast()
    }
    
    func get() -> Array<Any> {
        return elements
    }
    
}
//
//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)

var carBmw = Queue<Car>()
carBmw.push(Car(brand: "BMW 530"))
carBmw.push(Car(brand: "Mercedes S 320"))
carBmw.push(Car(brand: "Nissan"))
carBmw.push(Car(brand: "BMW 525"))
carBmw.get()




//
//3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
