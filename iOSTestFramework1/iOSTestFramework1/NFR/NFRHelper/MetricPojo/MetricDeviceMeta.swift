//
//  MetricDeviceMeta.swift
//  WynkMusicUITests
//
//  Created by B0218201 on 12/07/20.
//  Copyright © 2020 Wynk. All rights reserved.
//

import SwiftUI

class MetricDeviceMeta: Codable
{
    private var apkVersion: String?
    private var platform: String?
    private var deviceName: String?
    
    //getter setter for apkVersion
    public func setApkVersion(_ apkVersion : String)
    {
        self.apkVersion = apkVersion
    }
    public func getApkVersion() -> String?
    {
        return self.apkVersion
    }
    //getter setter for platform
    public func setPlatform(_ platform : String)
    {
        self.platform = platform
    }
    public func getPlatform() -> String?
    {
        return self.platform
    }
    
    //getter setter for deviceName
    public func setDeviceName(_ deviceName : String)
    {
        self.deviceName = deviceName
    }
    public func getDeviceName() -> String?
    {
        return self.deviceName
    }
    
}
