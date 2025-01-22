//
//  ShoppingCart.swift
//  YogaOnlineStore
//
//  Created by Anton Rasen on 08.01.2025.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct ShoppingCart: View {
    @FirestoreQuery(collectionPath: "YogaShop") var items: [ModelOfGoods]
    
    @State var viewModel = ViewModel()
    
    var body: some View {
        VStack{
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(items.filter { $0.quantity ?? 0 > 0 }) { item in
                    ProductInCart(modelOfGoods: item)
                }
            }
           
            
            Text("Общая сумма: \(viewModel.total)")
                .firstFont()
                .padding()
            Button {
                
            } label: {
                Text("Купить")
                    .frame(maxWidth: .infinity)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .padding()
                    .background(.black.opacity(0.8))
                    .clipShape(.capsule)
                    .shadow(color: .black.opacity(0.4), radius: 9, x: 5, y: 7)
            }
            .padding(.horizontal, 29)
        
    }
        .padding(.bottom, 35)
        .navigationTitle("Корзина")
        .background(.secondary.opacity(0.3))
        
    }
}

#Preview {
    ShoppingCart()
}
