//
//  CategoryPill.swift
//  Pick Your Protien
//
//  Created by Vanessa Flores on 2/13/25.
//

import SwiftUI

struct CategoryPill: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.headline)
            .padding([.leading, .trailing])
            .padding([.top, .bottom], 10)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .inset(by: 2)
                    .stroke(.secondary, lineWidth: 2)
            )
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CategoryPill(title: "Beef")
}
