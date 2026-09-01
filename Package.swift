// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "SwiftUIRouter",
    platforms: [.iOS(.v17), .macOS(.v14)],
    products: [
        .library(name: "SwiftUIRouter", targets: ["SwiftUIRouter"]),
    ],
    targets: [
        .target(name: "SwiftUIRouter"),
        .testTarget(name: "SwiftUIRouterTests", dependencies: ["SwiftUIRouter"]),
    ]
)
