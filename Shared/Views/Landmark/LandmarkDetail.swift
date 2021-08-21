//
//  LandmarkDetail.swift
//  MyTutorial
//
//  Created by Szymon Błaszczyński on 21/08/2021.
//

import SwiftUI
import MapKit

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark

    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        ScrollView {
            VStack() {
                MapView(coordinate: landmark.locationCoordinate)
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 350)
                CircleImage(image: landmark.image)
                    .offset(y: -60)//
                    .padding(-20)//.bottom, -10
//                    .scaledToFit()
//                    .scaleEffect(1/2.33, anchor: .center)
                VStack(alignment: .leading) {
                    HStack {
                        Text(landmark.name)
                            .padding()
                            .foregroundColor(.black)
                            .accentColor(.blue)
                            .font(.title)
                        FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                    }
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
//                .offset(y: -150)
            }.frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 400, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .padding(.horizontal, 30)
            
        }//.padding(.horizontal, 100)
        .navigationTitle(landmark.name)
//        .navigationBarTitleDisplayMode(.inline) // macOS can't
        .transition(.slide)
        .animation(.ripple(index: 1))
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    static var previews: some View {
        LandmarkDetail(landmark: landmarks[1])
            .environmentObject(ModelData())
    }
}
