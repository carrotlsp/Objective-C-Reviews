//
//  CustomView.m
//  UIEventDemo
//
//  Created by carrot__lsp on 2019/10/31.
//  Copyright © 2019 HappyBunnyCarrot. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}


- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    
    
    NSLog(@"%@",NSStringFromCGPoint(point));
    float xValue = point.x - self.frame.size.width / 2.0;
    float yValue = point.y - self.frame.size.height / 2.0;
    if (xValue < 0) {
        xValue = -xValue;
    }
    if (yValue < 0) {
        yValue = -yValue;
    }
    if (xValue*xValue + yValue*yValue > (self.frame.size.width / 2.0) * (self.frame.size.height / 2.0)) {
        return NO;
    } else {
        return YES;
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"CustomView");
}

@end
