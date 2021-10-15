//
//  Text.swift
//  MarkdownBuilder
//
//  Created by Helge Heß on 15.10.21.
//

#if swift(>=5.1)
import Markdown

public extension Text  {
  
  func strikethough() -> some RecurringInlineMarkup {
    return Strikethrough(self)
  }

  func strong() -> some RecurringInlineMarkup {
    return Strong(self)
  }

  func emphasis() -> some RecurringInlineMarkup {
    return Emphasis(self)
  }
}

#endif // Swift(>=5.1)
