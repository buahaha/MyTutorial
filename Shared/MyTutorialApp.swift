//
//  MyTutorialApp.swift
//  Shared
//
//  Created by Szymon Błaszczyński on 21/08/2021.
//

import SwiftUI

@main
struct MyTutorialApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
