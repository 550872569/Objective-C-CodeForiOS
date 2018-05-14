//
//  PersonBlock.m
//  Block
//
//  Created by sogou-Yan on 2018/5/14.
//  Copyright © 2018年 sogou. All rights reserved.
//

#import "PersonBlock.h"
#import <UIKit/UIKit.h>
@import JavaScriptCore;

@implementation PersonBlock

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)doWork {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.isMarry) {
        }
        NSLog(@"self-doWork:%@",self);
    });
    [self goShopping];
    [self doScripLeak_];
}

- (void)goShopping {
    
    void(^personShoppingBlock)(void) = ^(void) {
        if (self.isMarry) {
            
        }
        [self goToScrool:nil];//self 引用计数不加1 block 为临时变量 随着函数栈回收内存
        NSLog(@"self-goShopping:%@",self);
    };
    [self goToScrool:personShoppingBlock];
}

- (void)goToScrool:(void(^)())blcok {
    NSLog(@"blcok:%p",blcok);
}

/** block 引用 self 导致 循环引用 */
- (void)doScripLeak_self {
    UIWebView *webView = [[UIWebView alloc] init];
    JSContext *ctx = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    ctx[@"contentUpdateCallback"] = ^(JSValue *msg) {
        [self goToScrool:nil];//self 引用计数加1 不会释放
    };
    
    /**
     __weak typeof(self) weakSelf = self;
     ctx[@"contentUpdateCallback"] = ^(JSValue *msg) {
     __weak typeof(weakSelf) strongSelf = weakSelf;
     [strongSelf goToScrool:nil];//strongSelf 防止block 获取self 时已经被释放
     };
     */
}
/** block 引用 成员变量导致 循环引用 */
- (void)doScripLeak_ {
    UIWebView *webView = [[UIWebView alloc] init];
    JSContext *ctx = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    ctx[@"contentUpdateCallback"] = ^(JSValue *msg) {
        if (_isMarry) {//self 引用计数加1 不会释放
        }
    };
    
    //正确做法
    /**
     __block bool isMarry = _isMarry;
     UIWebView *webView = [[UIWebView alloc] init];
     JSContext *ctx = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
     ctx[@"contentUpdateCallback"] = ^(JSValue *msg) {
     if (isMarry) {
     }
     };
     */
}

@end

