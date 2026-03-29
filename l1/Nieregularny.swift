//
//  IrregularShape.swift
//  l1
//
//  Created by student on 01/03/2026.
//


import SwiftUI
import UIKit

struct Nieregularny: View {
    
    var body: some View {
        ZStack{
            Circle()
                .fill(Color.red)
                .frame(width: 200, height: 200)
            Ellipse()
                .fill(Color.red)
                .frame(width: 300, height: 100)
        }
    }
}

#Preview {
    Nieregularny()
}
