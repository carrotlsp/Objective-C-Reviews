

#import <Foundation/Foundation.h>
@interface MessageForwardObject : NSObject

// 只有方法声明,没有方法实现,由于父类也没有该方法,就会进行消息转发流程.
- (void)eating;
@end
