// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OpenTelemetryWrapper",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "OpenTelemetryWrapper", targets: ["OpenTelemetryWrapper"])
    ],
    dependencies: [
        .package(url: "https://github.com/open-telemetry/opentelemetry-swift.git", exact: "1.11.0")
    ],
    targets: [
        .target(
            name: "OpenTelemetryWrapper",
            dependencies: [
                .product(name: "OpenTelemetrySdk", package: "opentelemetry-swift"),
//                .product(name: "OpenTelemetryProtocolExporter", package: "opentelemetry-swift"),
                .product(name: "ResourceExtension", package: "opentelemetry-swift"),
                .product(name: "StdoutExporter", package: "opentelemetry-swift"),
            ]
        ),
        .testTarget(
            name: "OpenTelemetryWrapperTests",
            dependencies: ["OpenTelemetryWrapper"]
        ),
    ]
)
