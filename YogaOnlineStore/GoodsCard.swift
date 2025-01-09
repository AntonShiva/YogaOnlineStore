//
//  GoodsCard.swift
//  YogaOnlineStore
//
//  Created by Anton Rasen on 08.01.2025.
//

import SwiftUI

struct GoodsCard: View {
    let unitOfGoods: UnitOfGoods
    var body: some View {
        GeometryReader { geometry in 
            Image(unitOfGoods.image)
                .resizable()
                .scaledToFill()
                .frame(width: geometry.size.width, height: geometry.size.height)
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }
        .frame(height: UIScreen.main.bounds.width * 0.7)
      
    }
}

#Preview {
    GoodsCard(unitOfGoods: UnitOfGoods(nameOfGoods: "Имя", goodsDescription: "Чудесный товар самый самый", image: "2", price: 5555, isFavoriteProduct: false))
}
