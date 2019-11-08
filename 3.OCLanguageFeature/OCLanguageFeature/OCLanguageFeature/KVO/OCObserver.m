//
//  OCObserver.m
//  OCLanguageFeature
//
//  Created by carrot__lsp on 2019/11/7.
//  Copyright © 2019 HappyBunnyCarrot. All rights reserved.
//

#import "OCObserver.h"
#import "OCUser.h"

@implementation OCObserver

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([object isKindOfClass:[OCUser class]] && [keyPath isEqualToString:@"age"]) {
        NSLog(@"触发了KVO:  %@",[change objectForKey:@"new"]);
    }
}

@end
