//
//  SpanExporterWrapper.swift
//  OpenTelemetryWrapper
//
//  Created by Alexis BURGOS on 11/07/2024.
//

import Foundation
import StdoutExporter

/// A wrapper class providing access to the StdoutSpanExporter for exporting spans in Objective-C.
///
/// This class simplifies the usage of the StdoutSpanExporter, allowing Objective-C applications toeasily output collected span data to the console for debugging and development purposes, aiding in the understanding and troubleshooting of tracing information.
@objc public class StdOutSpanExporterWrapper: NSObject {
    
    /// The underlying StdoutSpanExporter instance, responsible for writing span data to the standard output stream.
    let stdOutExporter: StdoutSpanExporter
    
    /// Initializes a new instance of the StdOutSpanExporterWrapper, creating a StdoutSpanExporter that will output span data to the console.
    ///
    /// - Note: This initializer sets up the StdoutSpanExporter, enabling immediate visibility of span data during development andtesting, facilitating the identification and resolution of potential tracing issues.
    @objc public init(isDebug: Bool) {
        self.stdOutExporter = StdoutSpanExporter(isDebug: isDebug)
    }
}
