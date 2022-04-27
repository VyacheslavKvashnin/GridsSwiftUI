//
//  CustomGrid.swift
//  GridsSwiftUI
//
//  Created by Вячеслав Квашнин on 27.04.2022.
//

import SwiftUI

struct CustomGrid<Content, T>: View where Content : View {
    let columns: Int
    let items: [T]
    let content: (T, CGFloat) -> Content
    var rows: Int {
        items.count / columns
    }
    
    var body: some View {
        GeometryReader { geometry in
            let sideSize = geometry.size.width / CGFloat(columns)
            
            ScrollView {
                VStack {
                    ForEach(0...rows, id: \.self) { rowIndex in
                        HStack {
                            ForEach(0..<columns) { columnIndex in
                                if let index = indexFor(row: rowIndex, column: columnIndex) {
                                    content(items[index], sideSize)
                                } else {
                                    Spacer()
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    private func indexFor(row: Int, column: Int) -> Int? {
        let index = row * columns + column
        return index < items.count ? index : nil
    }
}

struct CustomGrid_Previews: PreviewProvider {
    static var previews: some View {
        CustomGrid(columns: 3, items: [1, 2, 3, 4, 5, 6]) { item, sideSize in
            Text("\(item)")
                .frame(width: sideSize, height: sideSize)
        }
    }
}
