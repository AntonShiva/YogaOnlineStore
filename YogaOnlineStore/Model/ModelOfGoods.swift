//
//  ModelOfGoods.swift
//  YogaOnlineStore
//
//  Created by Anton Rasen on 07.01.2025.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ModelOfGoods: Codable, Identifiable {
    @DocumentID var id: String?
    var nameOfGoods: String
    var goodsDescription: String
    var image: String
    var quantity: Int?
    var price: Int
    var isFavoriteProduct: Bool

}


