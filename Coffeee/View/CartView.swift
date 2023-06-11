//
//  CartView.swift
//  Coffeee
//
//  Created by Роман Захаров on 03.03.2023.
//

import SwiftUI

struct CartView: View {
    @StateObject var viewModel: CartViewModel
    @State var isOplataPresented = false
    var body: some View {
        VStack {
            List(viewModel.positions){ position in
                PositionCell(position: position)
                    .swipeActions {
                        Button {
                            viewModel.positions.removeAll { pos in
                                pos .id == position.id
                            }
                        } label: {
                            Text("Удалить")
                        }.tint(.red)
                        
                    }
            }
            .listStyle(.plain)
            .navigationTitle("Корзина")
            HStack{
                Text("Итого:")
                    .fontWeight(.bold)
                Spacer()
                Text("\(self.viewModel.cost) ₽")
                    .fontWeight(.bold)
            }.padding(20)
            
            HStack(spacing: 24){
                Button {
                    isOplataPresented.toggle()
                } label: {
                    Text("Заказать")
                        .font(.body)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .background(Color.brown)
                        .cornerRadius(15)
                } .alert(isPresented: $isOplataPresented) {
                  Alert(title: Text("Оплата"),message: Text("С вашей карты будет списано \(self.viewModel.cost) ₽"), primaryButton: .default(Text("Ок")),
                      secondaryButton: .cancel(Text("Cancel"))
                  )}
                }.padding()
            }
        }
    }
struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(viewModel: CartViewModel.shared)
    }
}
