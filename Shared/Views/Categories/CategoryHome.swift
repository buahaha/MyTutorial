//
//  CategoryHome.swift
//  MyTutorial
//
//  Created by Szymon Błaszczyński on 21/08/2021.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false
    
    var body: some View {
        NavigationView {
            withAnimation {
                
            
            List() {
                PageView(pages: modelData.featured.map { FeatureCard(landmark: $0) })
                       .aspectRatio(3 / 2, contentMode: .fit)
//                modelData.featured[0].image
//                    .resizable()
//                    .scaledToFill()
//                    .frame(height: 200)
//                    .clipped()
//                    .listRowInsets(EdgeInsets())
//                    .transition(.slide)
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                        .animation(.ripple(index: 1))
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(InsetListStyle())
            .navigationTitle("Promo")
            .toolbar {
               Button(action: { showingProfile.toggle() }) {
                   Image(systemName: "person.crop.circle")
                       .accessibilityLabel("User Profile")
               }
           }
           .sheet(isPresented: $showingProfile) {
               ProfileHost()
                   .environmentObject(modelData)
           }

            }
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
