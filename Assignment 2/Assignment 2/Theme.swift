//
//  Theme.swift
//  Assignment 2
//
//  Created by Christopher Koski on 5/20/22.
//

import Foundation

struct Theme {
  var name: String
  var emojis: Array<String>
  var numberOfPairs: Int
  var color: String
  
  init(name: String, emojis: Array<String>, numberOfPairs: Int, color: String) {
    self.name = name
    self.emojis = emojis
    self.numberOfPairs = numberOfPairs > emojis.count ? emojis.count : numberOfPairs
    self.color = color
  }
}
