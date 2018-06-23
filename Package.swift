// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "redux-swift",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "redux-swift",
            targets: ["redux-swift"]),
        .executable(
            name: "MyApp", 
            targets: ["MyApp"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "redux-swift",
            dependencies: []),
        .target(
            name: "MyApp",
            dependencies: ["redux-swift"]),
        .testTarget(
            name: "redux-swiftTests",
            dependencies: ["redux-swift"]),
    ]
)
