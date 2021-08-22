//
//  PageView.swift
//  MyTutorial
//
//  Created by Szymon Błaszczyński on 22/08/2021.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    @State private var currentPage = 0

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
           PageViewController(pages: pages, currentPage: $currentPage)
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PageView(pages: ModelData().featured.map { FeatureCard(landmark: $0) })
                .aspectRatio(3 / 2, contentMode: .fit)
        }
    }
}
