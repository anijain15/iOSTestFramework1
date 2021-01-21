//
//  MemoryResource.h
//  WynkMusicUITests
//
//  Created by B0218201 on 21/07/20.
//  Copyright © 2020 Wynk. All rights reserved.
//

#ifndef MemoryResource_h
#define MemoryResource_h

#import <Foundation/Foundation.h>

@interface MemoryResource : NSObject


-(NSMutableArray *) freeMemory;
-(NSString *) getApkVer;

@end

#endif /* MemoryResource_h */
