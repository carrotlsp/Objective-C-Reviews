//
//  OCUser.m
//  OCLanguageFeature
//
//  Created by carrot__lsp on 2019/11/7.
//  Copyright © 2019 HappyBunnyCarrot. All rights reserved.
//

#import "OCUser.h"

@implementation OCUser

- (instancetype)init
{
    self = [super init];
    if (self) {
        _age = 0;
    }
    return self;
}

- (void)increase {
//    [self willChangeValueForKey:@"age"];
    _age++;
//    [self didChangeValueForKey:@"age"];
}

@end
