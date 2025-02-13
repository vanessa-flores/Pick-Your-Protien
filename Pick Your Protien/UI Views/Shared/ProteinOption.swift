//
//  ProteinOption.swift
//  Pick Your Protien
//
//  Created by Vanessa Flores on 2/13/25.
//

import SwiftUI

struct ProteinOption: View {
    let imageName: ImageNames
    let title: String
    let isSelected: Bool
    
    init(imageName: ImageNames, title: String, isSelected: Bool = false) {
        self.imageName = imageName
        self.title = title
        self.isSelected = isSelected
    }
    
    var backgroundColor: Color {
        isSelected ? Color.orange.opacity(0.3) : Color.secondary.opacity(0.4)
    }
    
    var borderWidth: CGFloat {
        isSelected ? 1.0 : 0.0
    }
    
    var inset: CGFloat {
        isSelected ? 1.0 : 0.0
    }
    
    var titleFontWeight: Font.Weight {
        isSelected ? .semibold: .regular
    }
    
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: imageName.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .foregroundStyle(.tint)
            Text(title)
                .font(.footnote)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .fontWeight(titleFontWeight)
        }
        .frame(width: 90, height: 90)
        .padding()
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .inset(by: inset)
                .stroke(.secondary, lineWidth: borderWidth)
        )
        .background(RoundedRectangle(cornerRadius: 20).fill(backgroundColor))
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ProteinOption(imageName: .forkKnife, title: "Atlantic Salmon")
    ProteinOption(imageName: .forkKnife, title: "Atlantic Salmon", isSelected: true)
}

public enum ImageNames: String {
    case forkKnife = "fork.knife"
    case carrot = "carrot"
    case fish = "fish.fill"
}
