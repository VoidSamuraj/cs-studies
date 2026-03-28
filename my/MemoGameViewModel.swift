//
//  MemoGameViewModel.swift
//  labb3
//
//  Created by student on 22/03/2026.
//
import SwiftUI

class MemoGameViewModel : ObservableObject{
    
    static var emoji: [[String]] = [
        ["😀", "😁", "😂", "🤣"],
        ["😍", "🥰", "🥺", "😭"],
        ["😎", "🤩", "😝", "😜"],
        ["🤔", "🤯", "🥳", "😛"],
    ]
    
    private static var currentEmoji = emoji.first ?? [];
    @Published var model: MemoGameModel<String> = CreateMemoryGame();
    private var themeNumber = 1;
    private(set) var colorTheme = Color.green;
    var cards: Array<MemoGameModel<String>.Card>{return model.cards};
    
    private static func CreateMemoryGame()->MemoGameModel<String>{
        return MemoGameModel<String>.init(numberOfCards: currentEmoji.count){index in
                if(currentEmoji.indices.contains(index)){
                    return currentEmoji[index];
                }else{
                    return "??";
                }
        }
    }
    func shuffle(){
        model.shuffle();
    }
    
    func changeTheme(number: Int){
        if(number == 1){
            colorTheme = Color.blue;
            MemoGameViewModel.currentEmoji = MemoGameViewModel.emoji.first ?? [];
        }else{
              model = MemoGameViewModel.CreateMemoryGame();
        //    MemoGameModel = MemoGameModel.card;
        }
    }
    
}
