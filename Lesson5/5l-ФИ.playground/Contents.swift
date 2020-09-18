import UIKit

//1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.

protocol Car {
    var brand: Array<Any> { get }
    var engine: String { get set }
    var transmission: String { get set }
    func start ()
    func stop ()
    func openWindow ()
}

//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).

extension Car {
    func start() {
        print("Машина завелась. Можно начинать движение.")
    }
    func stop() {
        print("Машину заглушили. Мы никуда не поедем")
    }
    func openWindow() {
//        if open == true{
//            return print("Окна открыты")
//        } else {
//            return print("Окна закрыты")
//        }
          print("Окна открыты")
    }
}

//3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.

class sportCar: Car{
    var brand: Array<Any>
    var engine: String = "Бензин"
    var transmission: String = "Автоматическая"
    var turbo: Bool = true
    var spoiler: Bool = true
    init() {
        brand = ["BMW","Mercedes","Mazda"]
    }
    
}

class trunkCar: Car{
    var brand: Array<Any>
    var engine: String = "Дизель"
    var transmission: String = "Мануальная"
    var overload: Bool = true
    init() {
        brand = ["Volvo","Man","Iveco"]
    }
}
//
//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.

extension sportCar: CustomStringConvertible{
    var description: String{
        return "Вы выбрали автомобиль \(brand[0]). Не забудь, что его топливо - \(engine). Трансмиссия: \(transmission). И это легковой автомобиль, который требует права категории B!"
    }
}
extension trunkCar: CustomStringConvertible{
    var description: String{
        return "Вы выбрали автомобиль \(brand[2]). Не забудь, что его топливо - \(engine). Трансмиссия: \(transmission). И это грузовой автомобиль, который требует права категории D!"
    }
}
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
let bmw = sportCar()
let iveco = trunkCar()
//6. Вывести сами объекты в консоль.
print(bmw)
print(iveco)
