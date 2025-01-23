

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
                    Text("Любимые товары")
                }
            
            ShoppingCart()
                .tabItem {
                    Image(systemName: "cart")
                     Text("Корзина")
                }
                .badge(viewModel.count)
        }
    }
}

#Preview {
    MyTabView()
}
