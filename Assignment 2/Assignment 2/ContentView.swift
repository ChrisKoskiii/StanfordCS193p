//
//  ContentView.swift
//  Assignment 1
//
//  Created by Christopher Koski on 5/17/22.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
  
  @StateObject var viewModel: EmojiMemoryGame
  
  var body: some View {
    VStack {
      Text(viewModel.theme.name)
        .font(.largeTitle)
      Text("Points: \(viewModel.points)")
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
      .foregroundColor(viewModel.themeColor)
      .padding(.horizontal)
      Button("New Game") {
        viewModel.newGame()
      }
    }
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
    let game = EmojiMemoryGame()
    ContentView(viewModel: game)
      .previewInterfaceOrientation(.portrait)
    ContentView(viewModel: game)
      .preferredColorScheme(.dark)
  }
}
