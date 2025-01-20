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
    
    private let firestoreDatabase = Firestore.firestore().collection("YogaShop")
    
    
    private func update(goods: ModelOfGoods, data: [String : Any]) {
        guard let id = goods.id else { return }
        firestoreDatabase.document(id).updateData(data)
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


