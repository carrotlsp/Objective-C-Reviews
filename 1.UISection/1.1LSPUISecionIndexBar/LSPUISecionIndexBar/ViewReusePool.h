//
//  ViewReusePool.h
//  LSPUISection
//
//  Created by carrot__lsp on 2019/10/30.
//  Copyright © 2019 HappyBunnyCarrot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// 实现重用机制的类
@interface ViewReusePool : NSObject

// 从重用池当中取出一个可重用的view
- (UIView*)dequeueReusableView;

// 向重用池当中添加一个视图
- (void)addUsingView:(UIView*)view;

// 重置方法，将当前使用中的视图移动到可重用队列当中
- (void)reset;

@end
