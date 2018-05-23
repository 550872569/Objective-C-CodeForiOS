//
//  ChildObjClangAttributes.h
//  Objective-C-Code
//
//  Created by sogou-Yan on 2018/5/22.
//  Copyright © 2018年 sogou. All rights reserved.
//

#import "ObjClangAttributes.h"

@interface ChildObjClangAttributes : NSObject

/** 必须super */
- (void)start __attribute__((objc_requires_super));

@end
