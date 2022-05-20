//
//  EmojiMemoryGame.swift
//  Assignment 2
//
//  Created by Christopher Koski on 5/20/22.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
  
  static var themes = [
    Theme(name: "Vehicles",
          emojis: ["✈️", "🚀", "🚗", "🛵", "🚑", "🛬", "🛳", "🚍", "🚜", "🛴", "🚕", "🚔", "🚚", "🚁", "🚢", "🚒", "🚂", "🛺", "🚤"],
          numberOfPairs: 5,
          color: "red"
         ),
    Theme(name: "Animals",
          emojis: ["🐈", "🐈‍⬛", "🐶", "🐀", "🐁", "🦔", "🐿", "🐖", "🦝", "🐴", "🐄"],
          numberOfPairs: 8,
          color: "blue"
         ),
    Theme(name: "Objects",
          emojis: ["✂️", "🚽", "⏰", "🔌", "🔒", "💻", "☎️", "💡", "📞"],
          numberOfPairs: 5,
          color: "green"
         ),
    Theme(name: "Food",
          emojis: ["🍖","🎂", "🍕", "🍔", "🍟", "🌮", "🌭", "🥓", "🍿", "🍫"],
          numberOfPairs: 5,
          color: "yellow"
         ),
  ]
  static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
    MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairs) { pairIndex in
      theme.emojis[pairIndex]
    }
  }
  
  @Published private var model: MemoryGame<String> = createMemoryGame()
  
  var cards: Array<MemoryGame<String>.Card> {
    model.cards
  }
  
  // MARK: Intent(s)
  
  func choose(_ card: MemoryGame<String>.Card) {
    model.choose(card)
  }
}
