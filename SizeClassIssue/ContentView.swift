//
//  ContentView.swift
//  SizeClassIssue
//
//  Created by Clément Cardonnel on 17/08/2023.
//

import SwiftUI

struct ContentView: View {

    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    var body: some View {
        let content = ForEach(1..<100) { i in
            RoundedRectangle(cornerRadius: 48)
                .fill(Color(hue: Double(i) / 100, saturation: 0.78, brightness: 1))
                .frame(height: 200)
        }

        Group {
            if horizontalSizeClass == .regular {
                ScrollView {
                    LazyVGrid(columns: [.init(.flexible()), .init(.flexible())]) {
                        content
                    }
                    .padding()
                }
            } else {
                List {
                    content
                }
            }
        }
        .overlay {
            GeometryReader { geometry in
                Text("\(geometry.size.width)")
                    .font(.largeTitle)
                    .padding()
                    .background(Material.thin)
                    .clipShape(RoundedRectangle(cornerRadius: 18))
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
