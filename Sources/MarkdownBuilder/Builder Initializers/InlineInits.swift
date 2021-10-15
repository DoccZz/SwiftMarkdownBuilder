//
//  FILE.swift
//  MarkdownBuilder
//
//  Created by Helge Heß on 15.10.21.
//

#if swift(>=5.1)
import Markdown

public extension Emphasis {

  @inlinable
  init(@InlineContentBuilder content: () -> [ InlineMarkup ]) {
    self.init(content())
  }
}

public extension Strong {

  @inlinable
  init(@InlineContentBuilder content: () -> [ InlineMarkup ]) {
    self.init(content())
  }
}
public extension Strikethrough {

  @inlinable
  init(@InlineContentBuilder content: () -> [ InlineMarkup ]) {
    self.init(content())
  }
}
#endif // swift(>=5.1)
