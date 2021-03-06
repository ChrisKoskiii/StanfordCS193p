//
//  MemoryGame.swift
//  Assignment 2
//
//  Created by Christopher Koski on 5/20/22.
//

import Foundation
import UIKit

struct MemoryGame<CardContent> where CardContent: Equatable {
  private(set) var cards: Array<Card>

  private var indexOfTheOneAndOnlyFaceUpCard: Int?
  
  private(set) var points: Int = 0
  
  mutating func choose(_ card: Card) {
    if let chosenIndex = cards.firstIndex(where: { $0.id == card.id}),
    !cards[chosenIndex].isFaceUp,
    !cards[chosenIndex].isMatched
    {
      if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
        if cards[chosenIndex].content == cards[potentialMatchIndex].content {
          cards[chosenIndex].isMatched = true
          cards[potentialMatchIndex].isMatched = true
          points += 2
        } else {
          if cards[chosenIndex].hasBeenSeen || cards[potentialMatchIndex].hasBeenSeen {
            points -= 1
          }
        }
        indexOfTheOneAndOnlyFaceUpCard = nil
      } else {
        for index in cards.indices {
          if cards[index].isFaceUp {
            cards[index].isFaceUp = false
            cards[index].hasBeenSeen = true
          }
        }
        indexOfTheOneAndOnlyFaceUpCard = chosenIndex
      }
      
      cards[chosenIndex].isFaceUp.toggle()
    }
    print(cards)
  }
  
  init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
    cards = Array<Card>()
    
    for pairIndex in 0..<numberOfPairsOfCards {
      let content = createCardContent(pairIndex)
      cards.append(Card(content: content, id: pairIndex*2))
      cards.append(Card(content: content, id: pairIndex*2+1))
    }
    
    cards.shuffle()
  }
  
  struct Card: Identifiable {
    var isFaceUp: Bool = false
    var isMatched: Bool = false
    var hasBeenSeen: Bool = false
    var content: CardContent
    var id: Int
  }
}
