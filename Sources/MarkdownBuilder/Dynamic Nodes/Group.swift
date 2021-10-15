//
//  Group.swift
//  TestSwiftDocC
//
//  Created by Helge Heß on 14.10.21.
//

#if swift(>=5.1)
import Markdown

// Those kinds of things are hard, because `Markdown` doesn't expose support
// for arbitrary arrays of nodes.
// This could probably be fixed when the stuff is moved into the `Markdown`
// module.

public struct Group<T> {
  let children : [ T ]
}

extension Group: Markup where T: Markup {
  // Swift seems to require this, not sure how to get rid of it.
  // https://forums.swift.org/t/amending-se-0143-conditional-conformances-dont-imply-other-conformances/11017
  
  public var _data: _MarkupData {
    get { fatalError("Groups on plain `Markup` are not supported.") }
    set { fatalError("Cannot set contents of DynamicBlockMarkup") }
  }
  public func accept<V: MarkupVisitor>(_ visitor: inout V) -> V.Result {
    fatalError("Groups on plain `Markup` are not supported.")
  }
}

extension Group: PlainTextConvertibleMarkup where T: PlainTextConvertibleMarkup
{
 
  public var plainText: String {
    return children.map { $0.plainText }.joined()
  }
}

extension Group: BlockMarkup where T: BlockMarkup {
  
  public var _data: _MarkupData {
    get { return Document(children)._data }
    set { fatalError("Cannot set contents of DynamicBlockMarkup") }
  }
  
  public func accept<V: MarkupVisitor>(_ visitor: inout V) -> V.Result {
    return Document(children).accept(&visitor)
  }
}

extension Group: InlineMarkup where T: InlineMarkup {
  
  public var _data: _MarkupData {
    get { Paragraph(children)._data }
    set { fatalError("Cannot set contents of DynamicBlockMarkup") }
  }
  
  public func accept<V: MarkupVisitor>(_ visitor: inout V) -> V.Result {
    return Paragraph(children).accept(&visitor)
  }
}

extension Group: RecurringInlineMarkup where T: RecurringInlineMarkup {
  
  public var _data: _MarkupData {
    get { Paragraph(children)._data }
    set { fatalError("Cannot set contents of DynamicBlockMarkup") }
  }
  
  public func accept<V: MarkupVisitor>(_ visitor: inout V) -> V.Result {
    return Paragraph(children).accept(&visitor)
  }
}

#endif // swift(>=5.1)
