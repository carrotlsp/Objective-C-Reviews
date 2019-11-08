//
//  OCFish.h
//  OCLanguageFeature
//
//  Created by carrot__lsp on 2019/11/7.
//  Copyright © 2019 HappyBunnyCarrot. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface OCFish : NSObject

//这样定义array 极容易出问题.
//如果赋值的是 NSMutableArray,那么 copy 会把它深复制成为 NSArray.
//如果赋值的是 NSArray,那么 copy 会把它浅复制成 NSArray.
//而从类型来讲它是M NSMutableArray,这样很容易导致使用者,调用 addobj 这些增删数组的方法,从而导致方法找到,而报错崩溃
@property(copy) NSMutableArray *array;

@end

