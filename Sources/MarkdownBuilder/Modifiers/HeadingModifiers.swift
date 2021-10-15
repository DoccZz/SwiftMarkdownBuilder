//
//  Heading.swift
//  MarkdownBuilder
//
//  Created by Helge Heß on 15.10.21.
//

#if swift(>=5.1)
import Markdown

public extension Heading {
  
  func font(_ font: Font) -> Self {
    var meAfresh = self
    meAfresh.level = font.level
    return meAfresh
  }
}

#endif // Swift(>=5.1)
