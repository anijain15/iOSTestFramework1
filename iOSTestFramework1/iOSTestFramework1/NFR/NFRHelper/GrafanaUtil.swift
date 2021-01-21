//
//  GrafanaUtil.swift
//  WynkMusicUITests
//
//  Created by B0218201 on 12/07/20.
//  Copyright © 2020 Wynk. All rights reserved.
//

import SwiftUI

class GrafanaUtil {
    
    
    public static func generateMemoryDataForGrafana(_ memdict:[String:Any]){
        let metricPayload = MetricPayload()
        let metricDeviceMeta = MetricDeviceMeta()
        let memUsedTotal = KeyMetric()
        let memUsedFree = KeyMetric()
        let memUsedApp = KeyMetric()
        
        var keyMetricList = [KeyMetric]()
        
        metricDeviceMeta.setApkVersion(NFRHelper.getApkVersion())
        metricDeviceMeta.setDeviceName(NFRHelper.getDeviceName())
        metricDeviceMeta.setPlatform("IOS"+NFRHelper.getOsVersion())
        
        memUsedTotal.setMetricType("memUsedTotal")
        memUsedTotal.setMethodName(memdict["methodName"] as! String)
        let memTotal = memdict["memUsedApp"] as! Int
        memUsedTotal.setMetricValue(Double(memTotal))
        
        memUsedFree.setMetricType("memUsedFree")
        memUsedFree.setMethodName(memdict["methodName"] as! String)
        let memFree = memdict["memUsedFree"] as! Int
        memUsedFree.setMetricValue(Double(memFree))
        
        memUsedApp.setMetricType("memUsedApp")
        memUsedApp.setMethodName(memdict["methodName"] as! String)
        let memApp = memdict["memUsedApp"] as! Int
        memUsedApp.setMetricValue(Double(memApp))
        
        keyMetricList.append(memUsedApp)
        keyMetricList.append(memUsedFree)
        keyMetricList.append(memUsedTotal)

        metricPayload.setClientMeta(metricDeviceMeta)
        metricPayload.setClientMetrics(keyMetricList)
        
        let createDbRequest = CreateDBRequest()
        createDbRequest.createGrafanRequest(metricPayload, ApiUrl.grafanaUrl)
    }
    
    public static func generateCpuDataForGrafana(_ cpudict:[String:Any]){
        let metricPayload = MetricPayload()
        let metricDeviceMeta = MetricDeviceMeta()
        let cpuUsedTotal = KeyMetric()
        let usrSpaceTime = KeyMetric()
        let systemSpaceTime = KeyMetric()
        let otherThreadUsage = KeyMetric()
        
        var keyMetricList = [KeyMetric]()
        
        metricDeviceMeta.setApkVersion(NFRHelper.getApkVersion())
        metricDeviceMeta.setDeviceName(NFRHelper.getDeviceName())
        metricDeviceMeta.setPlatform("IOS"+NFRHelper.getOsVersion())
        
        cpuUsedTotal.setMetricType("cpuUsedTotal")
        cpuUsedTotal.setMethodName(cpudict["methodName"] as! String)
        let cpuTotal = cpudict["cpuUsedTotal"] as! Float
        cpuUsedTotal.setMetricValue(Double(cpuTotal).rounded(.toNearestOrAwayFromZero))
        
        usrSpaceTime.setMetricType("usrSpaceTime")
        usrSpaceTime.setMethodName(cpudict["methodName"] as! String)
        let usrTime = cpudict["usrSpaceTime"] as! Int
        usrSpaceTime.setMetricValue(Double(usrTime))
        
        systemSpaceTime.setMetricType("systemSpaceTime")
        systemSpaceTime.setMethodName(cpudict["methodName"] as! String)
        let sysTime = cpudict["systemSpaceTime"] as! Int
        systemSpaceTime.setMetricValue(Double(sysTime))
        
        otherThreadUsage.setMetricType("otherThreadUsage")
        otherThreadUsage.setMethodName(cpudict["methodName"] as! String)
        let otherThread = cpudict["otherThreadUsage"] as! Float
        otherThreadUsage.setMetricValue(Double(otherThread).rounded(.toNearestOrAwayFromZero))
        
        
        keyMetricList.append(cpuUsedTotal)
        keyMetricList.append(usrSpaceTime)
        keyMetricList.append(systemSpaceTime)
        keyMetricList.append(otherThreadUsage)
        
        metricPayload.setClientMeta(metricDeviceMeta)
        metricPayload.setClientMetrics(keyMetricList)
        
        let createDbRequest = CreateDBRequest()
        createDbRequest.createGrafanRequest(metricPayload, ApiUrl.grafanaUrl)
    }
    
    public static func generateNetworkDataForGrafana(_ nwdict:[String:Any]){
        let metricPayload = MetricPayload()
        let metricDeviceMeta = MetricDeviceMeta()
        let mobileRxData = KeyMetric()
        let mobileTxData = KeyMetric()
        let mobileTotalData = KeyMetric()
        let wifiRxData = KeyMetric()
        let wifiTxData = KeyMetric()
        let wifiTotalData = KeyMetric()
        
        var keyMetricList = [KeyMetric]()
        
        metricDeviceMeta.setApkVersion(NFRHelper.getApkVersion())
        metricDeviceMeta.setDeviceName(NFRHelper.getDeviceName())
        metricDeviceMeta.setPlatform("IOS"+NFRHelper.getOsVersion())
    // mobile usage
        mobileRxData.setMetricType("mobileRxData")
        mobileRxData.setMethodName(nwdict["methodName"] as! String)
        let mobileRx = nwdict["mobileRxData"] as! Int
        mobileRxData.setMetricValue(Double(mobileRx))
        
        mobileTxData.setMetricType("mobileTxData")
        mobileTxData.setMethodName(nwdict["methodName"] as! String)
        let mobileTx = nwdict["mobileTxData"] as! Int
        mobileTxData.setMetricValue(Double(mobileTx))
        
        mobileTotalData.setMetricType("mobileTotalData")
        mobileTotalData.setMethodName(nwdict["methodName"] as! String)
        let mobileTotal = nwdict["mobileTotalData"] as! Int
        mobileTotalData.setMetricValue(Double(mobileTotal))
    
    //wifi usage
        wifiRxData.setMetricType("wifiRxData")
        wifiRxData.setMethodName(nwdict["methodName"] as! String)
        let wifiRx = nwdict["wifiRxData"] as! Int
        wifiRxData.setMetricValue(Double(wifiRx))
        
        wifiTxData.setMetricType("wifiTxData")
        wifiTxData.setMethodName(nwdict["methodName"] as! String)
        let wifiTx = nwdict["wifiTxData"] as! Int
        wifiTxData.setMetricValue(Double(wifiTx))
        
        wifiTotalData.setMetricType("wifiTotalData")
        wifiTotalData.setMethodName(nwdict["methodName"] as! String)
        let wifiTotal = nwdict["wifiTotalData"] as! Int
        wifiTotalData.setMetricValue(Double(wifiTotal))
        
        
        keyMetricList.append(mobileRxData)
        keyMetricList.append(mobileTxData)
        keyMetricList.append(mobileTotalData)
        keyMetricList.append(wifiRxData)
        keyMetricList.append(wifiTxData)
        keyMetricList.append(wifiTotalData)
        
        metricPayload.setClientMeta(metricDeviceMeta)
        metricPayload.setClientMetrics(keyMetricList)
        
        let createDbRequest = CreateDBRequest()
        createDbRequest.createGrafanRequest(metricPayload, ApiUrl.grafanaUrl)
    }
}
