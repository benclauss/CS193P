//
//  ContentView.swift
//  Memorize
//
//  Created by Benjamin Clauss on 3/25/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius:20)
                .stroke()
            Text("Hello, world!")
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
}

















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
