import Foundation

struct Frozens {
    
    let menuList: [Goods] = [
        Goods(name: "Floats", price: 5.9, content: "부드러운 바닐라 커스터드와 탄산 플로트"),
        Goods(name: "SmokCup & Cones SingleeShack", price: 4.9, content: "부드럽고 쫀득한 바닐라, 초코 커스터드"),
        Goods(name: "Cup & Cones Double", price: 5.9, content: "부드럽고 쫀득한 바닐라, 초코 커스터드"),
        Goods(name: "Featured Shakes", price: 6.5, content: "쿠키 & 크림 쉐이크, 바닐라/초콜렛/딸기"),
        Goods(name: "Shakes", price: 5.9, content: "솔티드 카라멜, 피넛버터, 커피")
    ]
    
    func showFrozenMenu(){
        
        print("[ Frozen Custard MENU ]")
        for (index, menu) in menuList.enumerated() {
            let paddedName = menu.name.padding(toLength: 15, withPad: " ", startingAt: 0)
            print("\(index + 1). \(paddedName)| W\(menu.price) | \(menu.content)")
        }
        print("0. 뒤로가기")
        print("---------------------------------------------------")
        var Running = true
        while Running {
            guard let numStr = readLine(),
                  let num = Int(numStr) else {
                print("번호를 잘못 입력하셨습니다")
                continue
            }
            
            switch num {
            case 1...menuList.count:
                let selectedItem = menuList[num - 1]                // 인덱스이기 때문에 번호 - 1
                addItem(selectedItem)
                Running = false
            case 0 :
                print("뒤로가기")
                Running = false
            default:
                print("다시 선택해주세요")
            }
        }
    }
    
}
