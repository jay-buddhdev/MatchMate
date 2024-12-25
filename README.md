# MatchMate

[![Platform][iOS-badge]][apple-developer]
[![Swift 5.0][swift-badge]][swift-org]
[![Target][minimum-platform-badge]][iOS-version-wiki]
[![CocoaPods][cocoa-badge]][cocoa-org]

An elegant matrimonial app built with SwiftUI, offering a seamless experience to browse and manage match cards. The app allows users to view match profiles fetched from an API and provides features to accept or decline matches with persistent offline storage for decisions.

## Getting Started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites
Add project prerequisites here and remove this line. Below are the example, may or may not apply to your project
- [Xcode 15.0+][xcode-releases]
- [HomeBrew][brew]
- [CocoaPods][cocoa-org]

### Dependencies
Third-party frameworks and libraries are managed using [Cocoapods][cocoa-org].
#### Pods used 
- [R.swift][rswift]: This library is to manage static strings in the application
- [SDWebImageSwiftUI][sdWebimageswiftUI]: Used for download images

### Swift Style Guide
Code follows [Raywenderlich][style-guide] style guide.

## How to setup project?
1. Clone this repository into a location of your choosing, like your projects folder
2. Then install pods into your project by typing in terminal: `pod install`
3. You are all set now. Open the .xcworkspace file from now on and hit Xcode's 'run' button. 🚀


## Architecture
The project uses MVVM architecture.

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)

   [swift-badge]: <https://img.shields.io/badge/Swift-5.0-orange.svg?style=flat>
   [swift-org]: <https://swift.org>
   [cocoa-badge]: <https://img.shields.io/badge/dependency-cocoapods-red>
   [cocoa-org]: <https://cocoapods.org>
   [spm]: <https://www.swift.org/package-manager/>
   [swift-date]: <https://github.com/malcommac/SwiftDate>
   [swift-log]: <https://github.com/apple/swift-log>
   [iOS-badge]: <https://img.shields.io/badge/platform-iOS-blue>
   [apple-developer]: <https://developer.apple.com/ios/>
   [minimum-platform-badge]: <https://img.shields.io/badge/support-iOS%2017.0-blue>
   [iOS-version-wiki]: <https://en.wikipedia.org/wiki/IOS_17.0>
   [brew]: <https://brew.sh/>
   [xcode-releases]: <https://xcodereleases.com/>
   [style-guide]: <https://github.com/raywenderlich/swift-style-guide>
   [rswift]: <https://github.com/mac-cain13/R.swift>
   [sdWebimageswiftUI]: <https://github.com/SDWebImage/SDWebImageSwiftUI>
