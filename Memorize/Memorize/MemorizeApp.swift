//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Christopher Koski on 5/16/22.
//

import SwiftUI

@main
struct MemorizeApp: App {
  private let game = EmojiMemoryGame()
  
    var body: some Scene {
        WindowGroup {
          EmojiMemoryGameView(game: game)
        }
    }
}
