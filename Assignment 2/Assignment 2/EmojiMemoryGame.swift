//
//  EmojiMemoryGame.swift
//  Assignment 2
//
//  Created by Christopher Koski on 5/20/22.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
  
  init() {
    theme = EmojiMemoryGame.themes.randomElement()!
    theme.emojis.shuffle()
    model = EmojiMemoryGame.createMemoryGame(theme: theme)
  }
  
  static var themes = [
    Theme(name: "Vehicles",
          emojis: ["✈️", "🚀", "🚗", "🛵", "🚑", "🛬", "🛳", "🚍", "🚜", "🛴", "🚕", "🚔", "🚚", "🚁", "🚢", "🚒", "🚂", "🛺", "🚤"],
          numberOfPairs: 6,
          color: "red"
         ),
    Theme(name: "Animals",
          emojis: ["🐈", "🐈‍⬛", "🐶", "🐀", "🐁", "🦔", "🐿", "🐖", "🦝", "🐴", "🐄"],
          numberOfPairs: 8,
          color: "blue"
         ),
    Theme(name: "Objects",
          emojis: ["✂️", "🚽", "⏰", "🔌", "🔒", "💻", "☎️", "💡", "📞"],
          numberOfPairs: 7,
          color: "green"
         ),
    Theme(name: "Food",
          emojis: ["🍖","🎂", "🍕", "🍔", "🍟", "🌮", "🌭", "🥓", "🍿", "🍫"],
          numberOfPairs: 9,
          color: "yellow"
         ),
  ]
  static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
    MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairs) { pairIndex in
      theme.emojis[pairIndex]
    }
  }
  
  @Published private var model: MemoryGame<String>
  
  private(set) var theme: Theme
  
  var themeColor: Color {
    switch theme.color {
    case "red":
        return .red
    case "blue":
        return .blue
    case "green":
        return .green
    case "yellow":
        return .yellow
    default:
        return .red
    }
  }
  
  var cards: Array<MemoryGame<String>.Card> {
    model.cards
  }
  
  var points: Int {
    model.points
  }
  
  // MARK: Intent(s)
  
  func choose(_ card: MemoryGame<String>.Card) {
    model.choose(card)
  }
  
  func newGame() {
    theme = EmojiMemoryGame.themes.randomElement()!
    theme.emojis.shuffle()
    model = EmojiMemoryGame.createMemoryGame(theme: theme)
  }
}
