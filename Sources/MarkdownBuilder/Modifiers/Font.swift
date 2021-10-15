//
//  Font.swift
//  MarkdownBuilder
//
//  Created by Helge Heß on 15.10.21.
//

public enum Font: Equatable {

  // `#`
  case largeTitle

  // `##`
  case title

  // `###`
  case title2

  // `####`
  case title3
}

extension Font {
  
  var level : Int {
    switch self {
      case .largeTitle : return 1
      case .title      : return 2
      case .title2     : return 3
      case .title3     : return 4
    }
  }
}
