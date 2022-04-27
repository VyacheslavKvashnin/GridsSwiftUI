//
//  ContentView.swift
//  GridsSwiftUI
//
//  Created by Вячеслав Квашнин on 27.04.2022.
//

import SwiftUI

struct ContentView: View {
    let items = (0...100).map { $0 }
    
    var body: some View {
        CustomGrid(columns: 3, items: items) { item, sideSize  in
            VStack {
                Text("\(item)")
            }
            .frame(width: sideSize, height: sideSize)
            .foregroundColor(.white)
            .font(.title)
            .background(Color.red)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
