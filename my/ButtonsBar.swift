//
//  ButtonsBar.swift
//  MemoryGame
//
//  Created by student on 08/03/2026.
//

import SwiftUI

struct ButtonsBar: View {
    @Binding var color: Color
    @Binding var numberOfElements: Int
    var onButtonTap: (() -> Void)?
    var body: some View {
        HStack{
            ThemeButton(color: $color, icon: "♠︎" ,opis: "Motyw 1").onTapGesture {
                color = Color.red
                numberOfElements = 4
                onButtonTap?()
            }
            ThemeButton(color: $color, icon: "♦︎" ,opis: "Motyw 2").onTapGesture {
                color = Color.black
                numberOfElements = 8
                onButtonTap?()
            }
            ThemeButton(color: $color, icon: "♣︎" ,opis: "Motyw 3").onTapGesture {
                color = Color.green
                numberOfElements = 6
                onButtonTap?()
            }
        }
    }
}
#Preview {
    @Previewable
    @State var color: Color = Color.red
    @Previewable
    @State var numberOfElements: Int = 4
    ButtonsBar(color: $color, numberOfElements: $numberOfElements)
}
