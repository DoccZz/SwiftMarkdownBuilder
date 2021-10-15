//
//  InlineContentBuilder.swift
//  MarkdownBuilder
//
//  Created by Helge Heß on 15.10.21.
//

#if swift(>=5.1)

import Markdown

#if swift(>=5.4)
  @resultBuilder    public struct InlineContentBuilder {}
#else
  @_functionBuilder public struct InlineContentBuilder {}
#endif

public extension InlineContentBuilder {

  @inlinable
  static func buildBlock(_ content: InlineMarkup...) -> [ InlineMarkup ] {
    return content
  }
}

#endif // swift(>=5.1)
