//
//  MemoryModelIos.swift
//  WynkMusicUITests
//
//  Created by B0218201 on 21/07/20.
//  Copyright © 2020 Wynk. All rights reserved.
//

import Foundation
class MemoryModelIos {
    
    
    var methodName: String
    var deviceId: String
    var apkVersion: String
  
    //var timeStamp: String
    var memUsedTotal: Float?
    var memUsedFree:  Float?
    var memUsedWired: Float?
    var totalUsedMemSwift: Float?
    var memUsedApp: Float?
    
    init?(methodName: String,deviceId: String?,apkVersion: String) {
        guard let id = deviceId else {
            return nil
        }
        self.methodName = methodName
        self.deviceId = id
        self.apkVersion = apkVersion
      
        //self.timeStamp = timeStamp
    }
    
}
