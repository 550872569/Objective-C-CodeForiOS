//
//  HomeKit.m
//  Objective-C-Code
//
//  Created by sogou-Yan on 2018/5/22.
//  Copyright © 2018年 sogou. All rights reserved.
//

#import "HomeKit.h"

@interface HomeKit ()

@property(nonatomic, strong) HMHomeManager *homeManager;

@end

@implementation HomeKit

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.homeManager = [[HMHomeManager alloc] init];

        self.rootList = [NSMutableArray array];
        
    }
    return self;
}
@end
