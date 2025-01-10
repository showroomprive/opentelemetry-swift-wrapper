# OpenTelemetryWrapper

OpenTelemetryWrapper is a Swift wrapper around the OpenTelemetry Swift library, specifically designed to address Kotlin Multiplatform (KMP) limitations. Since KMP cannot directly import Swift Package Manager dependencies, this wrapper provides a CocoaPods-compatible solution for integrating OpenTelemetry in KMP iOS projects while maintaining a clean, Swift-idiomatic API.

## Why This Wrapper?

When working with Kotlin Multiplatform projects:
- KMP can only use CocoaPods dependencies for iOS targets
- The official OpenTelemetry Swift library is primarily distributed via SPM
- This wrapper bridges this gap by providing a CocoaPods-compatible distribution

## Features

- **Traces**: Easily create and manage distributed traces
- **Metrics**: Collect and export various types of metrics
- **Logs**: Structured logging support with OpenTelemetry integration
- **Swift-first API**: Designed with Swift's modern features in mind
- **Type-safe**: Leverages Swift's type system for safer instrumentation
- **KMP Compatible**: Specifically designed for use in Kotlin Multiplatform projects

## Requirements

- iOS 15.0+
- Swift 5.9+
- Xcode 15.0+

## Installation

### CocoaPods (Recommended for KMP Projects)

Add the following to your `Podfile`:

```ruby
pod 'OpenTelemetryWrapper', '~> 1.0'
```

### Swift Package Manager

While this wrapper is primarily intended for CocoaPods use in KMP projects, it's also available via SPM for pure Swift projects:

```swift
dependencies: [
    .package(url: "https://github.com/showroomprive/opentelemetry-swift-wrapper.git", from: "1.0.0")
]
```

## Project Structure

The project is organized into several modules:

- `Sources/`
- `Tracing/`: Components for distributed tracing
- `Metrics/`: Metrics collection and export
- `Logging/`: Structured logging implementation
- `Common/`: Shared utilities and protocols

## Usage

Here’s a brief introduction to using OpenTelemetryWrapper with sample code snippets.

### Setting Up

Before using OpenTelemetryWrapper, ensure you have it installed via CocoaPods or Swift Package Manager as described in the Installation section.

### Initializing Providers and Wrappers

```swift
import OpenTelemetryWrapper

// Create Tracer
let tracer = TracerWrapper(...)

// Create MeterProviderWrapper
let meter = MeterWrapper(...)

// Create LoggerProviderWrapper
let logger = LoggerWrapper(...)

// Create ContextPropagatorsWrapper
let contextPropagators = ContextPropagatorsWrapper()
```

### Creating Spans (Traces)

```swift
let span = tracer.startSpan(name: "exampleSpan")
// Perform operations
span.end()
```

### Recording Metrics

```swift
let counter = meter.createIntCounter(name: "exampleCounter")
counter.add(1)
```

### Logging Events

```swift
logger.log(level: .info, message: "This is an informational message")
```

Ensure your code follows Swift best practices for error handling and resource management.

## Contributing

We welcome contributions to OpenTelemetryWrapper! We are committed to fostering a welcoming and inclusive environment for all contributors. By participating in this project, you are expected to uphold our [Code of Conduct](CODE_OF_CONDUCT.md) which helps us ensure a positive experience for everyone.

Please see our [Contributing Guidelines](CONTRIBUTING.md) for detailed information on how to:
- Set up your development environment
- Submit bug reports
- Write and submit code changes
- Run tests and maintain code quality
- Follow our coding standards

## License

This project is licensed under the MIT License - see the LICENSE file for details.
