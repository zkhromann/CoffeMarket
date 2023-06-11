//
//  CatalogIView.swift
//  Coffeee
//
//  Created by Роман Захаров on 15.02.2023.
//

import SwiftUI

struct CatalogView: View {
    let layout = [GridItem(.adaptive(minimum: screen.width / 2.4 ))]
    @State private var isFullScreen = false
    
    var body: some View {
        NavigationView{
            ZStack{
                Color(hex: "E4E4E4")
                    .ignoresSafeArea()
                
                ScrollView(.vertical, showsIndicators: false) {
                    Spacer(minLength: 20)
                    
                    Section("Популярное") {
                        ScrollView(.horizontal, showsIndicators: false){
                            LazyHGrid(rows : layout, spacing: 16) {
                                ForEach(CatalogViewModel.shared.PopProducts, id: \.id){
                                    item in
                                    NavigationLink {
                                        
                                        let viewModel = ProductViewModel(product: item)
                                        
                                        ProductView(viewModel: viewModel)
                                    } label: {
                                        ProductCell(product: item)
                                    }
                                }
                            }.padding()
                        }
                    }
                   
                    Section("Кофе") {
                        ScrollView(.vertical, showsIndicators: false){
                            LazyVGrid(columns: layout, spacing: 16) {
                                ForEach(CatalogViewModel.shared.CoffeeProducts, id: \.id ){
                                    item in
                                    NavigationLink {
                                        let viewModel = ProductViewModel(product: item)
                                        ProductView(viewModel: viewModel)
                                    } label: {
                                        ProductCell(product: item) 
                                    }
                                    
                                }
                            }.padding()
                        }
                    }
                    
                    Section("Чай") {
                        ScrollView(.vertical, showsIndicators: false){
                            LazyVGrid(columns: layout, spacing: 16) {
                                ForEach(CatalogViewModel.shared.ChaiProducts, id: \.id){
                                    item in
                                    NavigationLink {
                                        
                                        let viewModel = ProductViewModel(product: item)
                                        
                                        ProductView(viewModel: viewModel)
                                    } label: {
                                        ProductCell(product: item)
                                    }
                                    
                                }
                            }.padding()
                        }
                    }
                    Section("Десерты") {
                        ScrollView(.vertical, showsIndicators: false){
                            LazyVGrid(columns: layout, spacing: 16) {
                                ForEach(CatalogViewModel.shared.DesertProducts, id: \.id){
                                    item in
                                    NavigationLink {
                                        
                                        let viewModel = ProductViewModel(product: item)
                                        
                                        ProductView(viewModel: viewModel)
                                    } label: {
                                        ProductCell(product: item)
                                    }
                                    
                                }
                            }.padding()
                        }
                    }
                }
                
            }
            .navigationTitle("Каталог")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
struct CatalogIView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView()
    }
}
