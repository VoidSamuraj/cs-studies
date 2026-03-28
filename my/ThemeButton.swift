//
//  ThemeButton.swift
//  MemoryGame
//
//  Created by student on 08/03/2026.
//

import SwiftUI

struct ThemeButton: View {
    @Binding var color: Color;
    let icon : String
    let opis : String
    var body: some View {
        VStack{
            Text(icon).font(.largeTitle).foregroundColor(color)
            Text(opis).foregroundColor(color)
            
        }.padding()
    }
    
}

#Preview {
    @Previewable
    @State var color: Color = Color.red
    ThemeButton(color: $color, icon: "♠︎" ,opis: "button")
}
