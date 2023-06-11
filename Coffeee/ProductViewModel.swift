//
//  ProductViewModel.swift
//  Coffeee
//
//  Created by Роман Захаров on 15.02.2023.
//

import Foundation

class ProductViewModel: ObservableObject{
    @Published var product: Product
    @Published var sizes = ["250 мл","350 мл","450 мл"]
    @Published var count = 0
    init(product: Product) {
        self.product = product
    }
    //стоимость в зависимости от размера
    func getPrice(size: String) -> Int {
        switch size{
        case "250 мл": return product.price
        case "350 мл": return Int(Double(product.price) * 1.25)
        case "450 мл": return Int(Double(product.price) * 1.5)
        default: return 0
        }
    }
}
