//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Benjamin Clauss on 3/30/23.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    static func createMemoryGame(emojis: Array<String>, numberofPairsOfCards: Int) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: numberofPairsOfCards) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    init(theme: Theme) {
        /* If the number of pairs of emoji to show in a Theme is fewer than the number of
         emojis that are available in that theme, then it should not just always use the first few
         emoji in the theme. It must use any of the emoji in the theme. In other words, do
         not have any “dead emoji” in your code that can never appear in a game.
         */
        let shuffledEmojis = theme.emojis.shuffled()
        // Never allow more than one pair of cards in a game to have the same emoji on it.
        let uniqueShuffledEmojis = Array(Set(shuffledEmojis))
        /* If a Theme mistakenly specifies to show more pairs of cards than there are emoji
         available, then automatically reduce the count of cards to show to match the count
         of available emoji.
         */
        let numberOfPairsOfCards = min(theme.numberOfPairsOfCards, uniqueShuffledEmojis.count)
        model = EmojiMemoryGame.createMemoryGame(emojis: uniqueShuffledEmojis, numberofPairsOfCards: numberOfPairsOfCards)
    }
        
    @Published private var model: MemoryGame<String>

    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        objectWillChange.send()
        model.choose(card)
    }
}
