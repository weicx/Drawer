//
//  WRTableView.m
//  抽屉效果
//
//  Created by apple on 15-4-29.
//  Copyright (c) 2015年 WR. All rights reserved.
//

#import "WRTableView.h"

@implementation WRTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {

    if (self = [super initWithFrame:frame style:style]) {
        
        self.backgroundColor = [UIColor clearColor];
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return self;
}

@end
