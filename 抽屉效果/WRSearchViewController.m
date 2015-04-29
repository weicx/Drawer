//
//  WRSearchViewController.m
//  抽屉效果
//
//  Created by WR on 15-4-29.
//  Copyright (c) 2015年 WR. All rights reserved.
//

#import "WRSearchViewController.h"

@interface WRSearchViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@end

@implementation WRSearchViewController

#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"btn_search_hl"]];
    
    imageView.frame = CGRectMake(0, 0, self.textField.bounds.size.height, self.textField.bounds.size.height);
    
    // 设置图片将光标右移
    self.textField.leftView = imageView;
    self.textField.leftViewMode = UITextFieldViewModeAlways;
}

- (void)viewDidAppear:(BOOL)animated {

    [super viewDidAppear:animated];
    
    [self.textField becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated {

    [super viewWillDisappear:animated];
    
    [self.view endEditing:YES];
}
#pragma mark - Cancel
- (IBAction)cancel:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
