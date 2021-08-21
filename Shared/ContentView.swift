//
//  ContentView.swift
//  Shared
//
//  Created by Szymon Błaszczyński on 21/08/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack() {
            MapView()
                .frame(height: 300)
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                Text("Arka Gdynia!")
                    .padding()
                    .foregroundColor(.black)
                    .accentColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .font(.title)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.green/*@END_MENU_TOKEN@*/)
                HStack {
                    Text("Trolejbusy i morze...")
                    Spacer()
                    Text("Pomorskie")
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                Text("Coś więcej o...")
                    .font(.title2)
                Text("WIKI")
            }
            .padding()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
