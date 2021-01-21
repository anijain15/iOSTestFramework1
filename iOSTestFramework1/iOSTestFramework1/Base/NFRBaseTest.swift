//
//  NFRBaseTest.swift
//  Wynk MusicUITests
//
//  Created by B0215499 on 01/09/20.
//  Copyright © 2020 Wynk. All rights reserved.
//

import UIKit
import XCTest



class NFRBaseTest: XCTest {
    let testRunVar: XCTestRun?
    var tcname: String?
    
    init(_ testRunVar: XCTestRun?,_ testName: String?) {
        self.testRunVar = testRunVar
        self.tcname = testName
    }
    
    
    public func onTestSucceed(){
        var statusArray: [String]?
        guard let run = testRunVar else {
            return
        }
        if run.failureCount > 0 {
            //Failed
        }
        else
        {
            guard let tcName = tcname else {
                return
            }
            
            let array = tcName.replacingOccurrences(of: "-[", with: "").replacingOccurrences(of: "]", with: "").components(separatedBy: " ")
            
            let testMethod: String = array[1]
            
            statusArray = [testMethod]
            
            
            print(statusArray as Any)
            if let statusArray = statusArray {
                captureNFRStats(statusArray)
            }
            //
            //            let y:click_to_play = click_to_play.init(LIONSGATEPLAY: 0.0)
            //            let x:apkanalyser = apkanalyser.init(apk_external_size: 0, initial_app_cache: 0, initial_app_installed_size: 0, initial_app_data: 0, final_app_cache: 0, final_app_installed_size: 0, final_app_data:0)
            //
            //
            //            let z:metrics = metrics.init(max_cpu_utilized:cpuDict?["cpuUsedTotal"] as! Float, max_mem_consumed: memDict?["memUsedTotal"] as! Float, max_native_heap_consumed:0.0, max_code_heap_consumed: 0.0, max_java_heap_consumed: 0.0, janky_frames: 0.0, storage_consumed_before_start: 0.0, storage_consumed: 0.0, data_consumed: networkDict?["mobileTotalData"] as! Float
            //                                               , apkanalyser: x, click_to_play: y)
            //
            //            let ramM:String = Double(ProcessInfo.processInfo.physicalMemory/(1024 * 1024 * 1024)).description
            //
            //            let m = device.init(type:"iOS" , name: "Performance build", networkType: "wifi", os: ProcessInfo.processInfo.operatingSystemVersionString, deviceOperator: "Apple", manufacturer: "Apple", model: NFRHelper.getDeviceName(), hardware: "", cpuAbi:"x86", sdkVersion: "27", totalDeviceStorage: "", ram: ramM )
            //
            //            let a = appInfo.init(name: "WynkMusic", version:"2323_232", appVersion: cpuDict?["apkVersion"] as! String , buildNumber: "12345")
            //
            //            let per = PerfModel.init(scenarioName: cpuDict?["methodName"] as! String, featureName: "", status: "PASS", duration: 409.782, env: "STG", testReportUrl: "sdnmsdnfk.html", appinfo: a, device: m, metrics: z)
            //
            //
            //            DataService.shared.postTestResultsInKibana(per)
            
            
        }
    }
    
    private func captureNFRStats(_ statusArray: [String])
    {
        let memoryController = StartViewControllerMemory(statusArray: statusArray)
        let cpuController = StartCPUController(statusArray: statusArray)
        let networkController = StartViewControllerNetwork(statusArray: statusArray)
        do {
            try memoryController.getMemoryUsage()
            try cpuController.getCPUUsage()
            try networkController.getNetworkUsage()
        }
        catch let error as NSError{
            print("error ")
        }
        
    }
}


