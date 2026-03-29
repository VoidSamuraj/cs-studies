//
//  HalfCircle.swift
//  l1
//
//  Created by student on 01/03/2026.
//


import SwiftUI
import UIKit

struct PolKola: View {
    
    struct PolKola: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Circle().path(in: rect)
            
            path = path.trimmedPath(from: 0, to: 0.5)
            
            return path
        }
    }
    
    var body: some View {
        PolKola()
            .frame(width: 200, height: 100)
            .foregroundColor(.blue)
    }
}

#Preview {
    PolKola()
}
