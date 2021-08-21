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
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2DMake(54.51, 18.53), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    var body: some View {
        Map(coordinateRegion: $region)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
