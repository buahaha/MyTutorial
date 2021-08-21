//
//  LandmarkDetail.swift
//  MyTutorial
//
//  Created by Szymon Błaszczyński on 21/08/2021.
//

import SwiftUI
import MapKit

struct LandmarkDetail: View {
    var landmark: Landmark
    var body: some View {
        ScrollView {
            VStack() {
                MapView(coordinate: landmark.locationCoordinate)
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 300)
                CircleImage(image: landmark.image)
                    .offset(y: -130)
                    .padding(.bottom, -130)
                VStack(alignment: .leading) {
                    Text(landmark.name)
                        .padding()
                        .foregroundColor(.black)
                        .accentColor(.blue)
                        .font(.title)
                    HStack {
                        Text(landmark.park)
                        Spacer()
                        Text(landmark.state)
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    Text("Coś więcej o...")
                        .font(.title2)
                    Text(landmark.description)
                }
            }.frame(width: 400, height: 800, alignment: .center)
            
        }//.padding(.horizontal, 100)
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarks[7])
    }
}