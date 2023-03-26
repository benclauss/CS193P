//
//  ContentView.swift
//  Memorize
//
//  Created by Benjamin Clauss on 3/25/23.
//

import SwiftUI

let vehicles = ["🚆", "🚡", "🚘", "🛳️", "🚖", "🚢", "🛫", "🚐", "🚎", "🚄", "🚑", "🚜", "🚉" , "🚲", "🚓", "🛩️"]
let food = ["🍱", "🍚", "🍣", "🍜", "🥓", "🍖", "🍗", "🥩", "🍕", "🍝", "🍔", "🍟"]
let flags = ["🇦🇫", "🇦🇽", "🇦🇱", "🇩🇿", "🇦🇸", "🇦🇩", "🇦🇴", "🇦🇮"]

struct ContentView: View {
    @State var emojis = food
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis, id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
                .foregroundColor(.red)
            }
            Spacer()
            HStack(alignment: .bottom, spacing: 50) {
                Button {
                    emojis = vehicles.shuffled()
                } label: {
                    VStack {
                        Image(systemName: "car").font(.largeTitle)
                        Text("Vehicles").font(.subheadline)
                    }
                }
                Button {
                    emojis = food.shuffled()
                } label: {
                    VStack {
                        Image(systemName: "carrot").font(.largeTitle)
                        Text("Food").font(.subheadline)
                    }
                }
                Button {
                    emojis = flags.shuffled()
                } label: {
                    VStack {
                        Image(systemName: "flag").font(.largeTitle)
                        Text("Flags").font(.subheadline)
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
