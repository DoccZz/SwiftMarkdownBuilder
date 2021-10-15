//
//  Components.swift
//  TestSwiftDocC
//
//  Created by Helge Heß on 14.10.21.
//

#if swift(>=5.1)
import Markdown

public protocol DynamicBlockMarkup: BlockMarkup {
  @BlocksBuilder var body: [ BlockMarkup ] { get }
  
  var container : BlockContainer { get }
}

extension DynamicBlockMarkup {

  // This is problematic, because it wraps Document in Document
  var container : BlockContainer { Document(body) }
  
  var _data: _MarkupData {
    get { return container._data }
    set { fatalError("Cannot set contents of DynamicBlockMarkup") }
  }
  
  public func accept<V: MarkupVisitor>(_ visitor: inout V) -> V.Result {
    #if false // doesn't fly
      for markup in body {
        markup.accept(&visitor)
      }
    #else
      return Document(body).accept(&visitor)
    #endif
  }
}

#endif // Swift(>=5.1)
