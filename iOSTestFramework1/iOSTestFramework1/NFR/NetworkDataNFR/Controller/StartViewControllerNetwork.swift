//
//  StartViewControllerNetwork.swift
//  WynkMusicUITests
//
//  Created by B0218201 on 21/07/20.
//  Copyright © 2020 Wynk. All rights reserved.
//

import Foundation
var networkHelper: NetworkHelperTest? = nil
class StartViewControllerNetwork {
    
    init(statusArray: [String]) {
        networkHelper = NetworkHelperTest(statusArray: statusArray)
    }
    
    public func getNetworkUsage(){
        networkHelper!.perform(functionality: Functionality.COLLECT)
    }
    
    
    
}
