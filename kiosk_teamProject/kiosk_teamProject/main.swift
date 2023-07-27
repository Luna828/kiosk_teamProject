import Foundation

class Kiosk {
    
    var cart = Cart()
    
    let menuList: [Menu] = [
        Menu(name: "Burgers", content: "앵거스 비프 통살을 다져만든 버거"),
        Menu(name: "Frozen Custard", content: "매장에서 신선하게 만드는 아이스크림"),
        Menu(name: "Drinks", content: "매장에서 직접 만드는 음료"),
        Menu(name: "Beer", content: "뉴욕 브루클린 브루어리에서 양조한 맥주"),
        Menu(name: "Cart", content: ""),
        Menu(name: "Exit", content: "프로그램 종료")
    ]
    
    func showOrderMenu() {
        print("아래와 같이 주문하시겠습니까?")
        cart.showCart()
        print("1. 확인")
        print("2. 취소")
        
        while true {
            guard let numStr = readLine(),
                  let num = Int(numStr) else {
                print("번호를 잘못 입력하셨습니다")
                continue
            }
            
            switch num {
            case 1:
                print("\n주문이 완료되었습니다!")
                cart = Cart() //주문 완료 장바구니 초기화
                shakeShack() // 뒤로가기 기능을 위해 showMenu() 호출
            case 2:
                shakeShack() // 뒤로가기 기능을 위해 showMenu() 호출
            default:
                print("다시 선택해주세요")
                continue
            }
        }
    }
        
        func shakeShack() {
            
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
                case 2 :
                    print("---------------------------------------------------")
                    Frozens().showFrozenMenu()
                case 3 :
                    print("---------------------------------------------------")
                    Drinks().showDrinkMenu()
                case 4 :
                    print("---------------------------------------------------")
                    Beers().showBeerMenu()
                case 5 :
                    showOrderMenu()
                case 6 :
                    print("프로그램 종료")
                    exit(0)
                default:
                    print("다시 선택해주세요")
                    continue
                }
            }
        }
    }

Kiosk().shakeShack()
