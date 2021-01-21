//
//  CPUAssistant.swift
//  WynkMusicUITests
//
//  Created by B0218201 on 12/07/20.
//  Copyright © 2020 Wynk. All rights reserved.
//

import SwiftUI

var cpuDict:[String:Any]?
var cpuModel: CpuIosModel?

class CPUAssistant: CpuResourceManager {
    
  init(statusArray: [String])
       {
        cpuModel = CpuIosModel.init(methodName: statusArray[0],
                                    deviceId: NFRHelper.getDeviceName(),
                                    apkVersion: NFRHelper.getApkVersion())!
       }
    
    //method for collecting cpu stats and create data in to CPUModelIos class
    public func collectCPUStats() {

       
        cpuUsage(cpuModel)
        cpuUsageOtherThread(cpuModel)

      //  publishData(cpuDict)
      //  GrafanaUtil.generateCpuDataForGrafana(cpuDict)
        
    }
    
    //method for publishing data into db ,it will first hit mysql connect api then insert into it
    private func publishData(_ cpuDict:[String:Any])
    {
       //guard  let model = cpuModel else
       // {
       //   return
       // }
     //  let cpuRequest = CreateDBRequest()
       //    cpuRequest.createApiRequest(cpuDict,ApiUrls.CpuUsageUrl.rawValue)
      
       // cpuRequest.createNRInsingtApi(cpuDict, NewRelicConstant.NewRelicApiInsights.url.rawValue)

    }
    
    //method for creating cpu dictionary data
    internal func createCpuDictionaryData(_ cpuModel: CpuIosModel?) ->[String:Any]{
        var dict:[String:Any] = [:]
        
        dict["eventType"] = "IOSCpuNFR"
        
        if let methodName = cpuModel?.methodName {
            dict["methodName"] = methodName
            
        }
        if let deviceId = cpuModel?.deviceId{
            dict["deviceId"] = deviceId
        }
        if let apkVersion = cpuModel?.apkVersion{
            dict["apkVersion"] = apkVersion
        }
    
        if let cpuUsedTotal = cpuModel?.cpuUsedTotal{
            dict["cpuUsedTotal"] = cpuUsedTotal
        }
        if let usrSpaceTime = cpuModel?.usrSpaceTime{
            dict["usrSpaceTime"] = usrSpaceTime
        }
        if let systemSpaceTime = cpuModel?.systemSpaceTime{
            dict["systemSpaceTime"] = systemSpaceTime
        }
        if let threadSleepTime = cpuModel?.threadSleepTime{
            dict["threadSleepTime"] = threadSleepTime
        }
        if let otherThreadUsage = cpuModel?.otherThreadUsage{
            dict["otherThreadUsage"] = otherThreadUsage
        }
        
        return dict
        
    }
    
    
 public func perform(functionality: Functionality)
    {

        switch(functionality.rawValue.uppercased()) {
        
        case "COLLECT":
            do{
                try collectCPUStats()
            }
            catch let error as NSError {
                print(error)
            }
            break
       
        case "PUBLISH":
            //publish()
            break
        
        default:
            print("Invalid input received...")
            break
        }
        
    }
}

