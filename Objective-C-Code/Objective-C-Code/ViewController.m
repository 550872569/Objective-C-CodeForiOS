//
//  ViewController.m
//  Objective-C-Code
//
//  Created by sogou-Yan on 2018/5/14.
//  Copyright © 2018年 sogou. All rights reserved.
//

#import "ViewController.h"
#import "PersonBlock.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    PersonBlock *personBlock = [[PersonBlock alloc] init];
    [personBlock doWork];
}


@end
