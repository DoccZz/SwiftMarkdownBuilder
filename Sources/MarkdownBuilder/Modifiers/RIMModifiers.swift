//
//  RIMModifiers.swift
//  MarkdownBuilder
//
//  Created by Helge Heß on 15.10.21.
//

#if swift(>=5.1)
import Markdown

public extension RecurringInlineMarkup {
  
  func font(_ font: Font) -> Heading {
    return Heading(level: font.level, self)
  }
}

#endif // Swift(>=5.1)
