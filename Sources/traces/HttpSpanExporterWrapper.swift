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
    ///
    /// - Important: This initializer will cause a fatal error if the provided endpoint string is invalid.
    @objc public init(
        endpoint: String,
        meterProviderWrapper: MeterProviderWrapper,
        headers: [[String: String]]? = nil
    ) {
        guard let endpointURL = URL(string: endpoint) else {
            fatalError("Invalid endpoint URL: \(endpoint)")
        }
        
        let headerTuples = headers?.compactMap { dict -> (String, String)? in
            guard let key = dict.keys.first, let value = dict.values.first else { return nil }
            return (key, value)
        }
        
        self.httpSpanExporter = OtlpHttpTraceExporter(
            endpoint: endpointURL,
            config: OtlpConfiguration(),
            //meterProvider: meterProviderWrapper.meterProvider,
            envVarHeaders: headerTuples
        )
    }
}
