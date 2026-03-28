
import Foundation
import Combine
import SwiftUI

// Combine to framework Apple do obsługi @Published i reaktywnego programowania
// @Published "nadaje sygnał" gdy wartość się zmienia – Combine to obsługuje pod spodem (automatycznie odświerzy widoki)

//final - nie można dziedziczyć
final class MemoGameViewModel: ObservableObject {
    @Published var model: MemoGameModel<String>
    @Published var themeColor: Color = Theme.motyw1.color
    
    init() {
        model = MemoGameViewModel.createMemoGame(symbols: Theme.motyw1.emojis)
    }
    
    var cards: [MemoGameModel<String>.Card] { model.cards }
    
    var mainCard: MemoGameModel<String>.Card? { model.mainCard }
    
    private static func createMemoGame(symbols: [String]) -> MemoGameModel<String> {
        return MemoGameModel(numberOfCards: symbols.count) { index in
            if symbols.indices.contains(index) {
                return symbols[index]
            }
            
            return "??"
        }
    }
    
    func choose(_ card: MemoGameModel<String>.Card) {
        model.choose(card)
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func changeTheme(to theme: Theme) {
        self.themeColor = theme.color
        
        model = MemoGameViewModel.createMemoGame(symbols: theme.emojis)
        shuffle()
    }
}
