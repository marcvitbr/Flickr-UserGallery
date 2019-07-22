## About this repo

This is a simple gallery app that fetches images from Flickr using its public API.

### Architecture

My approach was to use the Clean Architecture[[1]](https://8thlight.com/blog/uncle-bob/2012/08/13/the-clean-architecture.html)[[2]](https://herbertograca.com/2017/11/16/explicit-architecture-01-ddd-hexagonal-onion-clean-cqrs-how-i-put-it-all-together/) as a foundation for the solution, taking advantage of the Dependency Rule to create clear, loosely coupled relationships between objects.

### Coding style

The standard being used is the proposed by the [SwiftLint](https://github.com/realm/SwiftLint) linter, and was enforced by the `swiftlint` CLI.

### Tools/Libraries

- Carthage: Package manager;
- SwiftLint: Linter;
- Alamofire: HTTP requests;
- Kingfisher: Image downloading and caching;

### Environment

- macOS Mojave (version 10.14.5)
- Xcode 10.2.1
- Swift 5

### Features

- Pagination;
- Show image details on tap;
- Cache images and images info;
- Blur screen when app goes to the background;