//
//  IndexBar.h
//  LSPUISection
//
//  Created by carrot__lsp on 2019/10/30.
//  Copyright © 2019 HappyBunnyCarrot. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol IndexBarDataSource <NSObject>
- (NSArray *_Nullable)indexBarDataSoure;
@end

@interface IndexBar : UIView
@property(nonatomic, weak) id<IndexBarDataSource> _Nullable dataSource;
- (void)reload;
@end

