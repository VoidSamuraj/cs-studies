//
//  Picker.swift
//  l1
//
//  Created by student on 01/03/2026.
//

import SwiftUI
import UIKit

// String  = każdy case ma rawValue (tekst)
// CaseIterable = można zrobić ShapeType.allCases (tablica wszystkich casów)
//enum z etykietami
enum ShapeType: String, CaseIterable, Identifiable {
    case halfCircle = "Pół koła"
    case square = "Kwadrat"
    case irregular = "Nieregularny kształt"
    
    var id: String { self.rawValue }
    // Wymagane przez Identifiable
    // id = rawValue, czyli np. "Kwadrat"
}

struct ShapePickerView: View {
    @State private var selectedShape: ShapeType = .halfCircle
    
    var body: some View {
        VStack {
            Picker("Wybierz kształt", selection: $selectedShape) {
                ForEach(ShapeType.allCases) { shape in
                    Text(shape.rawValue).tag(shape)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
             // Styl segmentowy – poziomy pasek z opcjami jak radio buttons
             
            Spacer()
            switch selectedShape {
            case .halfCircle:
                PolKola()
                    .frame(width: 200, height: 100)
                    .foregroundColor(.blue)
            case .square:
                Kwadrat()
                    .frame(width: 200, height: 200)
                    .foregroundColor(.green)
            case .irregular:
                Nieregularny()
                    .frame(width: 200, height: 200)
                    .foregroundColor(.red)
            }
            Spacer()
        }
        .padding()
    }
}
