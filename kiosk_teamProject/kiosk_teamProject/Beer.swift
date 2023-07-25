import Foundation

class Beer: Menu {
    let price: Double
    
    init(name: String, price: Double, content: String) {
        self.price = price
        super.init(name: name, content: content)
    }
}
