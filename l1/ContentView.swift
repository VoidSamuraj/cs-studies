//
//  ContentView.swift
//  l1
//
//  Created by student on 01/03/2026.
//

import SwiftUI

struct ContentView: View {

    @State var ColorsArray:[ColorData] = [
        ColorData(colorName:"Czerwony", colorValue: Color.red, count: 2),
        ColorData(colorName:"Niebieski", colorValue: Color.blue, count: 1),
        ColorData(colorName:"Zielony", colorValue: Color.green, count: 3),
        ColorData(colorName:"Żółty", colorValue: Color.yellow, count: 7),
        ColorData(colorName:"Czarny", colorValue: Color.black, count: 6),
        ColorData(colorName:"Biały", colorValue: Color.white, count: 5),
        ColorData(colorName:"Szary", colorValue: Color.gray, count: 1),
        ColorData(colorName:"Brązowy", colorValue: Color.brown, count: 1)
    ]
    @State private var opacity1: Double = 0.5
    @State private var opacity2: Double = 0.5
    @State private var color1: Color = Color.red
    @State private var color2: Color = Color.blue
    
    var body: some View {
        VStack {
            Circle()
                .fill(color1)
                .padding()
                .frame(width: 300, height: 300)
                .contentShape(Circle())
                .opacity(opacity1)
                .onTapGesture {
                    opacity1 = 1.0;
                }
                .onLongPressGesture(perform: {opacity1 = 0.5;})
            Circle()
                .fill(color2)
                .padding()
                .opacity(opacity2)
                .contentShape(Circle())
                .frame(width: 300, height: 300)
                .onTapGesture {
                    opacity2 = 0.0;
                }
                .onLongPressGesture(perform: {opacity2 = 0.5;})
    
        }
        .padding()
        Button("Losuj kolory"){
            color1 = randColor(colors: $ColorsArray)
            color2 = randColor(colors: $ColorsArray)
        }
        StatisticView(showSheet: false, colorOccurrences:  $ColorsArray)
    }
}
func randColor(colors: Binding<[ColorData]>) -> Color {
    
    let randomIndex = Int.random(in: 0..<colors.wrappedValue.count)
    
    colors[randomIndex].count.wrappedValue += 1
    
    let selectedColor = colors.wrappedValue[randomIndex]
    print("Kolor: \(selectedColor.colorName), Wystąpień: \(selectedColor.count)")
    
    return selectedColor.colorValue
}
#Preview {
    ContentView()
}
