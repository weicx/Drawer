//
//  WRContentView.m
//  抽屉效果
//
//  Created by WR on 15-4-28.
//  Copyright (c) 2015年 WR. All rights reserved.
//

#import "WRContentView.h"
#import "TitleBar.h"

@implementation WRContentView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor colorWithRed:237 / 255.0 green:183 / 255.0 blue:112 / 255.0 alpha:1.0];
        
        self.titleBar.frame = CGRectMake(0, 0, self.bounds.size.width, self.titleBar.bounds.size.height);
        
        [self addSubview:self.titleBar];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {

    if (self = [super initWithCoder:aDecoder]) {
        
        self.backgroundColor = [UIColor lightGrayColor];
        
        self.titleBar.frame = CGRectMake(0, 0, self.bounds.size.width, self.titleBar.bounds.size.height);
        [self addSubview:self.titleBar];
    }
    return self;
}

#pragma mark - Lazy
- (TitleBar *)titleBar {

    if (!_titleBar) {
        
        _titleBar = (TitleBar *)[TitleBar titleBar];
    }
    return _titleBar;
}
@end
