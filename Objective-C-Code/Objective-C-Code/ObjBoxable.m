//
//  ObjBoxable.m
//  Objective-C-Code
//
//  Created by sogou-Yan on 2018/5/22.
//  Copyright © 2018年 sogou. All rights reserved.
//

#import "ObjBoxable.h"
#import <UIKit/UIKit.h>

typedef struct __attribute__((objc_boxable)) {
    CGFloat x;
    CGFloat y;
    CGFloat w;
    CGFloat h;
} YYRect;

@implementation ObjBoxable

- (instancetype)init
{
    self = [super init];
    if (self) {
        CGRect rect = CGRectMake(0, 0, 0, 0);
        NSValue *value_0 = @(rect);
        YYRect rect_0 = {1,1,1,1};
        NSValue *value_1 = @(rect_0);
    }
    return self;
}

@end
