//
//  LandmarkList.swift
//  MyTutorial
//
//  Created by Szymon Błaszczyński on 21/08/2021.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly: Bool = false
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    var body: some View {
        NavigationView {
            List() {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites")
                }
                ForEach(filteredLandmarks) { landmark in
                    
                        NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                            LandmarkRow(landmark: landmark)
                       }
                        
                    
                }
            }
//            .transition(.slide)
//            .animation(.easeIn(duration: 2.33))
//            .animation(.ripple(index: 3))
            .navigationTitle("Viewables")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
//        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
           LandmarkList()
            .environmentObject(ModelData())

//               .previewDevice(PreviewDevice(rawValue: deviceName))
//            .previewDisplayName(deviceName)
//       }
    }
}
