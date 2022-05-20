//
//  Assignment_2App.swift
//  Assignment 2
//
//  Created by Christopher Koski on 5/20/22.
//

import SwiftUI

@main
struct Assignment_2App: App {
  let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
          ContentView(viewModel: game)
        }
    }
}
