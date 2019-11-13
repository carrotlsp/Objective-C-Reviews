#import "MessageForwardObject.h"

@implementation MessageForwardObject


+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == @selector(eating)) {
        NSLog(@"resolveInstanceMethod");
        return NO;
    } else {
        return [super resolveInstanceMethod:sel];
    }
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    if (aSelector == @selector(eating)) {
        NSLog(@"forwardingTargetForSelector");
        return nil;
    } else {
        return [super forwardingTargetForSelector:aSelector];
    }
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if (aSelector == @selector(eating)) {
        NSLog(@"methodSignatureForSelector");
        // v 代表返回值是 void 类型的
        // @ 代表第一个参数类型是 id,即 self
        // : 代表第二个参数是 SEL 类型的 即 @
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    } else {
        return [super methodSignatureForSelector:aSelector];
    }
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"forwardInvocation");
}

@end
