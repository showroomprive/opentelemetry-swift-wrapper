//
//  HttpLogExporterWrapper.swift
//  OpenTelemetryWrapper
//
//  Created by Alexis BURGOS on 19/08/2024.
//

import Foundation
import OpenTelemetryProtocolExporterHttp
import OpenTelemetryProtocolExporterCommon

/// A wrapper class for the `StableOtlpHTTPMetricExporter`, exposing it to Objective-C.
///
/// This class facilitates the creation and usage of an HTTP-based metric exporter by wrapping
/// the `StableOtlpHTTPMetricExporter` provided by the OpenTelemetry SDK, making it accessible
/// from Objective-C code.
@objc public class HttpMetricExporterWrapper: NSObject {
    
    /// The underlying `StableOtlpHTTPMetricExporter` instance responsible for exporting metrics over HTTP.
    let httpMetricExporter: StableOtlpHTTPMetricExporter
    
    /// Initializes a new `HttpMetricExporterWrapper` instance with the specified endpoint URL.
    ///
    /// This initializer creates an `StableOtlpHTTPMetricExporter` configured to send metrics to the provided endpoint URL.
    ///
    /// - Parameter endpoint: The URL string of the endpoint to which metrics will be exported.
    ///
    /// - Important: This initializer will cause a fatal error if the provided endpoint string is invalid.
    @objc public init(
        endpoint: String,
        headers: Dictionary<String, String>? = nil
    ) {
        guard let endpointURL = URL(string: endpoint) else {
            fatalError("Invalid endpoint URL: \(endpoint)")
        }
        
        let headerTuples = headers?.compactMap { dict -> (String, String)? in
            return (dict.key, dict.value)
        }
        
        self.httpMetricExporter = StableOtlpHTTPMetricExporter(
            endpoint: endpointURL,
            config: OtlpConfiguration(
                headers: headerTuples
            ),
            envVarHeaders: headerTuples
        )
    }
}
