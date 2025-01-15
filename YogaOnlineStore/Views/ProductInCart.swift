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
                    Text("Цена \(modelOfGoods.price)")
                }
                Spacer()
            }
            .padding(9)
            .background(.background)
            .cornerRadius(19)
            VStack(alignment: .trailing, spacing: 24){
                Button {
                    
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title2)
                }
                .buttonStyle(.plain)
                
                HStack {
                    
                    Button{
                        //                        if var quantity = modelOfGoods.quantity {
                        //                            if quantity > 0 {
                        //                                quantity -= 1
                        //                            }
                        //                        }
                    } label: {
                        Image(systemName: "minus.rectangle.fill")
                            .foregroundColor(.primary)
                        
                    }
                    if var quantity = modelOfGoods.quantity {
                        Text("\(quantity)")
                            .firstFont()
                            .foregroundColor(.primary)
                    }
                    
                    Button {
                        //                        if var quantity = modelOfGoods.quantity {
                        //                            if quantity > 0 {
                        //                                quantity += 1
                        //                            }
                        //                        }
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
        .background(.secondary.opacity(0.3))
    }
}

#Preview {
    NavigationStack {
        ShoppingCart()
    }
}