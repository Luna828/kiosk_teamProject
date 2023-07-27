import Foundation

struct Beers {
    
    let menuList: [Goods] = [
        Goods(name: "ShackMeister Ale", price: 6.8, content: "랜드엔폴트에서 특별히 양조한 맥주"),
        Goods(name: "Slow IPA", price: 6.8, content: "The Hard and Malt"),
        Goods(name: "Gorillager", price: 6.8, content: "Gorilla brewling"),
    ]
    
    func showBeerMenu(){
        print("[ BEER MENU ]")
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
                Kiosk().shakeShack()
            default:
                print("다시 선택해주세요")
                continue
            }
        }
    }
    
}
