//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Benjamin Clauss on 3/30/23.
//

import SwiftUI

class EmojiMemoryGame {
    private var model: MemoryGame<String> = MemoryGame<String>()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
