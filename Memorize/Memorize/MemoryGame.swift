//
//  MemoryGame.swift
//  Memorize
//
//  Created by Christopher Koski on 5/18/22.
//

import Foundation

struct MemoryGame<CardContent> {
  var cards: Array<Card>
  
  func choose(_ card: Card) {
    
  }
  
  //We nested this Card to ensure its a MemoryGame.Card
  struct Card {
    var isFaceUp: Bool
    var isMatched: Bool
    var content: CardContent
  }
}
