//
//  FILE.swift
//  MarkdownBuilder
//
//  Created by Helge Heß on 15.10.21.
//

#if swift(>=5.1)
import Markdown

public extension Heading { // BlockMarkup, BasicInlineContainer

  @inlinable
  init(level: Int = 1, @InlineContentBuilder content: () -> [ InlineMarkup ]) {
    self.init(level: level, content())
  }
}

#endif // swift(>=5.1)
