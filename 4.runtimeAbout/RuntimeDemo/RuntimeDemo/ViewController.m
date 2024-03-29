//
//  ViewController.m
//  RuntimeDemo
//
//  Created by carrot__lsp on 2019/11/12.
//  Copyright © 2019 HappyBunnyCarrot. All rights reserved.
//

#import "ViewController.h"
#import "SubObject.h"
#import "NSObject+RuntimeTest.h"
#import "Mobile.h"
#import <objc/runtime.h>

#import "AddMethodObject.h"

#import "MessageForwardObject.h"

#import "SwizzlingObject.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    // Do any additional setup after loading the view.
    
    //1.思考下面代码是会编译错误,还是运行时崩溃,还是输出日志,如果输出日志,那么输出的日志内容是什么?
//    SubObject *object = [[SubObject alloc] init];
//    [SubObject foo];
//    [object foo];
//    [SubObject performSelector:@selector(foo) withObject:nil];
//    [object performSelector:@selector(foo) withObject:nil];
    
    
    //2.解析
//    [SubObject foo]; 如果 NSObject+RuntimeTest.m 打开 foo 的注释就会调用 ,输出: Invoked NSObject IMP
//    [SubObject foo]; 如果 NSObject+RuntimeTest.m 注释 foo 方法,则会崩溃.
    
//    [object foo];会编译报错,因为该对象没有 foo 的实例方法
    
//    [SubObject performSelector:@selector(foo) withObject:nil]; 效果同 [SubObject foo];
    
//    [object performSelector:@selector(foo) withObject:nil]; 会输出日志: Invoked SubObject IMP
    
//    3.问题下列代码会打印什么日志?
//    [[Mobile alloc] init];
    
//    4.解答
//    [[Mobile alloc] init];会打印两个 "Mobile",
//    [self class] 的方法的接收者是 self ,最终会通过实例方法找到 NSObject 中.调用从 NSObject 继承的实例方法.
//    [super class] 的方法的接收者还是 self ,不同的在于直接从父类开始查找 class 实例方法,最终还是会找到 NSObject 中.调用从 NSObject 继承的实例方法.
    

//    5.学习Message-Forward
//    [self learnMethoSwizzling];
    
//    6.学习Method-Swizzling;
//    [self learnMethodSwizzling];
    

//    7.学习Add-Method;
    [self learnAddMethod];
}

- (void)learnMethodSwizzling {
    MessageForwardObject *obj = [[MessageForwardObject alloc] init];
    [obj eating];
}

- (void)learnMessageForwarding {
    SwizzlingObject *obj = [[SwizzlingObject alloc] init];
    [obj test];
//    [obj otherTest];
}

- (void)learnAddMethod {
    AddMethodObject *obj = [[AddMethodObject alloc] init];
    IMP dynamicMethodImp = class_getMethodImplementation([self class], @selector(dynamicMethodImp));

    // v 代表返回值是 void 类型的
    // @ 代表第一个参数类型是 id,即 self
    // : 代表第二个参数是 SEL 类型的 即 @
    class_addMethod([obj class], @selector(dynamicMethod), dynamicMethodImp, "v@:");
    [obj performSelector:@selector(dynamicMethod)];
    
}

- (void)dynamicMethodImp {
    NSLog(@"DynamicMethodImp invoked from %@ class",NSStringFromClass([self class]));
}

@end
