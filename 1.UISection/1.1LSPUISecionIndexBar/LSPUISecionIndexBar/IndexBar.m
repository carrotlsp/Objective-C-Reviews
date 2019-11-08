//
//  IndexBar.m
//  LSPUISection
//
//  Created by carrot__lsp on 2019/10/30.
//  Copyright © 2019 HappyBunnyCarrot. All rights reserved.
//

#import "IndexBar.h"
#import "ViewReusePool.h"

@interface IndexBar ()
@property(nonatomic, strong) ViewReusePool *viewReusePool;
@property(nonatomic, strong) NSArray *dataArray;

@end

@implementation IndexBar

- (instancetype)init
{
    self = [super init];
    if (self) {
        _viewReusePool = [[ViewReusePool alloc] init];
        self.backgroundColor = [UIColor greenColor];
    }
    return self;
}


- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    [self reloadData];
}

- (void)reloadData {
   
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(indexBarDataSoure)]) {
           self.dataArray = [self.dataSource performSelector:@selector(indexBarDataSoure)];
       }
       
       for (int i = 0; i < self.dataArray.count; i++) {
           UIButton *btn = (UIButton *)[self.viewReusePool dequeueReusableView];
           if(!btn) {
               btn = [UIButton buttonWithType:UIButtonTypeCustom];
               NSLog(@"创建了 button");
           } else {
               NSLog(@"重用了 button");
           }

           [btn setTitle:[NSString stringWithFormat:@"%i",i] forState:UIControlStateNormal];
           btn.frame = CGRectMake(0, 80 * i, 70, 80);
           [self addSubview:btn];
           [self.viewReusePool addUsingView:btn];
       }
}

- (void)reload {
    [[self subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.viewReusePool reset];
    [self reloadData];
}


@end
