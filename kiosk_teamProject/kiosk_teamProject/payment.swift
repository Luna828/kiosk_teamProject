import Foundation
struct Payments {
    let accountName: String
    var Balance: Double
    var shoppingBag: Int
    static var currentItem: Int = 0
    var count : Int = 0
    
    init (accountName: String, Balance: Double) {
        self.accountName = accountName
        self.Balance = Balance
        Payments.currentItem += 1
        self.shoppingBag = Payments.currentItem
    }
    mutating func withdraw (value: Double) -> String {
        if Balance - value < 0 {
            return ("잔액이 부족합니다. 현재 잔액은 \(Balance)원 입니다.")
        }
        Balance -= value
        count += 1
        return ("\(Balance)원이 남았습니다. \(value)원 구매했습니다.")
    }

    func printBalance() {
        print("현재 잔액은 \(Balance)입니다.")
    }
}






