
import Foundation

  // Generyczna struktura – <CardContent: Equatable> oznacza:
 // zawartość musi być Equatable – CardContent muszą dać się porównać ==  
struct MemoGameModel<CardContent: Equatable> {
    //public get / private set
    private(set) var cards: [Card]
    private(set) var mainCard: Card?
    
    //liczba kart i metoda je tworząca
    init(numberOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        for index in 0..<numberOfCards {
            let content = cardContentFactory(index)
            cards.append(Card(id: "\(index)", content: content))
        }
        
        mainCard = cards.randomElement()
    }
    
    //musi mutating być dla struktur bo są niemutowalne domyślnie
    mutating func choose(_ card: Card) {
        
    }
    
    mutating func shuffle() {
        cards.shuffle()
        
        mainCard = cards.randomElement()
    }
    // Equatable  - karty można porównywać przez ==
    // Identifiable - każda karta ma unikalne id (wymga metody porównawczej jak equals z java)
    struct Card: Equatable, Identifiable {
        let id: String
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        let content: CardContent
        
        static func == (lhs: MemoGameModel<CardContent>.Card, rhs: MemoGameModel<CardContent>.Card) -> Bool {
            return lhs.id == rhs.id &&
                   lhs.content == rhs.content &&
                   lhs.isFaceUp == rhs.isFaceUp &&
                   lhs.isMatched == rhs.isMatched
        }
    }
}
