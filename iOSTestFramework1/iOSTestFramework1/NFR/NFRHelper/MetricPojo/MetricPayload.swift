//
//  MetricPayload.swift
//  WynkMusicUITests
//
//  Created by B0218201 on 12/07/20.
//  Copyright © 2020 Wynk. All rights reserved.
//

import SwiftUI

class MetricPayload: Codable{
    
    private var clientMeta:MetricDeviceMeta?
    private var clientMetrics:[KeyMetric]?
    
    //getter setter for metric device meta
    public func setClientMeta(_ clientMeta: MetricDeviceMeta){
        self.clientMeta = clientMeta
    }
    public func getClientMeta() -> MetricDeviceMeta?
    {
        return self.clientMeta
    }
    
    //getter setter for metric device meta
    public func setClientMetrics(_ clientMetrics: [KeyMetric]){
        self.clientMetrics = clientMetrics
    }
    public func getClientMetrics() -> [KeyMetric]?
    {
        return self.clientMetrics
    }
}
