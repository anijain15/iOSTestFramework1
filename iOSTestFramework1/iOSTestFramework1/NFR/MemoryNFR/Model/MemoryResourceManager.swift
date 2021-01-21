//
//  MemoryResourceManager.swift
//  WynkMusicUITests
//
//  Created by B0218201 on 21/07/20.
//  Copyright © 2020 Wynk. All rights reserved.
//

import Foundation

var used_bytes = [Float]()
var total_bytes = [Float]()
var totalMemUsed = [Float]()
var memUsedApp =  [Float]()
var memUsedTotal = [Float]()
var memUsedFree = [Float]()
var memUsedWired = [Float]()

class MemoryResourceManager {
    
    func report_memory(_ memoryModel:MemoryModelIos?) {
        
        guard memoryModel != nil else {
            return
        }
        
        let mem = MemoryResource()
        
        var taskInfo = mach_task_basic_info()
        var count = mach_msg_type_number_t(MemoryLayout<mach_task_basic_info>.size)/4
        let kerr: kern_return_t = withUnsafeMutablePointer(to: &taskInfo) {
            $0.withMemoryRebound(to: integer_t.self, capacity: 1) {
                task_info(mach_task_self_, task_flavor_t(MACH_TASK_BASIC_INFO), $0, &count)
            }
        }

        if kerr == KERN_SUCCESS {
            print("Memory used in bytes: \(taskInfo.resident_size)")
          
            used_bytes.append((Float(taskInfo.resident_size))/(1024 * 1024))
           
            total_bytes.append(Float(ProcessInfo.processInfo.physicalMemory))
         
            totalMemUsed.append((Float(ProcessInfo.processInfo.physicalMemory))/(1024 * 1024))

           
            let array = mem.freeMemory()

            memUsedTotal.append((array?[0] as? NSNumber)!.floatValue)

            memUsedFree.append((array?[1] as? NSNumber)!.floatValue)

            memUsedWired.append((array?[2] as? NSNumber)!.floatValue)
        }
        
        else
        {
            print("Error with task_info(): " + (String(cString: mach_error_string(kerr), encoding: String.Encoding.ascii) ?? "unknown error"))
            
        }
    }
}
