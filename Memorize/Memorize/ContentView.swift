//
//  ContentView.swift
//  Memorize
//
//  Created by Christopher Koski on 5/16/22.
//

import SwiftUI

struct ContentView: View {
  
  @StateObject var viewModel: EmojiMemoryGame
  
  var body: some View {
    ScrollView {
      LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
        ForEach(viewModel.cards) { card in
          CardView(card: card)
            .aspectRatio(2/3, contentMode: .fit)
            .onTapGesture {
              viewModel.choose(card)
            }
        }
      }
    }
    .foregroundColor(.red)
    .padding(.horizontal)
  }
  
}

struct CardView: View {
  let card: MemoryGame<String>.Card
  
  var body: some View {
    ZStack {
      let shape = RoundedRectangle(cornerRadius: 20)
      if card.isFaceUp {
        shape.fill(.white)
        shape.strokeBorder(lineWidth: 3)
        Text(card.content).font(.largeTitle)
      } else if card.isMatched {
        shape.opacity(0)
      } else {
        shape.fill(.red)
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    
    ContentView(viewModel: game)
      .previewInterfaceOrientation(.portrait)
    ContentView(viewModel: game)
      .preferredColorScheme(.dark)
  }
}

