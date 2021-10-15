//
//  ForEach.swift
//  TestSwiftDocC
//
//  Created by Helge Heß on 14.10.21.
//

#if swift(>=5.1)
import Foundation
import Markdown

public struct ForEach<Data, Content> where Data : Sequence {
  
  public let data : Data
  
  @usableFromInline
  let content : ( Data.Element ) -> Content
}

extension ForEach: Markup where Content: InlineMarkup {
  public func accept<V>(_ visitor: inout V) -> V.Result where V: MarkupVisitor {
    fatalError("NOT IMPLEMENTED")
  }
  
  public var _data: _MarkupData {
    get {
      Paragraph(data.map(content))._data
    }
    set {
      fatalError("NOT APPLICABLE")
    }
  }
}

extension ForEach: PlainTextConvertibleMarkup
  where Content: PlainTextConvertibleMarkup & InlineMarkup
{
  public var plainText: String {
    Paragraph(data.map(content)).plainText
  }
}

extension ForEach: InlineMarkup where Content: InlineMarkup {
  
}
#endif // Swift(>=5.1)
