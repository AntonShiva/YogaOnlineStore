//
//  ViewModel.swift
//  YogaOnlineStore
//
//  Created by Anton Rasen on 13.01.2025.
//

import SwiftUI
import FirebaseFirestore
import Observation

@Observable
final class ViewModel {
    var items: [ModelOfGoods] = []
    
    private let firestoreDatabase = Firestore.firestore().collection("YogaShop")
    
    var count: Int {
        items.filter{ $0.quantity ?? 0 > 0 }.count
    }
    
    var total: Int {
        items.reduce(0) { $0 + ($1.price * ($1.quantity ?? 0)) }
    }
    
    init() {
        fetch()
    }
    
    private func update(goods: ModelOfGoods, data: [String : Any]) {
        guard let id = goods.id else { return }
        firestoreDatabase.document(id).updateData(data)
    }
    
    func fetch() {
        firestoreDatabase.addSnapshotListener { shop, error in
            guard let document = shop?.documents else {
                print("Error: \(error!)")
                return
            }
            self.items = document.compactMap { document -> ModelOfGoods? in
                try? document.data(as: ModelOfGoods.self)
            }
        }
    }
    
    
    func togle(goods: ModelOfGoods) {
        update(goods: goods, data: ["isFavoriteProduct" : !goods.isFavoriteProduct])
    }
    
    func addGoodsUnitToCart(goods: ModelOfGoods) {
        update(goods: goods, data: ["quantity" : 1])
    }
    
    func removeGoodsUnitFromCart(goods: ModelOfGoods) {
        update(goods: goods, data: ["quantity" : 0])
    }
 
    func addMoreProduct(goods: ModelOfGoods) {
        let newQuantity = (goods.quantity ?? 0) + 1
        update(goods: goods, data: ["quantity" : newQuantity])
    }
    
    func reduceTheQuantityOfGoods(goods: ModelOfGoods) {
        let currentQuantity = goods.quantity ?? 0
        let newQuantity = max(currentQuantity - 1, 1)
        update(goods: goods, data: ["quantity" : newQuantity])
    }
}


