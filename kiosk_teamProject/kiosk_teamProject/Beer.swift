import Foundation

class Beer: Menu {
    let price: Double
    
    init(name: String, price: Double, content: String) {
        self.price = price
        super.init(name: name, content: content)
    }
}


struct Beer1 {
    let name: String
    let price: Double
    let content : String
}
