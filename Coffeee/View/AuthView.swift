//
//  SignIn.swift
//  Coffeee
//
//  Created by Роман Захаров on 10.02.2023.
//

import SwiftUI


struct AuthView : View {
    
    @State private var isAuth = true
    @State var email = ""
    @State var pass = ""
    @State private var confirmPassword = ""
    @State private var isTabViewShow = false
    var body : some View {
        NavigationView {
            VStack(spacing: 20) {
                Text (isAuth ? "Авторизация" : "Регистрация")
                    .padding(isAuth ? 16 : 24)
                    .padding(.horizontal,30)
                    .font (.title.bold())
                    .background (Color ("whiteAlpha"))
                    .foregroundColor(Color(hex: "573626"))
                    .cornerRadius(isAuth ? 30 : 60)
                
                VStack{
                    TextField("Введите Email", text: $email)
                        .padding()
                        .background (Color ("whiteAlpha"))
                        .cornerRadius(12)
                        .padding(8)
                        .padding(.horizontal, 12)
                    
                    SecureField("Введите пароль", text: $pass)
                        .padding()
                        .background (Color ("whiteAlpha"))
                        .cornerRadius(12 )
                        .padding(8)
                        .padding(.horizontal, 12)
                    if !isAuth {
                        SecureField("Повторите пароль", text: $confirmPassword)
                            .padding()
                            .background (Color ("whiteAlpha"))
                            .cornerRadius(12 )
                            .padding(8)
                            .padding(.horizontal, 12)
                    }
                    
                    Button {
                        if isAuth{
                            print("Авторизация")
                            isTabViewShow.toggle()
                        } else {
                            print("Регистрация")
                            self.email = ""
                            self.pass = ""
                            self.confirmPassword = ""
                            self.isAuth.toggle()
                        }
                        
                    } label: {
                        Text (isAuth ? "Войти" : "Создать аккаунт")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background (Color ("whiteAlpha"))
                            .foregroundColor(Color(hex: "573626"))
                            .cornerRadius(12 )
                            .padding(8)
                            .padding(.horizontal, 12)
                    }
                    
                    Button {
                        isAuth.toggle()
                    } label: {
                        Text(isAuth ? "Зарегистрироваться" : "Уже есть аккаунт")
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity)
                            .cornerRadius (12)
                            .padding (8)
                            .padding (.horizontal, 12)
                            .font (.title3.bold ())
                            .foregroundColor(Color ("whiteAlpha"))
                    }
                }
                .padding()
                .padding(.top, 16)
                .background(Color("whiteAlpha"))
                .cornerRadius(24 )
                .padding(isAuth ? 30 : 12)
                
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Image ("fon").ignoresSafeArea()
                    .blur(radius: isAuth ? 0 : 5))
                .animation(Animation.easeInOut(duration: 0.4), value: isAuth )
                .fullScreenCover(isPresented: $isTabViewShow) {
                    MainTabBar()
                }
            }
        }
    }

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
