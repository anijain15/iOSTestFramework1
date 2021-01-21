//
//  CreateDBRequest.swift
//  WynkMusicUITests
//
//  Created by B0218201 on 12/07/20.
//  Copyright © 2020 Wynk. All rights reserved.
//

import SwiftUI
import UIKit

class CreateDBRequest: NSObject {
    
    //fucntion to hit mysql connect api with json data and content type in body
    public func createApiRequest(_ dict:[String:Any],_ url:String){
        
        if let jsonData = try? JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted) {
            
            let url = NSURL(string: url)!
            let request = NSMutableURLRequest(url: url as URL)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            request.httpBody = jsonData
            request.addValue("MXIPH", forHTTPHeaderField: "username")
            
            let task = URLSession.shared.dataTask(with: request as URLRequest){ data,response,error in
                if error != nil{
                    print(error?.localizedDescription)
                    return
                }
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                    
                    if let parseJSON = json {
                        let resultValue:String = "success" as! String;
                        print("result: \(resultValue)")
                        print(parseJSON)
                    }
                } catch let error as NSError {
                    print(error)
                }
            }
            task.resume()
        }
    }
    
    //fucntion to hit New Relic Insight api with json data and content type in body
//    public func createNRInsingtApi(_ dict:[String:Any],_ url:String){
//
//        if let jsonData = try? JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted) {
//
//            let url = NSURL(string: url)!
//            let request = NSMutableURLRequest(url: url as URL)
//            request.httpMethod = "POST"
//            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//            request.addValue(NewRelicConstant.NewRelicApiInsights.insertKey.rawValue, forHTTPHeaderField: "X-Insert-Key")
//            request.httpBody = jsonData
//
//
//
//            let semaphore = DispatchSemaphore(value: 0)
//            let task = URLSession.shared.dataTask(with: request as URLRequest){ data,response,error in
//                if error != nil{
//                    print(error?.localizedDescription as Any)
//                    semaphore.signal()
//                    return
//                }
//
//                do {
//                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
//
//                    if let parseJSON = json {
//                        let resultValue:String = "success";
//                        print("result: \(resultValue)")
//                        print(parseJSON)
//                    }
//                } catch let error as NSError {
//                    print(error)
//                }
//                semaphore.signal()
//
//            }
//            task.resume()
//            semaphore.wait()
//
////            while(!complete){
////                sleep(3)
////            }
//        }
//    }
//
    
    ///////////////////////////////////////////grafana request builder/////////////////////
    public func createGrafanRequest(_ dict:MetricPayload,_ url:String){
        if let jsonData: Data =  try? JSONEncoder().encode(dict) {
            
            let url = NSURL(string: url)!
            let request = NSMutableURLRequest(url: url as URL)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            request.httpBody = jsonData
            request.addValue("MXIPH", forHTTPHeaderField: "username")
            
            let task = URLSession.shared.dataTask(with: request as URLRequest){ data,response,error in
                if error != nil{
                    print(error?.localizedDescription as Any)
                    return
                }
                do {
                    if let res = response as? HTTPURLResponse, res.statusCode == 200 {
                        print("Success")
                    }
                } catch let error as NSError {
                    print(error)
                }
            }
            task.resume()
        }
    }
}
