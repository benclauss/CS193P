//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Benjamin Clauss on 3/25/23.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
