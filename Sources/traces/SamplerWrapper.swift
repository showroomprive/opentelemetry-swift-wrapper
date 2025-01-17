//
//  SamplerWrapper.swift
//  OpenTelemetryWrapper
//
//  Created by Alexis BURGOS on 17/01/2025.
//

import Foundation
import OpenTelemetrySdk

/// A wrapper class providing a simplified interface for creating and configuring OpenTelemetry Samplers in Objective-C.
///
/// This class facilitates the integration of custom sampling strategies in Objective-C applications, enabling control over which traces are collected based on a specified sampling ratio.
@objc public class SamplerWrapper: NSObject {
    
    /// The underlying OpenTelemetry Sampler instance used to determine whether a span should be sampled.
    let sampler: Sampler
    
    /// Initializes a new SamplerWrapper with a specified sampling ratio.
    ///
    /// The sampler created is a ParentBased sampler, combining different strategies for local and remote parent spans:
    /// - `root`: A `traceIdRatio` sampler that samples based on a specified ratio.
    /// - `remoteParentSampled` and `localParentSampled`: Always samples when the parent span is sampled.
    /// - `remoteParentNotSampled` and `localParentNotSampled`: Never samples when the parent span is not sampled.
    ///
    /// - Parameters:
    ///   - ratio: A `Double` value between 0.0 and 1.0 representing the probability of sampling new root spans. For example, a ratio of 0.5 means 50% of traces will be sampled.
    ///
    /// - Note: The ParentBased sampler allows flexible configurations by considering both local and remote parent spans when deciding whether to sample a span.
    @objc public init(ratio: Double) {
        self.sampler = Samplers.parentBased(
            root: Samplers.traceIdRatio(ratio: ratio),
            remoteParentSampled: Samplers.alwaysOn,
            remoteParentNotSampled: Samplers.alwaysOff,
            localParentSampled: Samplers.alwaysOn,
            localParentNotSampled: Samplers.alwaysOff
        )
    }
}
