//
//  Extensions.swift
//  YogaOnlineStore
//
//  Created by Anton Rasen on 09.01.2025.
//

import SwiftUI

extension View {
    func firstFont() -> some View {
        self
            .foregroundStyle(.primary)
            .font(.system(size: 17, weight: .bold, design: .rounded))
            .opacity(0.9)
    }
    
    func secondFont() -> some View {
        self
            .foregroundStyle(.primary)
            .font(.system(size: 15, weight: .regular, design: .rounded))
            .opacity(0.9)
    }
}
