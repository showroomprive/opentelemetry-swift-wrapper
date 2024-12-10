//
//  SemanticAttributesWrapper.swift
//  OpenTelemetryWrapper
//
//  Created by Alexis BURGOS on 17/07/2024.
//

import OpenTelemetryApi

/// A Swift enumeration that provides Objective-C compatible access to common OpenTelemetry semantic attributes.
///
/// This wrapper simplifies the use of OpenTelemetry's semantic attribute keys in Objective-C code, offering a structured and type-safe way
/// to work with attributes like HTTP request headers, methods, URLs, and response status codes when instrumenting applications.
///
/// Each case in this enum corresponds to a specific semantic attribute key, which can be used to associate telemetry data with spans.
@objc public enum SemanticAttributesWrapper: Int, RawRepresentable {
    /// Represents the HTTP request header attribute, capturing key-value pairs sent in the request headers.
    case httpRequestHeader
    
    /// Represents the HTTP request method attribute, indicating the HTTP method (e.g., GET, POST, PUT) used in the request.
    case httpRequestMethod
    
    /// Represents the full URL of the HTTP request, providing the complete URL path, including query parameters.
    case urlFull
    
    /// Represents the HTTP response header attribute, capturing key-value pairs from the server's response headers.
    case httpResponseHeader
    
    /// Represents the HTTP response status code, capturing the numerical HTTP status code returned by the server (e.g., 200 for success, 404 for not found).
    case httpResponseStatusCode
    
    /// The raw string value type used to represent a semantic attribute key.
    public typealias RawValue = String
    
    /// Returns the raw string value of the semantic attribute. This is the actual key used to tag telemetry data within traces and spans.
    ///
    /// For predefined attributes, the raw value maps to OpenTelemetry's semantic conventions.
    public var rawValue: RawValue {
        switch self {
            case .httpRequestHeader:
                return "http.request.header"
            case .httpRequestMethod:
                return SemanticAttributes.httpRequestMethod.rawValue
            case .urlFull:
                return SemanticAttributes.urlFull.rawValue
            case .httpResponseHeader:
                return "http.response.header"
            case .httpResponseStatusCode:
                return SemanticAttributes.httpResponseStatusCode.rawValue
        }
    }
    
    /// Initializes a new instance of `SemanticAttributesWrapper` from a raw string value.
    ///
    /// - Parameter rawValue: The raw string key that represents a semantic attribute. If the raw value doesn't match any known attribute, the initializer returns `nil`.
    public init?(rawValue: RawValue) {
        switch rawValue {
            case "http.request.header":
                self = .httpRequestHeader
            case SemanticAttributes.httpRequestMethod.rawValue:
                self = .httpRequestMethod
            case SemanticAttributes.urlFull.rawValue:
                self = .urlFull
            case "http.response.header":
                self = .httpResponseHeader
            case SemanticAttributes.httpResponseStatusCode.rawValue:
                self = .httpResponseStatusCode
            default:
                return nil
        }
    }
}
