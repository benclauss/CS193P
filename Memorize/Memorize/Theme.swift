//
//  Theme.swift
//  Memorize
//
//  Created by Benjamin Clauss on 4/13/23.
//

import Foundation

struct Theme {
    var name: String
    var emojis: Array<String>
    var numberOfPairsOfCards: Int
    var color: String
}


let vehicles = ["🚆", "🚡", "🚘", "🛳️", "🚖", "🚢", "🛫", "🚐", "🚎", "🚄", "🚑", "🚜", "🚉" , "🚲", "🚓", "🛩️"]
// This theme shows fewer pairs of cards than the number of emoji available.
let VehicleTheme = Theme(name: "Vehicles", emojis: vehicles, numberOfPairsOfCards: 4, color: "Red")

let food = ["🍱", "🍚", "🍣", "🍜", "🥓", "🍖", "🍗", "🥩", "🍕", "🍝", "🍔", "🍟"]
let flags = ["🇦🇫", "🇦🇽", "🇦🇱", "🇩🇿", "🇦🇸", "🇦🇩", "🇦🇴", "🇦🇮"]
