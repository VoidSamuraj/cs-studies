//
//  Square.swift
//  l1
//
//  Created by student on 01/03/2026.
//

import SwiftUI
import UIKit

struct Kwadrat: View {
    @State private var trimValue: CGFloat = 0
    @State private var currentStep: Int = 0
    
    let animationDuration: Double = 1
    
    var body: some View {
        ZStack {
           
            Path { path in
                let size: CGFloat = 100
                
                path.move(to: CGPoint(x: 0, y: size))
                path.addLine(to: CGPoint(x: 0, y: 0))
                path.addLine(to: CGPoint(x: size, y: 0))
                path.addLine(to: CGPoint(x: size, y: size))
                
                path.closeSubpath()
            }
            .trim(from: 0, to: trimValue)
            .stroke(Color.blue, lineWidth: 10)
            .frame(width: 100, height: 100)
            .onAppear {
                animateSquare()
            }
        }
    }
    
    func animateSquare() {
        withAnimation(Animation.linear(duration: animationDuration).repeatForever(autoreverses: false)) {
            switch currentStep {
            case 0:
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    trimValue = 0.25
                    currentStep += 1
                    animateSquare()
                }
            case 1:
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    trimValue = 0.5
                    currentStep += 1
                    animateSquare()
                }
            case 2:
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    trimValue = 0.75
                    currentStep += 1
                    animateSquare()
                }
            case 3:
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    trimValue = 1
                    currentStep = 0
                    animateSquare()
                }
            default:
                break
            }
        }
    }
}

struct Kwadrat_Previews: PreviewProvider {
    static var previews: some View {
        Kwadrat()
            .frame(width: 200, height: 200)
    }
}
