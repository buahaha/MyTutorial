//
//  ModelData.swift
//  MyTutorial
//
//  Created by Szymon Błaszczyński on 21/08/2021.
//

import Foundation
import Combine



final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load(filename: "polskieGóry.json")
    var hikes: [Hike] = load(filename: "hikeData.json")
    
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
    
    var featured: [Landmark] {
        landmarks.filter { $0.isFeatured }
    }
    
    @Published var profile = Profile.default
}

func load<T: Decodable>(filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldnt find \(filename) in main bundle")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't find \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
