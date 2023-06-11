//
//  CollectionViewCell.swift
//  Coffeee
//
//  Created by Роман Захаров on 10.02.2023.
//

import SwiftUI

struct ProductCell: View {
    var product: Product
    
    var body: some View {
        ZStack{
            Color(hex: "E4E4E4")
                .ignoresSafeArea()
            VStack{
                
                Image(product.image)
                    .resizable()
                    .frame(width: 140, height: 140)
                    .padding(2)
                Text(product.title)
                    .foregroundColor(Color(hex: "573626"))
                    .font(Font.custom("times new roman", fixedSize: 19))
                    .padding(1)

                Text("\(product.price) ₽")
                    .font(Font.custom("times new roman", fixedSize: 18))
                    .foregroundColor(Color.gray)

                
                
            }
            .frame(width: screen.width * 0.4 , height: screen.width * 0.55)
            .background(Color(hex: "FFFFFF"))
            .cornerRadius(15)

        }
    }
}
    struct CollectionViewCell_Previews: PreviewProvider {
        static var previews: some View {
            ProductCell(product: Product (id: "1",
                                          title: "Латте",
                                          image: "latte",
                                          price: 200,
                                          descript: "Самая бомжатская пицца"))
        }
    }
