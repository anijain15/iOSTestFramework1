//
//  KeyMetric.swift
//  WynkMusicUITests
//
//  Created by B0218201 on 12/07/20.
//  Copyright © 2020 Wynk. All rights reserved.
//

import SwiftUI
import Foundation

class KeyMetric: Codable
{
private var metricValue:Double?
private var metricType:String?        //like dalvikpss
private var methodName:String?       //WelcomeScreen

//getter setter for metric value name
public func setMetricValue(_ metricValue : Double)
{
    self.metricValue = metricValue
}
public func getMetricValue() -> Double?
{
    return self.metricValue
}
//getter setter for metric type
public func setMetricType(_ metricType: String){
    self.metricType = metricType
}
public func getMetricType() -> String?
{
    return self.metricType
}

//getter setter for metric value
public func setMethodName(_ methodName: String){
    self.methodName = methodName
}
public func getMethodName() -> String?
{
    return self.methodName
}

}
