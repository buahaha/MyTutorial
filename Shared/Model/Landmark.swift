//
//  Landmark.swift
//  MyTutorial
//
//  Created by Szymon Błaszczyński on 21/08/2021.
//

import Foundation
import SwiftUI
import MapKit
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case miasto = "Miasto"
        case góry = "Góry"
        case lotnictwo = "Lotnictwo"
        case górnictwo = "Górnictwo"
        case kulture = "Kultura"
        case zamki = "Zamki"
    }

    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }

    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
    
    var featureImage: Image? {
        isFeatured ? Image(imageName + "_promo") : nil
    }

}
