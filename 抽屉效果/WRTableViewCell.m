//
//  WRTableViewCell.m
//  抽屉效果
//
//  Created by WR on 15-4-29.
//  Copyright (c) 2015年 WR. All rights reserved.
//

#import "WRTableViewCell.h"

@implementation WRTableViewCell

+ (UITableViewCell *)cellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath{

    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        
        cell.textLabel.text = [NSString stringWithFormat:@"Index - %zd", indexPath.row];
        
        // 随机颜色
        cell.textLabel.textColor = [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1.0];
        
        cell.backgroundColor = [UIColor clearColor];
    }
    return cell;
}

@end
