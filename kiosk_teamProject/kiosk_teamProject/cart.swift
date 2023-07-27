//
//  cart.swift
//  kiosk_teamProject
//
//  Created by t2023-m0050 on 2023/07/27.
//

import Foundation

class Cart {
    var items: [Goods] = []
    
    func addItem(_ item: Goods) {
        for item in items {
            let paddedName = item.name.padding(toLength: 15, withPad: " ", startingAt: 0)
            print("\(paddedName) | W\(item.price) | \(item.content)")
        }
        print("위 메뉴를 장바구니에 추가하시겠습니까?")
        print("1. 확인           2.취소")
        while true {
            guard let numStr = readLine(),
                  let num = Int(numStr) else {
                print("번호를 잘못 입력하셨습니다")
                continue
            }
            
            switch num {
            case 1 :
                items.append(item)
                showCart()
                
            case 2 :
                exit(0)
            default:
                print("번호를 눌러주세요")
                continue
            }
        }
        
    }
    
    func showOrderMenu() {
        print("아래와 같이 주문하시겠습니까?")
        showCart()
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
                Kiosk().shakeShack() // 뒤로가기 기능을 위해 showMenu() 호출
            case 2:
                Kiosk().shakeShack() // 뒤로가기 기능을 위해 showMenu() 호출
            default:
                print("다시 선택해주세요")
                continue
            }
        }
    }
    
    func showCart() {
        if items.isEmpty {
            print("장바구니가 비어 있습니다.")
        } else {
            print("[ 장바구니 ]")
            for (index, item) in items.enumerated() {
                let paddedName = item.name.padding(toLength: 15, withPad: " ", startingAt: 0)
                print("\(index + 1). \(paddedName)| W\(item.price) | \(item.content)")
            }
            print("---------------------------------------------------")
        }
    }
}
