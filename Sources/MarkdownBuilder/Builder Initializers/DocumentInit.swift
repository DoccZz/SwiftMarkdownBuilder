//
//  FILE.swift
//  MarkdownBuilder
//
//  Created by Helge Heß on 15.10.21.
//

#if swift(>=5.1)
import Markdown

public extension Document { // BasicBlockContainer
  
  @inlinable
  init(@BlocksBuilder content: () -> [ BlockMarkup ]) {
    self.init(content())
  }
}

#endif // swift(>=5.1)
