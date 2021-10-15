// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "SwiftMarkdownBuilder",
  
  products: [
      .library(name: "MarkdownBuilder", targets: [ "MarkdownBuilder" ])
  ],
  
  dependencies: [
      .package(url: "https://github.com/apple/swift-markdown.git", 
               .branch("main"))
  ],
  
  targets: [
      .target(name: "MarkdownBuilder", dependencies: [ 
        .product(name: "Markdown", package: "swift-markdown") 
      ]),
      
      .testTarget(name: "MarkdownBuilderTests", dependencies: [ 
        "MarkdownBuilder",
        .product(name: "Markdown", package: "swift-markdown") 
      ])
  ]
)

