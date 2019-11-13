//
//  Mobile.m
//  RuntimeDemo
//
//  Created by carrot__lsp on 2019/11/12.
//  Copyright © 2019 HappyBunnyCarrot. All rights reserved.
//

#import "Mobile.h"

@implementation Mobile

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"%@",NSStringFromClass([self class]));
        NSLog(@"%@",NSStringFromClass([super class]));
    }
    return self;
}

@end
