//
//  ViewReusePool.m
//  LSPUISection
//
//  Created by carrot__lsp on 2019/10/30.
//  Copyright © 2019 HappyBunnyCarrot. All rights reserved.
//

#import "ViewReusePool.h"

@interface ViewReusePool ()
// 等待使用的队列
@property (nonatomic, strong) NSMutableSet *waitUseQueue;
// 使用中的队列
@property (nonatomic, strong) NSMutableSet *usingQueue;

@end

@implementation ViewReusePool

- (instancetype)init
{
    self = [super init];
    if (self) {
        _waitUseQueue = [[NSMutableSet alloc] init];
        _usingQueue = [[NSMutableSet alloc] init];
    }
    return self;
}

- (UIView *)dequeueReusableView {
    UIView *view = [_waitUseQueue anyObject];
    if (view) {
        [_waitUseQueue removeObject:view];
        [_usingQueue addObject:view];
    }
    return view;
}

- (void)addUsingView:(UIView *)view {
    [_usingQueue addObject:view];
}

- (void)reset {
    UIView *view = nil;
    while ((view = [_usingQueue anyObject])) {
        // 从使用中队列移除
        [_usingQueue removeObject:view];
        // 加入等待使用的队列
        [_waitUseQueue addObject:view];
    }
}

@end
