//
//  TracerProviderWrapper.swift
//  OpenTelemetryWrapper
//
//  Created by Alexis BURGOS on 11/07/2024.
//

import Foundation
import OpenTelemetryApi
import OpenTelemetrySdk

/// A wrapper class for creating and managing an OpenTelemetry TracerProvider in Objective-C.
///
/// This class simplifies the construction and configuration of a `TracerProvider`, which is responsible for creating and managing `Tracer` instances used to generate spans for tracing operations. It enables Objective-C applications to integrate distributed tracing by providing access to the OpenTelemetry SDK in a simplified interface.
@objc public class TracerProviderWrapper: NSObject {
    
    /// The underlying OpenTelemetry `TracerProvider` instance, responsible for managing tracers that produce spans for distributed tracing.
    let tracerProvider: TracerProvider
    
    /// Initializes a new `TracerProviderWrapper` with the specified resource, span processor, and sampler.
    ///
    /// - Parameters:
    ///   - resource: A `ResourceWrapper` defining the resource associated with the `TracerProvider`. The resource contains attributes that describe the entity producing telemetry data, such as service name, version, and environment.
    ///   - spanProcessor: A `SpanProcessorWrapper` that defines how spans are processed before being exported. Span processors can modify or filter spans and handle batching or exporting them to a backend.
    ///   - sampler: A `SamplerWrapper` that determines the sampling strategy for deciding which spans to record and export. It influences trace data volume and granularity by controlling span creation based on sampling rules.
    ///
    /// - Note: This initializer sets up a `TracerProvider` with the given resource, span processor, and sampler, forming the core component for generating and managing trace data in the application.
    /// The sampler defines how traces are sampled, allowing for control over the amount of telemetry data generated.
    @objc public init(
        resource: ResourceWrapper,
        spanProcessor: SpanProcessorWrapper,
        sampler: SamplerWrapper
    ) {
        self.tracerProvider = TracerProviderBuilder()
            .add(spanProcessor: spanProcessor.spanProcessor)
            .with(resource: resource.resource)
            .with(sampler: sampler.sampler)
            .build()
    }
}
