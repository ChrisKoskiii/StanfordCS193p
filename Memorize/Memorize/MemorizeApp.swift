//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Christopher Koski on 5/16/22.
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
