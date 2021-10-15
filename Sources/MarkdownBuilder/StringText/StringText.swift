//
//  StringText.swift
//  TestSwiftDocC
//
//  Created by Helge Heß on 14.10.21.
//

#if swift(>=5.1)
import Markdown

/**
 * This allows the user of plain Strings directly within blocks content,
 * for example:
 *
 *     Paragraph {
 *        """
 *        Once upon a time, in a land far far away...
 *        """
 *     }
 *
 */
extension String: RecurringInlineMarkup {
  
  public var plainText: String { return self }
 
  public func accept<V: MarkupVisitor>(_ visitor: inout V) -> V.Result {
      return visitor.visitText(Text(self))
  }
  
  // TBD: Because of those we might need an own protocol?

  public var _data: _MarkupData {
    get { Text(self)._data }
    set {
      var wrapper = Text(self)
      wrapper._data = newValue
      self = wrapper.string
    }
  }
}
#endif
