//
//  NFRHelper.swift
//  WynkMusicUITests
//
//  Created by B0218201 on 12/07/20.
//  Copyright © 2020 Wynk. All rights reserved.
//

import Foundation
import UIKit
class NFRHelper: NSObject {
    
    var defaultValArr:[Float] = [0.0]
    var defaultVal:Float = 0.0
    

    //method to get current time stamp with date
    public static func getCurrentTimeStamp() ->String {
        
        return Date().description
    }
    /**
     Calculate Average of values provided in Array
     */
    fileprivate func calculateAverage(_ arrToCalculateAverage: [Float]) -> Float
       {
        var avg: Float = 0.0
        
        guard arrToCalculateAverage != nil && arrToCalculateAverage.count > 0  else
         {
                 return avg
         }
           for i in 0...(arrToCalculateAverage.count - 1)
           {
               avg += arrToCalculateAverage[i]
           }
           
           return avg/Float(arrToCalculateAverage.count)
       }
    
    //method to get apk version
    
    public static func getApkVersion() -> String {
        
        //let versionNumbers = "5.9.4"Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
        let versionNumbers = "5.9.4"
        let buildNum = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String
        //let versionNumber =  versionNumbers.replacingOccurrences(of: ".", with: "")
        let versionNumber =  versionNumbers
        print(buildNum as Any)
        return versionNumber
    }
    
    public func calculateAverageAllMetric()
    {
        // Calculation of Netwrok Data
        networkModel?.mobileRxData  = calculateAverage(mobileRxDataDataHolder )
        networkModel?.mobileTxData = calculateAverage(mobileTxDataDataHolder )
        networkModel?.mobileTotalData = (networkModel?.mobileTxData ?? defaultVal) + (networkModel?.mobileRxData ?? defaultVal)
        networkModel?.wifiRxData  = calculateAverage(wifiRxDataDataHolder )
        networkModel?.wifiTxData  = calculateAverage(wifiTxDataDataHolder )
        networkModel?.wifiTotalData = (networkModel?.wifiRxData ?? defaultVal) + (networkModel?.wifiTxData ?? defaultVal)
        if networkModel?.mobileTotalData == defaultVal
              {
                  networkModel?.networkType = "WiFi"
              }
              else{
                  networkModel?.networkType = "mobileData"
              }
        
        //Calculation of Memory Data
        memoryModel?.memUsedApp = calculateAverage(used_bytes)
        memoryModel?.memUsedFree = calculateAverage(memUsedFree)
        memoryModel?.memUsedTotal = calculateAverage(memUsedTotal)
        memoryModel?.memUsedWired = calculateAverage(memUsedFree)
        memoryModel?.totalUsedMemSwift = calculateAverage(totalMemUsed)
        
    
        //Calculation for CPU Data
        cpuModel?.cpuUsedTotal = calculateAverage(tot_cpu)
        cpuModel?.otherThreadUsage = calculateAverage(tot_cpu_other)
        cpuModel?.usrSpaceTime = calculateAverage(usr_space_time)
        cpuModel?.systemSpaceTime = calculateAverage(system_space_time)
        cpuModel?.threadSleepTime = calculateAverage(thread_sleep_time)

        
        networkDict = networkHelper!.createNetworkDictionaryData(networkModel)
        memDict = memoryHelper!.createMemDictionaryData(memoryModel)
        cpuDict = cpuHelper?.createCpuDictionaryData(cpuModel)
    
        createPerfDict()
        
    }
    
    
    private func createPerfDict()
    {
        let y:click_to_play = click_to_play.init(LIONSGATEPLAY: 0.0)
        let x:apkanalyser = apkanalyser.init(apk_external_size: 0, initial_app_cache: 0, initial_app_installed_size: 0, initial_app_data: 0, final_app_cache: 0, final_app_installed_size: 0, final_app_data:0)


        let z:metrics = metrics.init(max_cpu_utilized:cpuDict?["cpuUsedTotal"] as! Float, max_mem_consumed: memDict?["memUsedTotal"] as! Float, max_native_heap_consumed:0.0, max_code_heap_consumed: 0.0, max_java_heap_consumed: 0.0, janky_frames: 0.0, storage_consumed_before_start: 0.0, storage_consumed: 0.0, data_consumed: networkDict?["mobileTotalData"] as! Float
                                    , apkanalyser: x, click_to_play: y)

        let ramM:String = Double(ProcessInfo.processInfo.physicalMemory/(1024 * 1024 * 1024)).description

        let m = device.init(type:"iOS" , name: "Performance build", networkType: "wifi", os: ProcessInfo.processInfo.operatingSystemVersionString, deviceOperator: "Apple", manufacturer: "Apple", model: NFRHelper.getDeviceName(), hardware: "", cpuAbi:"x86", sdkVersion: "27", totalDeviceStorage: "", ram: ramM )

        let a = appInfo.init(name: "WynkMusic", version:"123", appVersion: cpuDict?["apkVersion"] as! String , buildNumber: "12345")

        let per = PerfModel.init(scenarioName: cpuDict?["methodName"] as! String, featureName: "", status: "PASS", duration: 409.782, env: "STG", testReportUrl: "sdnmsdnfk.html", appinfo: a, device: m, metrics: z)


        DataService.shared.postTestResultsInKibana(per)
        
    }
    //method to get connectd device info
    public static func getDeviceName() ->String {
        
        return UIDevice.current.name.replacingOccurrences(of: "’", with: "")
    }
    
    //method to get IOS version
    public static func getOsVersion() -> String{
        return UIDevice.current.systemVersion
    }
    
}

extension UIDevice {
    var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        return identifier
    }
}



