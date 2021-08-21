//
//  LandmarkRow.swift
//  MyTutorial
//
//  Created by Szymon Błaszczyński on 21/08/2021.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()
        }
        if landmark.isFavorite {
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static let modelData = ModelData()
    static var previews: some View {
        Group {
            LandmarkRow(landmark: modelData.landmarks[1])
            LandmarkRow(landmark: modelData.landmarks[0])
                
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
