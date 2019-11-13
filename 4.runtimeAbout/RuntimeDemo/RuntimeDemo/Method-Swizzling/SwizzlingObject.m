//
//  SwizzlingObject.m
//  RuntimeDemo
//
//  Created by carrot__lsp on 2019/11/13.
//  Copyright © 2019 HappyBunnyCarrot. All rights reserved.
//

#import "SwizzlingObject.h"
#import <objc/runtime.h>

@implementation SwizzlingObject

+ (void)load {
    //1.class_getInstanceMethod 获得的是类的实例方法;
    //2.class_getClassMethod 获得的是类的类方法;
    Method test = class_getInstanceMethod([SwizzlingObject class], @selector(test));
    Method otherTest = class_getInstanceMethod([SwizzlingObject class], @selector(otherTest));
    method_exchangeImplementations(test, otherTest);
}

- (void)test {
    NSLog(@"test");
}

- (void)otherTest {
    NSLog(@"otherTest");
    [self otherTest];
}

@end
