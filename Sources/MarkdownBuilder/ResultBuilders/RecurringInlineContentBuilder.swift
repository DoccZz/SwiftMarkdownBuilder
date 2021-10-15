//
//  RecurringInlineContentBuilder.swift
//  MarkdownBuilder
//
//  Created by Helge Heß on 15.10.21.
//

#if swift(>=5.1)

import Markdown

// MARK: - Imp

#if swift(>=5.4)
  @resultBuilder    public struct RecurringInlineContentBuilder {}
#else
  @_functionBuilder public struct RecurringInlineContentBuilder {}
#endif

public extension RecurringInlineContentBuilder {

  @inlinable
  static func buildBlock(_ content: RecurringInlineMarkup...)
              -> [ RecurringInlineMarkup ]
  {
    return content
  }
}

#endif // swift(>=5.1)
