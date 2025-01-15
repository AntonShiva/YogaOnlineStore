//
//  FavoriteProducts.swift
//  YogaOnlineStore
//
//  Created by Anton Rasen on 08.01.2025.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct FavoriteProducts: View {
    @FirestoreQuery(collectionPath: "YogaShop", predicates: [.isEqualTo("isFavoriteProduct", true)]) var items: [ModelOfGoods]
    var body: some View {
        NavigationStack{
            ScrollView(.vertical, showsIndicators: false){
                LazyVGrid(columns: Array(repeating: GridItem(), count: 2)) {
                    ForEach(items) {item in
                        NavigationLink(destination: MoreAboutTheProduct(model: item)) {
                            GoodsCard(unitOfGoods: item)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .padding(.horizontal, 10)
            .background(.secondary.opacity(0.2))
            .shadow(color: .black.opacity(0.2), radius: 7, x: 5, y: 7)
        }
    }
}

#Preview {
    FavoriteProducts()
}
