//
//  OCStudent+Behavior.h
//  OCLanguageFeature
//
//  Created by carrot__lsp on 2019/11/7.
//  Copyright © 2019 HappyBunnyCarrot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


#import "OCStudent.h"

@interface OCStudent (Behavior) <UITableViewDelegate>

// 打开下面的注释,将会得到一个编译错误: Instance variables may not be placed in categories
// 证明默认情况下,分类是不允许添加实例变量的.
//{
//    @public
//    NSString *_categoryInstanceVaribale;
//}

// 添加属性
@property(nonatomic, copy) NSString *categoryProperty;


// 通过 category 的做法,可以把某个类的内部方法公开化.
- (void)extensionMethod;
- (void)privateMethod;

@end
