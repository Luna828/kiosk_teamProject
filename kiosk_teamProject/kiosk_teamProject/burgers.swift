import Foundation

struct Burgers {
    
    let menuList: [ShackBurger] = [
        ShackBurger(name: "ShackBurger", price: 6.9, content: "토마토, 양상추, 쉑소스가 토핑된 치즈버거"),
        ShackBurger(name: "SmokeShack", price: 8.9, content: "베이컨, 체리 페퍼에 쉑소스가 토핑된 치즈버거"),
        ShackBurger(name: "Shroom Burger", price: 9.4, content: "몬스터 치즈와 체다 치즈로 속을 채운 베지테리안 버거"),
        ShackBurger(name: "Cheeseburger", price: 6.9, content: "포테이토 번과 비프패티, 치즈가 토핑된 치즈버거"),
        ShackBurger(name: "Hamburger", price: 5.4, content: "비프패티를 기반으로 야채가 들어간 기본버거")
    ]
    
    func showBurgerMenu(){
      
        print("[ Burgers MENU ]")
        for (index, menu) in menuList.enumerated() {
            let paddedName = menu.name.padding(toLength: 15, withPad: " ", startingAt: 0)
            print("\(index + 1). \(paddedName)| \(menu.content)")
        }
        print("0. 뒤로가기")
        print("---------------------------------------------------")
        
        while true {
            guard let numStr = readLine(),
                  let num = Int(numStr) else {
                print("번호를 잘못 입력하셨습니다")
                continue
            }
            
            switch num {
            case 1 :
                print("")
            case 2 :
                print("")
            case 3 :
                print("")
            case 4 :
                print("")
            case 5 :
                print("")
            case 0 :
                print("뒤로가기")
                Kiosk().shakeShack()
            default:
                print("다시 선택해주세요")
                continue
            }
        }
    }
    
}
