//
//  MenuView.swift
//  Coffeee
//
//  Created by Роман Захаров on 10.02.2023.
//

import SwiftUI

struct CoffeeModel {
    let name: String
    let image: String
}

struct MenuView: View {
    
    let cellModels = [ (id: "1",
                        title: "Маргарита Гурмэ",
                        image: "Not found",
                        price: 450,
                        descript: "Самая бомжатская пицца"),]
        
    var body: some View {
        NavigationView {
            ZStack{
                Color(hex: "E4E4E4")
                    .ignoresSafeArea()
                ScrollView (.vertical,showsIndicators: false){
                    ForEach(0..<10) { j in
                        HStack{
                            ForEach(0..<2) { i in
                                NavigationLink(destination: ProductView()) {
                                    //ProductCell(product: ProductCell [ j * 2 + i])
                                      //  .padding()
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    struct MenuView_Previews: PreviewProvider {
        static var previews: some View {
            MenuView()
        }
    }
}
