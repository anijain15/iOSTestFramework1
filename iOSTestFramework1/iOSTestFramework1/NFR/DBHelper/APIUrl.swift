//
//  APIUrl.swift
//  WynkMusicUITests
//
//  Created by B0218201 on 12/07/20.
//  Copyright © 2020 Wynk. All rights reserved.
//

import UIKit

struct ApiUrl {
    
    private struct Domains{
        static let url = "http://172.16.94.219:80"
    }
    
    private struct Routes{
        static let memoryRoute = "/iosmemoryusage"
        static let cpuRoute = "/ioscpuusage"
        static let networkRoute = "/iosnetworkusage"
        
    }
    static let MemoryUsageUrl = Domains.url + Routes.memoryRoute
    static let CpuUsageUrl = Domains.url + Routes.cpuRoute
    static let NetworkUsageUrl = Domains.url + Routes.networkRoute
    static let grafanaUrl = "http://172.16.44.24:8080/monitor/v1/metrics/app"
}
