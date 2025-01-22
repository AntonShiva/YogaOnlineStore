//
//  TabView.swift
//  YogaOnlineStore
//
//  Created by Anton Rasen on 20.01.2025.
//

import SwiftUI

struct MyTabView: View {
    @State var viewModel = ViewModel()
    var body: some View {
        TabView {
            HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Главная")
                    }
            
            FavoriteProducts()
                .tabItem {
                    Image(systemName: "heart.fill")
                        .foregroundStyle(.red)
                    Text("Любимые товары")
                }
                
            ShoppingCart()
                    .tabItem {
                       
                            Image(systemName: "cart")
                                .font(.title2)
                                .padding(.top, 5)
                            
                            Text("Корзина")
                      
                    }
                    .badge(viewModel.count)
            }
    }
}

#Preview {
    MyTabView()
}
