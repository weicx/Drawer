//
//  TitleBar.m
//  抽屉效果
//
//  Created by WR on 15-4-29.
//  Copyright (c) 2015年 WR. All rights reserved.
//

#import "TitleBar.h"

@interface TitleBar ()

@end
@implementation TitleBar

+ (UIView *)titleBar {

    return [[[NSBundle mainBundle] loadNibNamed:@"TitleBar" owner:nil options:nil] lastObject];
}

#pragma mark - Events
- (IBAction)menuClick:(UIButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(titleBar:showMenuWith:)]) {
        
        [self.delegate titleBar:self showMenuWith:sender];
    }
}
- (IBAction)search:(UIButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(titlebar:searchWith:)]) {
        
        [self.delegate titlebar:self searchWith:sender];
    }
}
@end
