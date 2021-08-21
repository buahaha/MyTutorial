//
//  CircleImage.swift
//  MyTutorial
//
//  Created by Szymon Błaszczyński on 21/08/2021.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("bana")
            .resizable(resizingMode: .stretch)
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 7)

    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
