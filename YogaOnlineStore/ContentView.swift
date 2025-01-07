//
//  ContentView.swift
//  YogaOnlineStore
//
//  Created by Anton Rasen on 07.01.2025.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct ContentView: View {
    @FirestoreQuery(collectionPath: "YogaShop") var items: [UnitOfGoods]
    var body: some View {
        VStack {
            List{
                ForEach(items) {item in
                    Text(item.nameOfGoods)
                    Image(item.image)
                        .resizable()
                        .frame(height: 200)
                    Text("Цена \(item.price) руб.")
                    Text(item.goodsDescription)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
