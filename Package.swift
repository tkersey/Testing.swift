// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Testing.swift",
    products: [
        .library(name: "Inheritance", targets: ["Inheritance"]),
        .library(name: "Instance", targets: ["Instance"]),
        .library(name: "Protocol", targets: ["Protocol"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(name: "Inheritance", dependencies: []),
        .testTarget(name: "InheritanceTests", dependencies: ["Inheritance"]),
        .target(name: "Instance", dependencies: []),
        .testTarget(name: "InstanceTests", dependencies: ["Instance"]),
        .target(name: "Protocol", dependencies: []),
        .testTarget(name: "ProtocolTests", dependencies: ["Protocol"]),
    ]
)
