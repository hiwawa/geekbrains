import UIKit

//1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.
//
//2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.
enum ShopErrors: Error {
    case noClient
    case noMoney
}
class Shop {
    var clients = [
        "Александр Валерьевич" : 200,
        "Игорь Петрович" : 1800,
        "Екатерина Викторовна" : 1400
    ]
    var products = [
        "Молоко" : 60,
        "Мясо" : 200,
        "Рыба" : 300,
        "Икра" : 400
    ]
    func cart(atName name: String) -> String {
        var total = 0
        let wallet = clients[name]!
        for product in products {
            total += product.value
        }
        guard wallet > total else { return "Мало денег - стоимость корзины \(total) рублей, а Ваш баланс \(wallet) рублей" }
        
        return "Клиент платежеспособный. Сумма покупок: \(total) рублей."
    }
}

let client = Shop()
client.cart(atName: "Александр Валерьевич")
