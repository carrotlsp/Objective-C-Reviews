//
//  ViewController.m
//  OCLanguageFeature
//
//  Created by carrot__lsp on 2019/11/7.
//  Copyright © 2019 HappyBunnyCarrot. All rights reserved.
//

#import "ViewController.h"
#import "OCStudent.h"
#import "OCStudent+Behavior.h"
#import <objc/runtime.h>

#import "OCUser.h"
#import "OCObserver.h"

#import "OCFish.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self learnCategory];
    
//    [self learnKVO];
    
//    [self learnPropertyKeyword];
}

- (void)learnPropertyKeyword {
    OCFish *fish = [[OCFish alloc] init];
    fish.array = [[NSMutableArray alloc] init];
    // 这样是会崩溃的
    [fish.array addObject:@"swim"];
}

- (void)learnKVO {
    OCUser *user = [[OCUser alloc] init];
    OCObserver *observer = [[OCObserver alloc] init];
    
    //通过添加 observer 前后观察 user 的 isa 指针,从而验证 apple 使用了 isa-swizzling 方法.
    NSLog(@"%s",object_getClassName(user));
    [user addObserver:observer forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:NULL];
    NSLog(@"%s",object_getClassName(user));
    
    
    //是有属性赋值,触发 KVO
    user.age = 1;
    //思考 KVC 会触发 KVO 吗?
    //[user setValue:@2 forKey:@"age"];
    
    //思考直接使用 user 的成员变量 _age 会触发 KVO 吗?
    //[user increase];
    
    //思考如果使用 user 的成员变量 _age 不会触发 KVO ,那应该怎么手动触发?(increase去这个方法里面,打开注释试试.)
    //[user increase];
}

- (void)learnCategory {
    OCStudent *student = [[OCStudent alloc] init];
    
    // 私有其实不是真的私有,还是可以通过这种方式调用的.
//    [student performSelector:@selector(publicMethod)];
//    [student performSelector:@selector(extensionMethod)];
//    [student performSelector:@selector(privateMethod)];
    
    //正常的调用方式只能调用这个公开方法.
    [student publicMethod];
    
    //但是如果利用 category 就可以把 OCStudent 的内部方法公开出来
    [student privateMethod];
    [student extensionMethod];
    
    //宿主的属性和实例变量
    student.hostProperty = @"宿主的属性(host property)";
    student->_hostInstanceVariable = @"宿主的实例变量(host instanceVaribale)";
    NSLog(@"%@",student.hostProperty);
    NSLog(@"%@",student->_hostInstanceVariable);
    
    //分类的属性,分别运行下面的两行代码,会捕获到一个运行时错误:
    //-[OCStudent setCategoryProperty:]: unrecognized selector sent to instance 0x600001613de0
    //-[OCStudent categoryProperty]: unrecognized selector sent to instance 0x600002b27c60
    //证明:虽然分类添加了属性,但是没有实现 get 和 set 方法.
    //需要在 category 里面添加属性,需要用关联对象的方法.
    student.categoryProperty = @"分类的属性(category property)";
    NSLog(@"%@",student.categoryProperty);
    
}


@end
