//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Christopher Koski on 5/18/22.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
  typealias Card = MemoryGame<String>.Card
  
  private static let emojis = ["✈️", "🚀", "🚗", "🛵", "🚑", "🛬", "🛳", "🚍", "🚜", "🛴", "🚕", "🚔", "🚚", "🚁", "🚢", "🚒", "🚂", "🛺", "🚤"]
  
  private static func createMemoryGame() -> MemoryGame<String> {
    MemoryGame<String>(numberOfPairsOfCards: 9) { pairIndex in
      emojis[pairIndex]
    }
  }
  
  @Published private var model = createMemoryGame()
  
  var cards: Array<MemoryGame<String>.Card> {
    model.cards
  }
  
  // MARK: Intent(s)
  
  func choose(_ card: Card) {
    model.choose(card)
  }
}
