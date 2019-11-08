//
//  OCStudent.h
//  OCLanguageFeature
//
//  Created by carrot__lsp on 2019/11/7.
//  Copyright © 2019 HappyBunnyCarrot. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OCStudent : NSObject {
    // 实例变量如果需要被外部访问,得用 @public 关键字进行生命,不然默认是 @protected
    @public
    NSString *_hostInstanceVariable;
}

@property(nonatomic, copy) NSString *hostProperty;

- (void)publicMethod;

@end

