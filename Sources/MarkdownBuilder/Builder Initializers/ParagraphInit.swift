//
//  FILE.swift
//  MarkdownBuilder
//
//  Created by Helge Heß on 15.10.21.
//

#if swift(>=5.1)
import Markdown

public extension Paragraph { // BlockMarkup, BasicInlineContainer

  @inlinable
  init(@InlineContentBuilder content: () -> [ InlineMarkup ]) {
    self.init(content())
  }
}
#endif // swift(>=5.1)
