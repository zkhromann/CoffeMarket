//
//  MainTabBar.swift
//  Coffeee
//
//  Created by Роман Захаров on 05.04.2023.
//

import SwiftUI

struct MainTabBar: View {
    var body: some View {
        TabView {
                    // Меню
                    CatalogView()
                        .tabItem {
                            Image(systemName: "menucard")
                            Text("Каталог")
                        }
                    
                    CartView(viewModel: CartViewModel.shared)
                        .tabItem {
                            Image(systemName: "cart")
                            Text("Корзина")
                        }
                    
                    
                    ProfileView()
                        .tabItem {
                            Image(systemName: "person.circle")
                            Text("Профиль")
                        }
                }
                .accentColor(.brown)
            
    }
}

struct MainTabBar_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBar()
    }
}
