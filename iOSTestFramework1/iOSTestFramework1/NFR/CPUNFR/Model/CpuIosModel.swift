//
//  CpuIosModel.swift
//  WynkMusicUITests
//
//  Created by B0218201 on 12/07/20.
//  Copyright © 2020 Wynk. All rights reserved.
//

import SwiftUI
import UIKit

class CpuIosModel {
    
    var methodName: String
    var deviceId: String
    var apkVersion: String
    var cpuUsedTotal: Float?
    var usrSpaceTime: Float?
    var systemSpaceTime:Float?
    var threadSleepTime: Float?
    var otherThreadUsage: Float?
    
    
    init?(methodName: String,deviceId: String?,apkVersion: String) {
        guard let id = deviceId else {
            return nil
        }
        self.methodName = methodName
        self.deviceId = id
        self.apkVersion = apkVersion
       
       
    }
    
}
