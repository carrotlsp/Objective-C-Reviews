//
//  ViewController.m
//  UIEventDemo
//
//  Created by carrot__lsp on 2019/10/31.
//  Copyright © 2019 HappyBunnyCarrot. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"
#import "CustomButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];
//
    
//    eventView.clipsToBounds = YES;
//    eventView.layer.cornerRadius = 50;
    
    
    CustomButton *button = [CustomButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:button];
    button.backgroundColor = [UIColor yellowColor];
    button.frame = CGRectMake(100, 100, 100, 100);
    
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    

    CustomView *eventView = [[CustomView alloc] initWithFrame:CGRectMake(25, 25, 50, 50)];
    [button addSubview:eventView];
}

- (void)buttonClicked:(UIButton*)btn {
    NSLog(@"此区域可以接收到点击事件");
}




@end
