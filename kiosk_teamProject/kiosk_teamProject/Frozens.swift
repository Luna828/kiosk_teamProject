import Foundation

struct Frozens {
    
    let menuList: [FrozenCustard] = [
        FrozenCustard(name: "Floats", price: 5.9, content: "부드러운 바닐라 커스터드와 탄산 플로트"),
        FrozenCustard(name: "SmokCup & Cones SingleeShack", price: 4.9, content: "부드럽고 쫀득한 바닐라, 초코 커스터드"),
        FrozenCustard(name: "Cup & Cones Double", price: 5.9, content: "부드럽고 쫀득한 바닐라, 초코 커스터드"),
        FrozenCustard(name: "Featured Shakes", price: 6.5, content: "쿠키 & 크림 쉐이크, 바닐라/초콜렛/딸기"),
        FrozenCustard(name: "Shakes", price: 5.9, content: "솔티드 카라멜, 피넛버터, 커피")
    ]
    
    func showFrozenMenu(){
        
        print("[ Frozen Custard MENU ]")
        for (index, menu) in menuList.enumerated() {
            let paddedName = menu.name.padding(toLength: 30, withPad: " ", startingAt: 0)
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
