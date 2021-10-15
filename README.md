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

It is not entirely clear how useful this thing is. Is there really
a usecase for building Markdown *in* Swift? 😃

A goal is/was to not come up with protocols/structures specific
to the resultBuilders, but to directly attach to the ones provided by
swift-markdown already.

If that would be internal to the Markdown module, a few hacky things
could be dropped (i.e. because the API could be accessed).

The implementation also doesn't have to resort to the type-safyness
attached to SwiftUI style setups, because the swift-markdown 
protocols do not use associated types.
Also, it doesn't need two-way setups like `Binding`.

Things missing:
- [ ] table stuff (needs an own builder for scoping the contents), but could be similar to the macOS SwiftUI table
- [ ] `List`
- [ ] conditionals
- [ ] finish the ForEach
- [ ] an Environment maybe
- [ ] also add an HTML resultBuilder?
- [ ] many more things?

Maybe more things from [SwiftBlocksUI](https://github.com/SwiftBlocksUI/SwiftBlocksUI)
could be used (it generates Slack JSON block structures, but those 
are essentially just fancy markdown).


### Usage in a Swift Package

Example Package.swift:

```swift
// swift-tools-version:5.3

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
