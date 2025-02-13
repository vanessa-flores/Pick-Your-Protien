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

let animalProteinCategories: [String] = ["Beef", "Pork", "Poultry", "Specialty Meats", "Seafood"]

let beefProteinOptions: [String] = ["Ground Beef",
                                    "Sirloin Tips",
                                    "Burger",
                                    "Ground Sirloin",
                                    "Flank Steak"]

let porkProteinOptions: [String] = ["Ground Pork",
                                    "St. Louis Ribs",
                                    "Baby Back Ribs",
                                    "Italian Sausage Links",
                                    "Boneless Pork Chops",
                                    "Pork Tenderloin",
                                    "Breakfast Sausage",
                                    "Bacon"]

let poultryProteinOptions: [String] = ["Chicken Meatballs",
                                       "Boneless Skinless Chicken Breasts",
                                       "Boneless Chicken Thighs",
                                       "Chicken Drumsticks",
                                       "Bone-in Chicken Thighs",
                                       "Chicken Wings",
                                       "Turkey Bacon",
                                       "Ground Turkey",
                                       "Ground Chicken",
                                       "Turkey Breast"]

let seafoodProteinOptions: [String] = ["Shrimp", "Atlantic Salmon", "Sockeye Salmon", "Sea Scallops", "Cod", "Gulf Shrimp"]

let specialtyMeatProteinOptions: [String] = ["Ground Lamb", "Ground Bison"]

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
