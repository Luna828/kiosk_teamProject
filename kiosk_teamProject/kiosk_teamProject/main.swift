import Foundation

// 메뉴판 구현
let menuList: [Menu] = [
    Menu(name: "Burgers", content: "앵거스 비프 통살을 다져만든 버거"),
    Menu(name: "Frozen Custard", content: "매장에서 신선하게 만드는 아이스크림"),
    Menu(name: "Drinks", content: "매장에서 직접 만드는 음료"),
    Menu(name: "Beer", content: "뉴욕 브루클린 브루어리에서 양조한 맥주"),
    Menu(name: "Cart", content: ""),
    Menu(name: "Exit", content: "프로그램 종료")
]

// 계좌 목록 정의
var accountList = [Payments]()
// 새 계좌 정의
var account = newAccount(name: "gagyeom", balance: Double.random(in: 100...1000))

// 새 계좌 만드는 펑션 정의
func newAccount(name: String, balance: Double) -> Payments {
    let account = Payments(accountName: name, Balance: balance)
    accountList.append(account)
    return account
}

// 대기시간 구현 GCD - Grand Central Dispatch, 비동기 프로그래밍
var waitingTime = 0
// Main Queue, Global Queue, Custom Queue 중 Global Queue 사용
// Global Queue는 여러 프로세스가 함께 공유되어 전역적인 범위에 사용.
DispatchQueue.global().async {
    while true{
        sleep(5)
        print("\n현재 주문 대기 수: \(account.count)")
        print("\n예상 대기 시간: \(waitingTime)")
    }
}

// 장바구니 구현
var cartList = [Goods]()

// 메뉴판 보여주는 펑션 구현
func showTitle() {
    print("""
    "SHAKESHACK BURGER 에 오신걸 환영합니다."
    아래 메뉴판을 보시고 메뉴를 골라 입력해주세요.

    [ SHAKESHACK MENU ]
    """)
        for (index, menu) in menuList.enumerated() {
            // toLength: 새로운 문자열의 길이를 15로 설정
            // withPad: "" 추가할 공백 문자를 지정 '|' 사이의 간격을 맞추도록 지정
            // startingAt: 0 기존 문자열에서 어느 위치부터 시작하여 새로운 문자열을 만들지 설정
            let paddedName = menu.name.padding(toLength: 15, withPad: " ", startingAt: 0)
            print("\(index + 1). \(paddedName)| \(menu.content)")
        }
        print("---------------------------------------------------")
}

func shakeShack() {
    // 메뉴판 보여주기
    showTitle()
    while true {
        guard let numStr = readLine(),
              let num = Int(numStr) else {
            print("잘못된 번호를 입력했어요 다시 입력해주세요")
            continue
        }
        
        switch num {
        case 1 :
            print("---------------------------------------------------")
            Burgers().showBurgerMenu()
            // 매 작업이 끝날 때, 메뉴판 띄워 갱신
            showTitle()
        case 2 :
            print("---------------------------------------------------")
            Frozens().showFrozenMenu()
            showTitle()
        case 3 :
            print("---------------------------------------------------")
            Drinks().showDrinkMenu()
            showTitle()
        case 4 :
            print("---------------------------------------------------")
            Beers().showBeerMenu()
            showTitle()
        case 5 :
            showCart()
            showTitle()
        case 6 :
            print("프로그램 종료")
            exit(0)
        default:
            print("다시 선택해주세요")
            continue
        }
    }
}

// 장바구니 추가
func addItem(_ item: Goods) {
    print("\(item.name)을 장바구니에 추가하시겠습니까?")
    print("1. 확인           2.취소")
    print("---------------------------------------------------")
    var isRunning = true
    while isRunning {
        guard let numStr = readLine(),
              let num = Int(numStr) else {
            print("번호를 잘못 입력하셨습니다")
            continue
        }
        
        switch num {
        case 1 :
            // 받아온 상품을 카트리스트에 추가
            cartList.append(item)
            print("---------------------------------------------------")
            print("\(item.name)을 장바구니에 추가하였습니다.")
            print("메뉴판으로 이동합니다.")
            print("---------------------------------------------------")
            isRunning = false
        case 2 :
            isRunning = false
        default:
            print("번호를 눌러주세요")
            continue
        }
    }
}

// 장바구니 보여주기 & 결제
func showCart() {
    var totalPrice : Double = 0
    if cartList.isEmpty {
        print("카트의 장바구니가 비어 있습니다.")
    } else {
        print("[ 장바구니 ]")
        for (index, item) in cartList.enumerated() {
            let paddedName = item.name.padding(toLength: 15, withPad: " ", startingAt: 0)
            print("\(index + 1). \(paddedName)| W\(item.price) | \(item.content)")
            totalPrice += item.price
        }
        print("---------------------------------------------------")
        print("총 금액 : \(totalPrice)")
        // 현재 유저의 잔고 출력
        account.printBalance()
        print("---------------------------------------------------")
        print("결제하시겠습니까?")
        print("1. 네   2. 아니오")
        let input = readLine()
        if input == "1" {
            // 결제 완료 & 잔고, 메시지 출력
            print(account.withdraw(value: totalPrice))
            // 대기시간을 메뉴 하나당 3분으로 설정
            waitingTime += cartList.count * 3
            // 장바구니 비우기
            cartList.removeAll()
            // 3초간 딜레이 추가
            sleep(3)
        } else {
            print("결제 하지 않겠습니다.")
        }
    }
}

shakeShack()
