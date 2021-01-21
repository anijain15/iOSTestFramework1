//
//  StartViewControllerMemory.swift
//  WynkMusicUITests
//
//  Created by B0218201 on 21/07/20.
//  Copyright © 2020 Wynk. All rights reserved.
//

import Foundation
import UIKit

var memoryHelper: MemoryHelper? = nil
  
class StartViewControllerMemory {
    
  
    init(statusArray: [String]) {
        memoryHelper = MemoryHelper(statusArray: statusArray)
    }
    
    
    public func getMemoryUsage(){
        memoryHelper!.perform(functionality: Functionality.COLLECT)
    }
    
}



