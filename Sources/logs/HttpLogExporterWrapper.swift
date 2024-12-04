//
//  HttpLogExporterWrapper.swift
//  OpenTelemetryWrapper
//
//  Created by Alexis BURGOS on 13/08/2024.
//

import Foundation
import OpenTelemetryProtocolExporterHttp
import OpenTelemetryProtocolExporterCommon

/// `HttpLogExporterWrapper` is a class that wraps the `OtlpHttpLogExporter` to expose it to Objective-C code.
///
/// This class allows applications written in Objective-C to use the HTTP-based log exporting mechanism provided by OpenTelemetry.
///
/// ### Usage
///
/// `HttpLogExporterWrapper` is primarily used to configure a log exporter to a specific endpoint via HTTP.
///
/// ```swift
/// let logExporter = HttpLogExporterWrapper(endpoint: "https://example.com/logs")
/// ```
///
/// - Important: Ensure that the endpoint URL is valid. If the URL is invalid, a fatal error will occur during initialization.
///
/// ### Properties
/// - `httpLogExporter`: The underlying instance of `OtlpHttpLogExporter` responsible for exporting logs over HTTP.
///
/// ### Initializer
/// - `init(endpoint: String)`: Initializes a new instance of `HttpLogExporterWrapper` with the specified endpoint URL.
///     - Parameter endpoint: The string representing the URL of the endpoint to export logs to.
///     - Important: This initializer will cause a fatal error if the provided endpoint URL is invalid.
@objc public class HttpLogExporterWrapper: NSObject {
    
    /// The underlying instance of `OtlpHttpLogExporter` responsible for exporting logs over HTTP.
    let httpLogExporter: OtlpHttpLogExporter
    
    /// Initializes a new instance of `HttpLogExporterWrapper` with the specified endpoint URL.
    ///
    /// - Parameter endpoint: The string representing the URL of the endpoint to export logs to.
    /// - Important: This initializer will cause a fatal error if the provided endpoint URL is invalid.
    ///
    /// - Important: This initializer will cause a fatal error if the provided endpoint string is invalid.
    @objc public init(
        endpoint: String,
        headers: NSMutableDictionary? = nil
    ) {
        guard let endpointURL = URL(string: endpoint) else {
            fatalError("Invalid endpoint URL: \(endpoint)")
        }
        
        let headerTuples = headers?.compactMap { dict -> (String, String)? in
            guard let key = dict.key as? String, let value = dict.value as? String else { return nil }
            return (key, value)
        }
        
        self.httpLogExporter = OtlpHttpLogExporter(
            endpoint: endpointURL,
            config: OtlpConfiguration(),
            envVarHeaders: headerTuples
        )
    }
}
