//
//  ProfileView.swift
//  Coffeee
//
//  Created by Роман Захаров on 05.04.2023.
//

import SwiftUI

struct ProfileView: View {
    @State var isAvaAlertPresented = false
    @State var isQuitAlertPresented = false
    @State var isAuthViewPresented = false
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            HStack (spacing: 16){
                Image("user")
                    .resizable()
                    .frame(width: 90, height: 90)
                    .clipShape(Circle())
                    .onTapGesture {
                        isAvaAlertPresented.toggle()
                    }
                    .confirmationDialog( "Откуда взять фото?", isPresented: $isAvaAlertPresented) {
                        Button {
                            print("Library")
                        } label: {
                            Text("Выбрать из галереи")
                        }
                        Button {
                            print("Camera")
                        } label: {
                            Text("Сделать фото")
                        }
                        

                    }
                
                VStack(alignment: .leading , spacing: 12){
                    Text("Роман Захаров")
                        .bold()
                    Text("+7 900316491")
                }
            }
            //таблица с заказами
            List{
                Text("Ваши покупки")
            }.listStyle(.plain)
            
            VStack {
                Button {
                    isQuitAlertPresented.toggle()
                } label: {
                    Text("Выйти")
                        .padding()
                        .padding(.horizontal, 80)
                        .background(Color.brown)
                        .foregroundColor(Color.white)
                        .bold()
                        .cornerRadius(15)
                }.padding()
                    .confirmationDialog( "Действительно хотите выйти?", isPresented: $isQuitAlertPresented) {
                        Button {
                            isAuthViewPresented.toggle()
                        } label: {
                            Text("Да")
                        }

                    }.fullScreenCover(isPresented: $isAuthViewPresented, onDismiss: nil) {
                        AuthView()
                    }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
