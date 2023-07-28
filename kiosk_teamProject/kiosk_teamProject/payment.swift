import Foundation
struct Payments {
    let accountName: String
    var Balance: Double
    var count : Int = 0
    
    init (accountName: String, Balance: Double) {
        self.accountName = accountName
        self.Balance = Balance
    }
    
    // 결제하는 함수
    mutating func withdraw (value: Double) -> String {
        if Balance - value < 0 {
            return ("잔액이 부족합니다. 현재 잔액은 \(round(Balance))원 입니다.")
        }
        count += 1
        Balance -= value
        // round() : 소수점 자리 반올림
        return ("\(round(Balance))원이 남았습니다. \(value)원 구매했습니다.")
    }

    func printBalance() {
        // round() : 소수점 자리 반올림
        print("현재 잔액은 \(round(Balance))입니다.")
    }
}






