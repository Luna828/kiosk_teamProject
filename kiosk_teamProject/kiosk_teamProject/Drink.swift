import Foundation

class Drink: Menu {
    let price: Double
    
    init(name: String, price: Double, content: String, color: String) {
        self.price = price
        super.init(name: name, content: content)
    }
}
