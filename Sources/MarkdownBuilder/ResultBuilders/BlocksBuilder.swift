//
//  BlocksBuilder.swift
//  MarkdownBuilder
//
//  Created by Helge Heß on 15.10.21.
//

#if swift(>=5.1)
import Markdown

#if swift(>=5.4)
  @resultBuilder    public struct BlocksBuilder {}
#else
  @_functionBuilder public struct BlocksBuilder {}
#endif

public extension BlocksBuilder {

  @inlinable
  static func buildBlock(_ content: BlockMarkup...) -> [ BlockMarkup ] {
    return content
  }
}
#endif // swift(>=5.1)
