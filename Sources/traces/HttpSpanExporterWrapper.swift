//
//  SpanExporterWrapper.swift
//  OpenTelemetryWrapper
//
//  Created by Alexis BURGOS on 11/07/2024.
//

import Foundation
import OpenTelemetryProtocolExporterHttp
import OpenTelemetryProtocolExporterCommon
import StdoutExporter

/// A wrapper class providing access to the OtlpHttpTraceExporter for exporting spans in Objective-C.
///
/// This class simplifies the usage of the OtlpHttpTraceExporter, enabling Objective-C applications to easily send collected span data to a specified HTTP endpoint for further processing and analysis.
@objc public class HttpSpanExporterWrapper: NSObject {
    
    /// The underlying OtlpHttpTraceExporter instance, responsible for sending span data to the configured HTTP endpoint.
    let httpSpanExporter: OtlpHttpTraceExporter
    
    /// Initializes a new instance of the HttpSpanExporterWrapper with the specified endpoint.
    ///
    /// - Parameter endpoint: The URL string of the HTTP endpoint to export spans to. This endpoint should be configured to receive and process OpenTelemetry span data.
    ////// - Throws: A fatal error if the provided endpoint string is not a valid URL, preventing the exporter from being initialized correctly.
    @objc public init(endpoint: String, apiKey: String) {
        guard let endpointURL = URL(string: endpoint) else {
            fatalError("Invalid endpoint URL: \(endpoint)")
        }
        
        guard !apiKey.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            fatalError("API key is missing or empty")
        }
        
        self.httpSpanExporter = OtlpHttpTraceExporter(
            endpoint: endpointURL,
            config: OtlpConfiguration(headers: [("apiKey", apiKey)])
        )
    }
}
