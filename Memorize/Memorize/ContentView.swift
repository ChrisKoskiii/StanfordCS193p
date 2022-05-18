//
//  ContentView.swift
//  Memorize
//
//  Created by Christopher Koski on 5/16/22.
//

import SwiftUI

struct ContentView: View {

  @State var emojiCount = 15
  var body: some View {
    VStack {
      ScrollView {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
          ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
            CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
          }
        }
      }
      .foregroundColor(.red)
    }
    .padding(.horizontal)
  }

}

struct CardView: View {
  var content: String
  @State var isFaceUp = true
  
  var body: some View {
    ZStack {
      let shape = RoundedRectangle(cornerRadius: 20)
      if isFaceUp {
        shape.fill(.white)
        shape.strokeBorder(lineWidth: 3)
        Text(content).font(.largeTitle)
      } else {
        shape.fill(.red)
      }
    }
    .onTapGesture {
      isFaceUp.toggle()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .previewInterfaceOrientation(.portrait)
    ContentView()
      .preferredColorScheme(.dark)
  }
}

