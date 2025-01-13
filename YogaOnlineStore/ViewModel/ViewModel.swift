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
    
    func togle(goods: UnitOfGoods) {
        guard let id = goods.id else { return }
        firestoreDatabase.document(id).updateData(["isFavoriteProduct" : !goods.isFavoriteProduct])
    }
}


