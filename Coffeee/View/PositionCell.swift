//
//  PositionCell.swift
//  Coffeee
//
//  Created by Роман Захаров on 28.03.2023.
//

import SwiftUI

struct PositionCell: View {
    //эту позицию передаем в ячейку
    let position: Position
    
    
    var body: some View {
        HStack {
            Text(position.product.title)
                .fontWeight(.bold)
            Spacer()
            Text("\(position.count) шт.")
            Text("\(position.cost) ₽")
                .frame(width: 85, alignment: .trailing)
        }.padding(.horizontal)
    }
}

struct PositionCell_Previews: PreviewProvider {
    static var previews: some View {
        PositionCell(position: Position(id: UUID().uuidString, product: Product(id: UUID().uuidString,
                                                                                title: "Раф",
                                                                                image: "raf",
                                                                                price: 200 ,
                                                                                descript: "Кофе на основе сливок"),count: 3))
    }
}
