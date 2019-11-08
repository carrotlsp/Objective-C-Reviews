//
//  OCStudent.m
//  OCLanguageFeature
//
//  Created by carrot__lsp on 2019/11/7.
//  Copyright © 2019 HappyBunnyCarrot. All rights reserved.
//

#import "OCStudent.h"


@interface OCStudent ()

- (void)extensionMethod;

@end

@implementation OCStudent

// 不在任何地方声明,私有方法
- (void)privateMethod {
    NSLog(@"privateMethod invoked");
}

// 在类扩展中声明,私有方法
- (void)extensionMethod {
    NSLog(@"extensionMethod invoked");
}

// 在.h 文件中声明,是公开方法
- (void)publicMethod {
    NSLog(@"publicMethod invoked");
}

@end
