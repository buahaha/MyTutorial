//
//  MapView.swift
//  MyTutorial
//
//  Created by Szymon Błaszczyński on 21/08/2021.
//

import SwiftUI
import MapKit

// Gdynia
// 54.5189° N, 18.5305° E

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2DMake(54.51, 18.53), span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
    
    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear {
                setRegion(coordinate)
            }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2DMake(54.51, 18.53))
    }
}
