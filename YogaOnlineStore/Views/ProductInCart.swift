//
//  ProductInCart.swift
//  YogaOnlineStore
//
//  Created by Anton Rasen on 15.01.2025.
//

import SwiftUI

struct ProductInCart: View {
    @State private var value: Int = 0
    let modelOfGoods: ModelOfGoods
    @State var viewModel = ViewModel()
    var body: some View {
        ZStack(alignment: .trailing) {
            HStack(spacing: 19){
                Image(modelOfGoods.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                VStack(alignment: .leading, spacing: 20){
                    Text(modelOfGoods.nameOfGoods)
                    if let quantity = modelOfGoods.quantity {
                        let totalCost = quantity * modelOfGoods.price
                        Text("Цена \(totalCost)")
                    }
                    
                }
                Spacer()
            }
            .padding(9)
            .background(.background)
            .cornerRadius(19)
            VStack(alignment: .trailing, spacing: 24){
                Button {
                    viewModel.removeGoodsUnitFromCart(goods: modelOfGoods)
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title2)
                }
                .buttonStyle(.plain)
                
                HStack {
                    
                    Button{
                        viewModel.reduceTheQuantityOfGoods(goods: modelOfGoods)
                    } label: {
                        Image(systemName: "minus.rectangle.fill")
                            .foregroundColor(.primary)
                        
                    }
                    if let quantity = modelOfGoods.quantity {
                        Text("\(quantity)")
                            .firstFont()
                            .foregroundColor(.primary)
                    }
                    
                    Button {
                        viewModel.addMoreProduct(goods: modelOfGoods)
                    } label: {
                        Image(systemName: "plus.rectangle.fill")
                            .foregroundColor(.primary)
                    }
                }
                .buttonStyle(.plain)
                .font(.system(size: 27))
            }
            .padding()
            
        }
        .shadow(color: .black.opacity(0.2), radius: 7, x: 5, y: 6)
        .padding(.horizontal, 10)
    }
}

#Preview {
    NavigationStack {
        ShoppingCart()
    }
}
