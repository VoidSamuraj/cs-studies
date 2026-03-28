//
//  MemoGameModel.swift
//  labb3
//
//  Created by student on 22/03/2026.
//

struct MemoGameModel<CardContent> where CardContent: Equatable{
    
    private(set) var cards: Array<Card>;
    private(set) var mainCard : Card? = nil;
    private var mainCardNumber: Int;
    
    struct Card : Equatable{
        var isFaceUp: Bool = false;
        var isMatch: Bool = false;
        let content: CardContent;
        var id : String;
    }
    
    init(numberOfCards: Int, cardContentFactory: (Int)-> CardContent){
        cards = [];
        self.mainCardNumber = Int.random(in : 0..<numberOfCards);
    
        for index in 0..<numberOfCards{
            let content: CardContent = cardContentFactory(index)
            cards.append(Card(content: content, id: "\(index)"));
            if(mainCardNumber == index){
                self.mainCard = Card(content: content, id: "\(index)");
            }
        }
        
    }
    mutating func shuffle(){
        cards.shuffle();
    }
}
