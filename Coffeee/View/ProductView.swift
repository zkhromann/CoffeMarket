//
//  ProductView.swift
//  Coffeee
//
//  Created by Роман Захаров on 12.02.2023.
//

import SwiftUI

struct ProductView: View {
    
    var viewModel: ProductViewModel
    @State private var alertIsPresented = false
    @State var size = "350 мл"
    @State var count = 1
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            VStack{
                Image(viewModel.product.image)
                    .resizable()
                    .padding()
                    .frame(width: 350, height: 350)
                
                Text("\(viewModel.product .title)")
                    .padding(13)
                    .font(Font.custom("times new roman", fixedSize: 40))
                    .foregroundColor(Color(hex: "573626"))
                
                Text("\(viewModel.product.descript)")
                    .padding(.horizontal)
                    .padding(5)
                    .font(Font.custom("times new roman", fixedSize: 18))
                    .foregroundColor(Color.gray)
                
                HStack{
                    Stepper("Количество", value: $count , in: 1...10)
                    Text("\(self.count)")
                        .padding(.leading, 30)
                }.padding(.horizontal)
                
                
                Picker("Размер ", selection: $size) {
                    
                    ForEach(viewModel.sizes, id: \.self) { item in
                        Text(item)
                    }
                }.pickerStyle(.segmented)
                    .padding()
                
                HStack{
                    Button {
                        
                        var position = Position(id: UUID().uuidString,
                                                product: viewModel.product,
                                                count: self.count)
                        position.product.price = viewModel.getPrice(size: size)
                        CartViewModel.shared.addPosition(position)
                        presentationMode.wrappedValue.dismiss()
                        
                    } label: {
                        Text("В корзину")
                            .padding(.horizontal)
                        Text("\(viewModel.getPrice(size: self.size)) ₽")
                    }
                    .padding()
                    .font(Font.custom("times new roman", fixedSize: 22))
                    .frame(maxWidth: .infinity)
                    .background(Color(hex: "E4E4E4"))
                    .foregroundColor(Color(hex: "573626"))
                    .cornerRadius(12 )
                    .padding(8)
                    .padding(.horizontal, 12)
                }
            }
        }
   }
}
    struct ProductView_Previews: PreviewProvider {
        static var previews: some View {
            ProductView(viewModel: ProductViewModel(product: Product (id: "1",
                                                                        title: "Латте",
                                                                        image: "latte",
                                                                        price: 200,
                                                                        descript: "Напиток на основе эспрессо и молока с небольшим количеством молочной пены")))
    }
}
