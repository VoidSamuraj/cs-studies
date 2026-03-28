//
//  ContentView.swift
//  MemoryGame
//
//  Created by student on 08/03/2026.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var memoViewModel: MemoGameViewModel
    @State var numberOfElements: Int = 4
    @State var color: Color = Color.red
    
    var body: some View {
        VStack {
            Text("Memo")
                .font(.largeTitle)
                .padding()
            
            cardDisplay
                .frame(maxHeight: .infinity)
                .padding()
            
            Text("shuffle")
                .foregroundColor(color)
                .onTapGesture {
                    withAnimation {
                        memoViewModel.shuffle()
                    }
                }
            
            ButtonsBar(color: $color, numberOfElements: $numberOfElements) {
                withAnimation {
                    memoViewModel.shuffle()
                }
            }
        }
        .padding()
    }

    var cardDisplay: some View{
        LazyVGrid(columns:
                    [GridItem(.adaptive(minimum: 85))], spacing: 0
        ){
            ForEach(memoViewModel.cards, id: \.id) { card in
                CardView(color: $color, card: card)
                    .font(.largeTitle)
                    .padding()
                    .transition(.scale)
            }
            
        }
        
    }
}

#Preview {
    ContentView(memoViewModel: MemoGameViewModel());
}
