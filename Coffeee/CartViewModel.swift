//
//  CartViewModel.swift
//  Coffeee
//
//  Created by Роман Захаров on 03.03.2023.
//

import Foundation

class CartViewModel: ObservableObject{
    
    static let shared = CartViewModel()
    
    private init() { }
    
    @Published var positions = [Position]()
    //сумма заказа в корзине
    var cost: Int {
        var sum = 0
        for pos in positions{
            sum += pos.cost
        }
        return sum
    }
    
    //метод добавления в корзину позиции
    func addPosition(_ position: Position){
        self.positions.append(position)
    }
}
