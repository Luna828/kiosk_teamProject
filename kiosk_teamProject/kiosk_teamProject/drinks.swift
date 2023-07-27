import Foundation

struct Drinks {
    
    let menuList: [Goods] = [
        Goods(name: "Lemonad", price: 4.5, content: "부드러운 바닐라 커스터드와 탄산 플로트"),
        Goods(name: "Brewed Iced Tea", price: 3.9, content: "부드럽고 쫀득한 바닐라, 초코 커스터드"),
        Goods(name: "Abita Root Beer", price: 4.4, content: "부드럽고 쫀득한 바닐라, 초코 커스터드"),
        Goods(name: "Hot tea", price: 3.4, content: "쿠키 & 크림 쉐이크, 바닐라/초콜렛/딸기"),
        Goods(name: "Fountain Soda", price: 3.3, content: "솔티드 카라멜, 피넛버터, 커피")
    ]
    
    func showDrinkMenu(){
        print("[ DRINKS MENU ]")
        for (index, menu) in menuList.enumerated() {
            let paddedName = menu.name.padding(toLength: 17, withPad: " ", startingAt: 0)
            print("\(index + 1). \(paddedName)| W\(menu.price) |  \(menu.content)")
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
            default:
                print("다시 선택해주세요")
                continue
            }
        }
    }
    
}
