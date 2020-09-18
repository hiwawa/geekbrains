import UIKit

//1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.

enum Transmission {
    case manual, auto
}

enum Brand {
    case nissan, bmw, mazda, man, volvo
}

enum Engine {
    case diesel, petrol
}

class Car {
    
    var transmission: Transmission
    
    var engine: Engine
    var brand: Brand
    var mp3: Bool
    var openWindow: Bool
    
    init(transmission: Transmission, engine: Engine, brand: Brand, mp3: Bool, openWindow: Bool) {
        self.brand = brand
        self.transmission = transmission
        self.engine = engine
        self.mp3 = mp3
        self.openWindow = openWindow
    }
    
    func Status() {
        print("Это автомобиль марки \(brand). Автомобиль имеет \(transmission) трансмиссию и \(engine) двигатель.")
    }
    
}

class SportCar: Car{
    var spoiler: Bool = true
    var turbo: Bool = true
    
    override func Status() {
        super .Status()
        print("Этот автомобиль спортивный. Помимо базовой комплектации он имеет спойлер и турбину.")
    }
}

class TrunkCar: Car{
    var trailer: Bool = true
    var overload: Bool = false
    
    override func Status() {
        super .Status()
        print("Этот автомобиль грузовой. Он готов для перевозки тяжелых грузов в большом количестве. В базовую комплектацию входит прицеп.")
    }
}

let car1 = SportCar(transmission: .auto, engine: .petrol, brand: .bmw, mp3: true, openWindow: false)
let car2 = TrunkCar(transmission: .auto, engine: .diesel, brand: .volvo, mp3: false, openWindow: true)
print(car1.Status())
print(car2.Status())
