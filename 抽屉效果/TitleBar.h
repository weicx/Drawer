//
//  TitleBar.h
//  抽屉效果
//
//  Created by WR on 15-4-29.
//  Copyright (c) 2015年 WR. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TitleBar;

@protocol  TitleBarDelegate  <NSObject>

@optional
- (void)titleBar:(TitleBar *)titleBar showMenuWith:(UIButton *)button;
- (void)titlebar:(TitleBar *)titleBar searchWith:(UIButton *)button;
@end

@interface TitleBar : UIView

@property (weak, nonatomic) id <TitleBarDelegate> delegate;
+ (UIView *)titleBar;
@end
