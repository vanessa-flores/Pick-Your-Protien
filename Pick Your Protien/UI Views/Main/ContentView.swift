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


