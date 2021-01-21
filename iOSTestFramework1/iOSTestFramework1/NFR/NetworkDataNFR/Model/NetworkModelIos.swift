//
//  NetwrokModelIos.swift
//  WynkMusicUITests
//
//  Created by B0218201 on 21/07/20.
//  Copyright © 2020 Wynk. All rights reserved.
//

import Foundation

import UIKit

class NetworkModelIos {
    
    var methodName: String
    var deviceId: String
    var apkVersion: String

    //var timeStamp: String
    var mobileTxData = Float(0.0)
    var mobileRxData = Float(0.0)
    var mobileTotalData = Float(0.0)
    var wifiTxData = Float(0.0)
    var wifiRxData = Float(0.0)
    var wifiTotalData = Float(0.0)
    var networkType: String? 
    
    
    init?(methodName: String,deviceId: String?,apkVersion: String) {
        guard let id = deviceId else {
            return nil
        }
        self.methodName = methodName
        self.deviceId = id
        self.apkVersion = apkVersion
       
    }}
