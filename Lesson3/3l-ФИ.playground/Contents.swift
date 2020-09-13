import UIKit

//1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.

enum Transmission {
    case manual, auto
}

enum Brand {
    case nissan, bmw, mazda, man, volvo
}

enum Engine {
    case diesel, petrol
}

struct SportCar {
    mutating func run(_ state: Bool) {
        self.state = state
    }
    
    var transmission: Transmission
    var engine: Engine
    var brand: Brand
    var spoiler: Bool
    var turbo: Bool
    var trailer: Bool
    var openWindow: Bool
    
    var state: Bool {
        willSet {
            if newValue == true {
                print("Машина \(brand) готова к гонке.")
                if openWindow == true { print("Не забудьте закрыть окна") }
                else { print("Окна закрыты, Ready!") }
            } else {
                print("Водитель \(brand) спит.")
            }
        }
    }
}

struct TrunkCar {
    mutating func run(_ state: Bool) {
        self.state = state
    }
    
    mutating func windows(_ state: Bool) {
        self.status = state
    }
    
    var transmission: Transmission
    var engine: Engine
    var brand: Brand
    var spoiler: Bool
    var turbo: Bool
    var trailer: Bool
    var openWindow: Bool
    
    var state: Bool {
        willSet {
            if newValue == true {
                print("Фура \(brand) готова к экспедиции.")
            } else {
                print("Фура \(brand) отдыхает.")
            }
        }
    }
    var status: Bool {
        willSet {
            if newValue == true {
                print("Окна открыты")
            } else {
                print("Окна закрыты")
            }
        }
    }
}

//2. Описать в каждом наследнике специфичные для него свойства.Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.

var car1 = SportCar(transmission: .manual, engine: .petrol, brand: .nissan, spoiler: true, turbo: true, trailer: false, openWindow: false, state: true)

var car2 = SportCar(transmission: .auto, engine: .diesel, brand: .mazda, spoiler: false, turbo: true, trailer: false, openWindow: true, state: false)

var car3 = TrunkCar(transmission: .auto, engine: .diesel, brand: .volvo, spoiler: false, turbo: false, trailer: true, openWindow: false, state: true, status: true)

//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенногообъема.

//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
//
//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
//
//6. Вывести значения свойств экземпляров в консоль.

car3.run(true)
car3.windows(true)

car1.run(true)
car2.run(true)
