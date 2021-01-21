//
//  MemoryHelper.swift
//  WynkMusicUITests
//
//  Created by B0218201 on 21/07/20.
//  Copyright © 2020 Wynk. All rights reserved.
//

import Foundation
import UIKit

var memDict:[String:Any]?
var memoryModel: MemoryModelIos?
class MemoryHelper: MemoryResourceManager {
    
    init(statusArray: [String]) {
        memoryModel = MemoryModelIos.init(methodName: statusArray[0] ,deviceId: NFRHelper.getDeviceName(), apkVersion:NFRHelper.getApkVersion())
    }
    
    public func collectMemoryStats() {
        //getTestCaseData(udid: udid, methodName: methodName, LOB: LOB, memoryModel: memoryModel)
        
        report_memory(memoryModel)
        //print(memoryModel!)
        // memDict = createMemDictionaryData(memoryModel)
        
//        if let memDictNew = memDict
//          {
//        for (key,value) in memDictNew{
//
//        print("\(key) : \(value)")
//
//          }
        //}
        //publishData(memDict)
            // GrafanaUtil.generateMemoryDataForGrafana(memDict)

        
    }
    
    //method for generating memory dictionary data for memory model ios
      internal func  createMemDictionaryData(_ memoryModel: MemoryModelIos?) ->[String:Any]{
        //obj: NSObject, apiUrl: ApiUrls
        
        var dict:[String:Any] = [:]
        
        dict["eventType"] = "IOSMemNFR"
        if let methodName = memoryModel?.methodName {
            dict["methodName"] = methodName
            
        }
        if let deviceId = memoryModel?.deviceId{
            dict["deviceId"] = deviceId
        }
        if let apkVersion = memoryModel?.apkVersion{
            dict["apkVersion"] = apkVersion
        }
        
        if let memUsedTotal = memoryModel?.memUsedTotal{
            dict["memUsedTotal"] = memUsedTotal
        }
        if let memUsedFree = memoryModel?.memUsedFree{
            dict["memUsedFree"] = memUsedFree
        }
        if let memUsedWired = memoryModel?.memUsedWired{
            dict["memUsedWired"] = memUsedWired
        }
        if let totalUsedMemSwift = memoryModel?.totalUsedMemSwift{
            dict["totalUsedMemSwift"] = totalUsedMemSwift
        }
        if let memUsedApp = memoryModel?.memUsedApp{
            dict["memUsedApp"] = memUsedApp
        }
        return dict
    }
    
    /*method for publishing data into db ,it will first hit mysql connect api then insert into it
     */
    private func publishData(_ memDict:[String:Any]){
        
        //let memDbRequest = CreateDBRequest()
        //memDbRequest.createApiRequest(memDict, ApiUrl.MemoryUsageUrl)
      //  memDbRequest.createNRInsingtApi(memDict, NewRelicConstant.NewRelicApiInsights.url.rawValue)
    }
    
    
    public func perform(functionality :Functionality ) {
        
        //var memoryModel = MemoryModelIos.init(version, udid, lob, methodname, timestamp)
        guard memoryModel != nil else {
            return
        }
        
        switch (functionality.rawValue.uppercased()) {
        case "COLLECT":
            do
            {
                try collectMemoryStats()
            }
            catch let error as NSError {
                print (error)
            }
            
        case "PUBLISH":
            break
        //publish(statement);
        default:
            print("Invalid input received...")
            break
        }
    }
}
