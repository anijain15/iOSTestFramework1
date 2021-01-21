//
//  NetworkHelper.swift
//  WynkMusicUITests
//
//  Created by B0218201 on 21/07/20.
//  Copyright © 2020 Wynk. All rights reserved.
//

import Foundation
import UIKit
var networkDict:[String:Any]?
var mobileRxDataDataHolder:[Float] =  [Float]()
var mobileTxDataDataHolder:[Float] =  [Float]()
var wifiRxDataDataHolder:[Float] = [Float]()
var wifiTxDataDataHolder:[Float] = [Float]()
var networkModel: NetworkModelIos?
class NetworkHelperTest: NetworkResource {
    // These Arrays will hold accumulated values for each run and then we will calculate the average
   
    
   
    
    init(statusArray: [String]) {
        networkModel = NetworkModelIos.init(methodName: statusArray[0],
                                            deviceId: NFRHelper.getDeviceName(),
                                            apkVersion: NFRHelper.getApkVersion()
                                            )
    }
    
    public func collectNetworkStats(){
       
        guard networkModel != nil else {
            print("network model is empty")
            return
        }
       
        let array = (networkDataCounters() as NSArray?) as? [Int]
        pushNetworkModelData(arr: array)
       
        //publishData(networkDict)
        //GrafanaUtil.generateNetworkDataForGrafana(networkDict)
    }
    
    ///********* Don not remove this commented code*************
//    private func publishData(_ networkDict:[String:Any]){
//
//      //  let networkRequest = CreateDBRequest()
//        //networkRequest.createApiRequest(networkDict, ApiUrls.NetworkUsageUrl.rawValue)
//     //   networkRequest.createNRInsingtApi(networkDict, NewRelicConstant.NewRelicApiInsights.url.rawValue)
//    }
    
    internal func createNetworkDictionaryData(_ networkModel: NetworkModelIos?) -> [String:Any]{
        var dict:[String:Any] = [:]
        
        dict["eventType"] = "IOSNetworkNFR"
        
        if let methodName = networkModel?.methodName {
            dict["methodName"] = methodName
        }
        if let deviceId = networkModel?.deviceId{
            dict["deviceId"] = deviceId
        }
        if let apkVersion = networkModel?.apkVersion{
            dict["apkVersion"] = apkVersion
        }
       
        if let mobileRxData = networkModel?.mobileRxData{
            dict["mobileRxData"] = mobileRxData
        }
        if let mobileTxData = networkModel?.mobileTxData{
            dict["mobileTxData"] = mobileTxData
        }
        if let mobileTotalData = networkModel?.mobileTotalData{
            dict["mobileTotalData"] = mobileTotalData
        }
        if let wifiRxData = networkModel?.wifiRxData{
            dict["wifiRxData"] = wifiRxData
        }
        if let wifiTxData = networkModel?.wifiTxData{
            dict["wifiTxData"] = wifiTxData
        }
        if let wifiTotalData = networkModel?.wifiTotalData{
            dict["wifiTotalData"] = wifiTotalData
        }
        if let networkType = networkModel?.networkType{
            dict["networkType"] = networkType
        }
        print(dict)
        return dict
    }
    
    //fucntion to push network data into Network Model class
    private func pushNetworkModelData(arr: [Int]?){
       
        guard arr != nil else {
            return
        }
        if let array = arr, array.count > 3 {
            //let mobileRxData = array[0]/(1024 * 1024)
            mobileRxDataDataHolder.append(Float(array[0]/(1024 * 1024)))
           // let mobileTxData = array[1]/(1024 * 1024)
            mobileTxDataDataHolder.append(Float(array[1]/(1024 * 1024)))
           // let wifiRxData = array[2]/(1024 * 1024)
            wifiRxDataDataHolder.append(Float(array[2]/(1024 * 1024)))
           // let wifiTxData = array[3]/(1024 * 1024)
            wifiTxDataDataHolder.append(Float(array[3]/(1024 * 1024)))
        } //delete this curly brases
            //calculateAverage()
            
           // networkModel?.mobileRxData = Float(mobileRxData)
            
           //networkModel?.mobileTxData = Float(mobileTxData)
//            networkModel?.mobileTotalData = Float(mobileRxData + mobileTxData)
//            networkModel?.wifiRxData = Float(wifiRxData)
//            networkModel?.wifiTxData = Float(wifiTxData)
//            networkModel?.wifiTotalData = Float(wifiRxData + wifiTxData)
//            if networkModel?.mobileTotalData == 0{
//                networkModel?.networkType = "WiFi"
//            }
//            else{
//                networkModel?.networkType = "mobileData"
//            }
//            print(networkModel?.wifiTotalData as Any)
//        } else {
//            debugPrint("array count zero received.. ")
//        }
    }
    
    /**
     Takes an array to calculate the average
     */
    
   
    
    public func perform(functionality: Functionality){
        guard networkModel != nil else {
            return
        }
        
        switch functionality.rawValue.uppercased() {
        case "COLLECT":
            do{
                try collectNetworkStats()
            }
            catch let error as NSError{
                print("unable to collect network stats...!!")
                break
            }
        case "PUBLISH":
            //publish()
            break
        default:
            print("Invalid input received...")
            break
        }
    }
}
