//
//  StatisticView.swift
//  l1
//
//  Created by student on 01/03/2026.
//
import SwiftUI
import UIKit
import Charts

struct StatisticView: View {
    @State var showSheet: Bool;
    @Binding var colorOccurrences: [ColorData]
    
    var body: some View {
        VStack {
            Button("Pokaż statystyki") {
                showSheet.toggle()
            }
            .sheet(isPresented: $showSheet) {  // .sheet = wysuwane okno od dołu ekranu
                Chart{
                    ForEach(colorOccurrences) { occurrence in
                        BarMark(
                            x: .value("Kolor", occurrence.colorName),
                            y: .value("Liczba", occurrence.count)
                        )
                        .foregroundStyle(occurrence.colorValue)
                    }
                }
            }
        }
    }
}
#Preview {
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
    StatisticView(showSheet: false, colorOccurrences:  $ColorsArray);
}
