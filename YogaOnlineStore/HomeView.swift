//
//  ContentView.swift
//  YogaOnlineStore
//
//  Created by Anton Rasen on 07.01.2025.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct HomeView: View {
    @FirestoreQuery(collectionPath: "YogaShop") var items: [UnitOfGoods]
    var body: some View {
        NavigationStack{
            ScrollView(.vertical, showsIndicators: false){
                LazyVGrid(columns: Array(repeating: GridItem(), count: 2)) {
                    ForEach(items) {item in
                        GoodsCard(unitOfGoods: item)
                    }
                }
                
            }
        }
        .padding(10)
}
}

#Preview {
    HomeView()
}
