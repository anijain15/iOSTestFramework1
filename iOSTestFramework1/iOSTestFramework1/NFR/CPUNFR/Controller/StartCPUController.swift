//
//  StartCPUController.swift
//  WynkMusicUITests
//
//  Created by B0218201 on 12/07/20.
//  Copyright © 2020 Wynk. All rights reserved.
//

import SwiftUI
import UIKit




var cpuHelper: CPUAssistant? = nil
class StartCPUController {
    
    
  
    
    init(statusArray: [String]) {
        cpuHelper = CPUAssistant(statusArray: statusArray)
    }
    
    
    public func getCPUUsage()
    {
        cpuHelper!.perform(functionality: Functionality.COLLECT)
    }
    
}


