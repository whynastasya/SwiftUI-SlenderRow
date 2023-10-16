//
//  ContentView.swift
//  SlenderRow
//
//  Created by nastasya on 15.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var isHorizontal = true
    @State var numberSquares = 7
    var square: some View {
        Rectangle()
            .aspectRatio(1.0, contentMode: .fit)
            .foregroundStyle(.purple)
            .clipShape(
                RoundedRectangle(
                    cornerRadius: 10,
                    style: .circular)
            )
            .onTapGesture {
                withAnimation {
                    isHorizontal.toggle()
                }
            }
    }
    
    var body: some View {
        NavigationStack {
            let layout = isHorizontal ? AnyLayout(HStackLayout(spacing: 10.0)) : AnyLayout(VStackLayout(spacing: 5.0))
            
            GeometryReader(content: { geometry in
                layout {
                    let squares = isHorizontal ? Array(0..<numberSquares) : Array(0..<numberSquares).reversed()
                    
                    ForEach(squares, id: \.self) { index in
                        let verticalSquareSize = geometry.size.height / CGFloat(numberSquares)
                        
                        square
                            .offset(x: isHorizontal
                                    ? CGFloat(0.0)
                                    : 0.0 + CGFloat(index) * (geometry.size.width - verticalSquareSize) / CGFloat(numberSquares - 1),
                                    y: isHorizontal ? geometry.size.height / 2.0 : CGFloat(0.0))
                    }
                }
            })
            .navigationTitle("Task 6")
            .toolbar {
                Button("-") {
                    self.numberSquares -= 1
                }
                
                Button("+") {
                    self.numberSquares += 1
                }
            }
            .foregroundColor(.black)
        }
    }
}
    
    
    #Preview {
        ContentView()
    }
