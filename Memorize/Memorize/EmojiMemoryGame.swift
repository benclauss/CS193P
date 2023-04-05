//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Benjamin Clauss on 3/30/23.
//

import SwiftUI

class EmojiMemoryGame {
    static let emojis = ["🚧", "🚆", "🚡", "🚘", "🛣️", "🛳️", "🛤️", "🚏", "🚖", "🚢", "🛫", "🚐", "🚎", "🚄", "🚑", "🛢️", "🚜", "🚦", "🚉" , "🚲", "🚥", "🚓", "🛩️", "🛑"]
    
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    private var model: MemoryGame<String> = createMemoryGame()

    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
