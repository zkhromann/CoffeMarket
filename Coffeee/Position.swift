//
//  Position.swift
//  Coffeee
//
//  Created by Роман Захаров on 03.03.2023.
//
//корзина
import Foundation
struct Position: Identifiable {
    
    var id: String
    var product: Product
    var count: Int
    var cost: Int {
        return product.price * self.count
        
    }
}
