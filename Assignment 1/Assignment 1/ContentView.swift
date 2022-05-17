//
//  ContentView.swift
//  Assignment 1
//
//  Created by Christopher Koski on 5/17/22.
//

import SwiftUI

import SwiftUI

struct ContentView: View {

  var vehicleEmojis = ["✈️", "🚀", "🚗", "🛵", "🚑", "🛬", "🛳", "🚍", "🚜", "🛴", "🚕", "🚔", "🚚", "🚁", "🚢", "🚒", "🚂", "🛺", "🚤"]
  var foodEmojis = ["🍕", "🍔", "🌭", "🌮", "🌯", "🥙", "🥗", "🥪", "🍟", "🍖"]
  var objectEmojis = ["💣", "📞", "💡", "☎️", "💻", "🔒", "🔌", "⏰", "🚽", "✂️"]
  
  @State var emojiCount = 8
  
  @State var currentTheme = ["✈️", "🚀", "🚗", "🛵", "🚑", "🛬", "🛳", "🚍", "🚜", "🛴", "🚕", "🚔", "🚚", "🚁", "🚢", "🚒", "🚂", "🛺", "🚤"]
  
  var body: some View {
    VStack {
      //3: Add title to the top of the view
      Text("Memorize!")
        .font(.largeTitle)
      ScrollView {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
          ForEach(currentTheme[0..<emojiCount], id: \.self) { emoji in
            CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
          }
        }
      }
      .foregroundColor(.red)
      Spacer()
      HStack {
        //4: Add 3 theme buttons
        theme1
        theme2
        theme3
      }
      .background(.ultraThinMaterial, in:
                    RoundedRectangle(cornerRadius: 20)
      )
      .padding()
    }
    .padding(.horizontal)
  }
  
  var theme1: some View {
    Button {
      //5: Arrays should be shuffled
      currentTheme = vehicleEmojis.shuffled()
    } label : {
      VStack {
        //7 & 8: Image using SF Symbols
        Image(systemName: "car")
          .font(.largeTitle)
          .padding(.horizontal)
        //6: Should contain VStack with desciptor
        Text("Vehicles")
        //9: Font should be smaller
          .font(.footnote)
      }
    }
  }
  var theme2: some View {
    Button {
      currentTheme = foodEmojis.shuffled()
    } label : {
      VStack {
        Image(systemName: "trash")
          .font(.largeTitle)
          .padding(.horizontal)
        Text("Food")
          .font(.footnote)
      }
    }
  }
  var theme3: some View {
    Button {
      currentTheme = objectEmojis.shuffled()
    } label : {
      VStack {
        Image(systemName: "wrench.and.screwdriver.fill")
          .font(.largeTitle)
          .padding(.horizontal)
        Text("Objects")
          .font(.footnote)
      }
    }
  }
  //2: Remove add/remove buttons
  
//  var remove: some View {
//    Button {
//      if emojiCount > 0 {
//        emojiCount -= 1
//      }
//    } label: {
//      Image(systemName: "minus.circle")
//        .font(.largeTitle)
//    }
//  }
//
//  var add: some View {
//    Button {
//      if emojiCount < emojis.count {
//        emojiCount += 1
//      }
//    } label: {
//      Image(systemName: "plus.circle")
//        .font(.largeTitle)
//    }
//  }
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
      .previewInterfaceOrientation(.portraitUpsideDown)
    ContentView()
      .preferredColorScheme(.dark)
  }
}
