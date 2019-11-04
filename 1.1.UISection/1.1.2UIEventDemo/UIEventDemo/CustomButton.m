//
//  CustomButton.m
//  UIEventDemo
//
//  Created by carrot__lsp on 2019/11/4.
//  Copyright © 2019 HappyBunnyCarrot. All rights reserved.
//

#import "CustomButton.h"

@implementation CustomButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    //1.先判断是否能交互/隐藏/透明度,来决定此 view 是否具备事件传递的资格前提.
    if (!self.userInteractionEnabled || self.hidden || self.alpha < 0.01 ) {
        return nil;
    }
    //2.调用 pointInside:withEvennt:方法判断点击的范围是否在此 view 之内.
    if ([self pointInside:point withEvent:event]) {
        //3.反序遍历子视图,调用hitTest:withEvent:方法,查找最合适的 view.
        __block UIView *tempView = nil;
        __weak typeof(self) weakSelf = self;
        [self.subviews enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            //4.这里要记得对 point 进行坐标系的转换.
            CGPoint newPoint = [weakSelf convertPoint:point toView:obj];
            tempView = [obj hitTest:newPoint withEvent:event];
            if (tempView) {
                *stop = YES;
            }
        }];
        //5.如果找到就返回子视图中找到的 view,没有就返回自己.
        if (tempView) {
            return tempView;
        } else {
            return self;
        }
    } else {
        return nil;
    }
    
}
//

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    // 根据坐标系计算距离中心点的直线距离,来判断
    float xValue = point.x - self.frame.size.width / 2.0 ;
    float yValue = point.y - self.frame.size.width / 2.0;
    if (xValue < 0) {
        xValue = -xValue;
    }
    if (yValue < 0) {
        yValue = -yValue;
    }
    if (xValue*xValue + yValue*yValue > (self.frame.size.width / 2.0) * (self.frame.size.width / 2.0)) {
        return NO;
    } else {
        return YES;
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"CustomButton touchesBegan");
}

@end
