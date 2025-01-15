//
//  GoodsCard.swift
//  YogaOnlineStore
//
//  Created by Anton Rasen on 08.01.2025.
//

import SwiftUI
import Observation

struct GoodsCard: View {
    @State var viewModel = ViewModel()
    let unitOfGoods: ModelOfGoods
    var body: some View {
        GeometryReader { geometry in 
            ZStack(alignment: .bottom) {
                ZStack(alignment: .topTrailing) {
                    Image(unitOfGoods.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    Button {
                        viewModel.togle(goods: unitOfGoods)
                    } label: {
                        Image(systemName: "heart.fill")
                            .padding(10)
                            .foregroundStyle(unitOfGoods.isFavoriteProduct ? .red : .white.opacity(0.7))
                            .background(.black.opacity(0.6))
                            .clipShape(Circle())
                            .padding()
                    }
                }
                VStack(alignment: .leading){
                    Text(unitOfGoods.nameOfGoods)
                        .firstFont()
                    Text("Цена - \(unitOfGoods.price)")
                        .secondFont()
                        .lineLimit(1)
                }
                .padding(10)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.background.opacity(0.8))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(7)
            }
        }
        .frame(height: UIScreen.main.bounds.width * 0.7)
    }
}

#Preview {
    HomeView()
}
