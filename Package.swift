// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ExocortexTaskTracker",
    platforms: [
        .macOS(.v14),
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "ExocortexTaskTracker",
            targets: ["ExocortexTaskTracker"]
        ),
    ],
    targets: [
        .target(
            name: "ExocortexTaskTracker"
        ),
        .executableTarget(
            name: "ExocortexTaskTrackerApp",
            dependencies: ["ExocortexTaskTracker"],
            path: "App"
        ),
        .executableTarget(
            name: "ExocortexTaskTrackerTests",
            dependencies: ["ExocortexTaskTracker"],
            path: "Tests/ExocortexTaskTrackerTests"
        ),
    ]
)
