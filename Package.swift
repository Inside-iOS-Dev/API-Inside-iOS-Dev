// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "api-inside-ios-dev",
    products: [
        .library(name: "api-inside-ios-dev", targets: ["App"]),
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0"),

        // 🔵 Swift ORM (queries, models, relations, etc) built on SQLite 3.
//        .package(url: "https://github.com/vapor/fluent-sqlite.git", from: "3.0.0")
//        .package(url: "https://github.com/vapor/json.git", from: Version(2, 2, 2))
    ],
    targets: [
        .target(name: "App", dependencies: [/*"FluentSQLite",*/ "Vapor"]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App"])
    ]
)

