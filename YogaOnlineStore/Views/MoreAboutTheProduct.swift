//
//  MoreAboutTheProduct.swift
//  YogaOnlineStore
//
//  Created by Anton Rasen on 13.01.2025.
//

import SwiftUI

struct MoreAboutTheProduct: View {
    @State var viewModel = ViewModel()
    let model: ModelOfGoods
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            VStack{
                Image(model.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.7)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .ignoresSafeArea()
                    .shadow(color: .black.opacity(0.3), radius: 9, x: 5, y: 8)
                
                VStack(alignment: .leading, spacing: 22) {
                    HStack{
                        Text(model.nameOfGoods)
                            .firstFont()
                        Spacer()
                        Text("Цена:  \(model.price) руб")
                            .firstFont()
                    }
                    
                    Text(model.goodsDescription)
                        .secondFont()
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(6)
                    
                    Spacer()
                    
                    Button {
                        viewModel.addGoodsUnitToCart(goods: model)
                    } label: {
                        Text("В корзину")
                            .frame(maxWidth: .infinity)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                            .padding()
                            .background(.black.opacity(0.8))
                            .clipShape(.capsule)
                            .shadow(color: .black.opacity(0.4), radius: 9, x: 5, y: 7)
                    }
                    
                }
                .padding(.horizontal, 31)
            }
            .navigationBarBackButtonHidden()
            
            
            Button {
                dismiss()
            } label: {
                ZStack{
                Circle()
                    .frame(width: 35)
                    .foregroundStyle(.black.opacity(0.3))
                Image(systemName: "chevron.left")
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundStyle(.white.opacity(0.8))
            }
         }
            .padding(.leading)
        }
        .padding(.bottom, 65)
        .background(.secondary.opacity(0.3))
    }
}

#Preview {
    MoreAboutTheProduct(model: ModelOfGoods(nameOfGoods: "Медитация", goodsDescription: "Гонг медитации создается особенное звуковое энергетическое поле, в котором психоэмоциональные чувства становится понятными и истинными, и человек находит ответы и решения.", image: "1", price: 9900, isFavoriteProduct: false))
    
}
