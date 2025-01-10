# Contributing to OpenTelemetryWrapper

First off, thank you for considering contributing to OpenTelemetryWrapper! It's people like you who make this library better for everyone.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Setting Up Development Environment](#setting-up-development-environment)
- [Reporting Issues](#reporting-issues)
- [Pull Request Process](#pull-request-process)
- [Swift Coding Standards](#swift-coding-standards)
- [Testing Requirements](#testing-requirements)
- [Package Management Guidelines](#package-management-guidelines)

## Code of Conduct

This project and everyone participating in it is governed by our Code of Conduct. By participating, you are expected to uphold this code.

## Setting Up Development Environment

1. Ensure you have the following installed:
- Xcode 15.0 or later
- Swift 5.9 or later
- CocoaPods 1.12.0 or later
- Git

2. Fork and clone the repository:
```bash
git clone https://github.com/YOUR_USERNAME/opentelemetry-swift-wrapper.git
cd opentelemetry-swift-wrapper
```

3. Install dependencies:
```bash
# For SPM development
swift package resolve

# For CocoaPods development
pod install
```

## Reporting Issues

- Use the GitHub issue tracker to report bugs
- Before creating a new issue, please search to ensure it hasn't already been reported
- Include as much detail as possible:
- Version of OpenTelemetryWrapper
- Swift and Xcode versions
- Complete steps to reproduce the issue
- Expected vs actual behavior
- Sample code or failing test case

## Pull Request Process

1. Create a feature branch from `main`:
```bash
git checkout -b feature/your-feature-name
```

2. Make your changes following our coding standards

3. Add or update tests as needed

4. Update documentation to reflect any changes

5. Run the test suite:
```bash
swift test
```

6. Commit your changes following conventional commits:
```
feat: add new tracing feature
fix: resolve metric collection issue
docs: update API documentation
```

7. Push to your fork and submit a pull request

## Swift Coding Standards

- Follow Swift.org's API Design Guidelines
- Use Swift's native error handling (`throw`/`catch`)
- Prefer value types (`struct`) over reference types when appropriate
- Use Swift's strong type system to prevent runtime errors
- Document all public APIs using markup comments
- Follow naming conventions:
```swift
// Types start with capital letters
struct TracerWrapper {
    // Properties and methods use camelCase
    func startSpan(name: String) -> Span {
        // Implementation
    }
}
```

## Testing Requirements

- All new code must include unit tests
- Maintain or improve code coverage
- Test categories required:
- Unit tests for business logic
- Integration tests for OpenTelemetry interaction
- Performance tests for critical paths
- Run tests before submitting PR:
```bash
swift test --enable-code-coverage
```

## Package Management Guidelines

### CocoaPods
- Update the podspec when making changes:
- Version number
- Dependencies
- Supported platforms
- Test the pod locally:
```bash
pod lib lint
```

### Swift Package Manager
- Maintain accurate package dependencies in Package.swift
- Test both release and debug configurations
- Verify package resolution:
```bash
swift package resolve
swift package show-dependencies
```

## Additional Resources

- [Swift API Design Guidelines](https://swift.org/documentation/api-design-guidelines/)
- [OpenTelemetry Documentation](https://opentelemetry.io/docs/)
- [CocoaPods Guides](https://guides.cocoapods.org)

