
import SwiftUI

struct CardView: View {
    let card: MemoGameModel<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 12)
            
            shape
                .fill()
                .opacity(card.isFaceUp ? 0 : 1)
            
            Group {
                shape
                    .fill(.white)
                    .strokeBorder(lineWidth: 2)
                
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
        }
    }
}

#Preview {
    CardView(card: MemoGameModel<String>.Card(id: "1", isFaceUp: true, content: "🐶"))
}
