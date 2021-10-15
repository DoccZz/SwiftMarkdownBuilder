<h2>SwiftMarkdownBuilder
  <img src="http://zeezide.com/img/docz/DocCArchive100.png"
           align="right" width="100" height="100" />
</h2>

`resultBuilder` support for
[swift-markdown](https://github.com/apple/swift-markdown).

The default way to build Markdown in swift-markdown is to use varargs 
initializers, e.g. as in the example from the README.md:

```swift
let document = Document(
    Paragraph(
        Text("This is a "),
        Emphasis(
            Text("paragraph."))))
```

Wouldn't it be nice to be able to use a SwiftUI like "resultBuilder" syntax,
like:
```swift
let document = Document {
  Paragraph {
    "This is a "
    "paragraph"
      .emphasis()
  }
}
```

And maybe even control structures like:
```swift
let document = Document {
  "Our Tasks:"
    .font(.largeTitle)
  
  List {
    ForEach(todos) { todo in
      Text(todo.title)
    }
  }
}
```

Or custom Markdown "views":
```swift
struct TOC: DynamicMarkdownBlock {
  let pages : [ Page ]
  
  var body: [ MarkdownBlock ] {
    "Table of Contents"
      .font(.title)
    
    ForEach(pages) { page in
      Paragraph {
        Text(page.title)
          .font(.title2)
        
        Text(page.abstract)
      }
    }
  }
}
```

That's what we play with here.

Maybe we can get it to a state suitable for a PR on swift-markdown itself.


### Status

An experiment for curious people. Work in progress.


### Usage in a Swift Package

Example Package.swift:

```swift
// swift-tools-version:5.0

import PackageDescription

let package = Package(
  name         : "MyWebsite",
  products     : [ .executable(name: "MyWebsite", targets: [ "MyWebsite" ]) ],
  dependencies : [
    .package(url: "https://github.com/DoccZz/SwiftMarkdownBuilder.git", from: "0.1.0")
  ],
  targets: [ 
    .target(name: "MyWebsite", dependencies: [ 
      .product(name: "MarkdownBuilder", package: "SwiftMarkdownBuilder") 
    ])
  ]
)
```


### Who

**SwiftMarkdownBuilder** is brought to you by
the
[Always Right Institute](http://www.alwaysrightinstitute.com)
and
[ZeeZide](http://zeezide.de).
We like 
[feedback](https://twitter.com/ar_institute), 
GitHub stars, 
cool [contract work](http://zeezide.com/en/services/services.html),
presumably any form of praise you can think of.
