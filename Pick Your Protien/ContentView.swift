//
//  ContentView.swift
//  Pick Your Protien
//
//  Created by Vanessa Flores on 2/13/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(animalProteinCategories, id: \.self) { protein in
                        CategoryPill(title: protein)
                    }
                }
            }
            
            
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}



struct CategoryPill: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.headline)
            .padding([.leading, .trailing])
            .padding([.top, .bottom], 4)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.secondary, lineWidth: 2)
            )
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CategoryPill(title: "Beef")
}
