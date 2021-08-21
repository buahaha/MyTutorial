//
//  ContentView.swift
//  Shared
//
//  Created by Szymon Błaszczyński on 21/08/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .promo
    
    enum Tab {
        case promo
        case list
    }
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Promo", systemImage: "star")
                }
                .tag(Tab.promo)
            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
