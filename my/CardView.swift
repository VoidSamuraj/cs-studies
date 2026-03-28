//
//  CardView.swift
//  MemoryGame
//
//  Created by student on 08/03/2026.
//

import SwiftUI

struct CardView: View {
    @Binding var color:Color
    @State var card: MemoGameModel<String>.Card;
     
    
    var body: some View {
        let rect = RoundedRectangle(cornerRadius: 12)
        ZStack{
            Group{
                rect.fill(Color.white)
                    .strokeBorder(color, style: StrokeStyle(lineWidth: 3)).aspectRatio(2/3, contentMode: .fit)
                Text(card.content).font(.largeTitle)
            }.opacity(card.isFaceUp ? 1 : 0)
            rect.fill(color).opacity(card.isFaceUp ? 0 : 1).aspectRatio(2/3, contentMode: .fit)
        }.onTapGesture {
            card.isFaceUp.toggle();
        }
        
    }
    
    
    
}
#Preview {
    @Previewable
    @State var color: Color = Color.red;
    @State var card = MemoGameModel<String>.Card.init(content: "t", id: "0");
    CardView(color: $color, card: card)
}
