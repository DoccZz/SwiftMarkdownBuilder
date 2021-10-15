//
//  MarkdownBuilderTests.swift
//  MarkdownBuilderTests
//
//  Created by Helge Heß on 15.10.21.
//

import XCTest
import Markdown
@testable import MarkdownBuilder

class MarkdownBuilderTests: XCTestCase {

  func testSimpleDocument() {
    // This has a funky trailer before the newline? (`  `)
    let expected = "This is a *~paragraph.~Plain Text too*  \n\n"
                 + "[*Hello*](https://www.zeezide.de)"
    
    let doc = Document {
      Paragraph {
        Text("This is a ")
        Emphasis {
          Text("paragraph.")
            .strikethough()
          "Plain Text too"
        }
        
        LineBreak()
        
        Link(destination: URL(string: "https://www.zeezide.de")!) {
          Text("Hello")
            .emphasis()
        }
      }
    }
    
    XCTAssertEqual(doc.format(), expected)

    #if DEBUG && true
    print(doc.debugDescription()) // tree
    print()
    print("---Markdown:---")
    print(doc.format())
    print("---")
    #endif
  }
  
  func testSimpleCustomBlock() {
    struct MyText: DynamicBlockMarkup {
      
      let title : String

      var body: [ BlockMarkup ] {
        Heading {
          "Hello: \(title)"
        }
        
        Paragraph {
          "Content is here"
        }
      }
    }
    
    // Hm, this doesn't look right :-) Why doesn't the render add the newline
    // for the Heading?
    let expected = "# Hello Custom View!# Hello: The title\n\nContent is here"
    
    let doc = Document {
      "Hello Custom View!"
        .font(.largeTitle)

      MyText(title: "The title")
    }
    
    XCTAssertEqual(doc.format(), expected)

    #if DEBUG && true
    print(doc.debugDescription()) // tree
    print()
    print("---Markdown:---")
    print(doc.format())
    print("---")
    #endif
  }
}
