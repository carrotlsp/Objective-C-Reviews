//
//  OCStudent+Behavior.m
//  OCLanguageFeature
//
//  Created by carrot__lsp on 2019/11/7.
//  Copyright © 2019 HappyBunnyCarrot. All rights reserved.
//

#import "OCStudent+Behavior.h"
#import <Foundation/Foundation.h>
#import <objc/runtime.h>

static const void *CategoryPropertyKey = &CategoryPropertyKey;

@implementation OCStudent (Behavior)

@dynamic categoryProperty;

- (NSString *)categoryProperty {
    return objc_getAssociatedObject(self, CategoryPropertyKey);
}

- (void)setCategoryProperty:(NSString *)categoryProperty {
    objc_setAssociatedObject(self, CategoryPropertyKey, categoryProperty, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
