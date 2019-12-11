//
//  TestImagePostionVC.m
//  XFFoundation
//
//  Created by xiaoniu on 2019/6/24.
//  Copyright © 2019 wangxuefeng. All rights reserved.
//

#import "TestImagePostionVC.h"
#import "UIButton+ImagePostion.h"
#import "UIView+Utils.h"

@interface TestImagePostionVC ()

@end

@implementation TestImagePostionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    UIButton *button1 = [self createButton];
    [button1 setImagePostion:ImagePostionTop padding:10];
    [self.view addSubview:button1];
    
    UIButton *button2 = [self createButton];
    button2.top = 150;
    [button2 setImagePostion:ImagePostionRight padding:10];
    [self.view addSubview:button2];
    
    UIButton *button3 = [self createButton];
    button3.top = 200;
    button3.left = 150;
    [button3 setImagePostion:ImagePostionBottom padding:10];
    [self.view addSubview:button3];
    
    
    UIButton *button4 = [self createButton];
    button4.top = 0;
    button4.left = 150;
    [button4 setImagePostion:ImagePostionLeft padding:10];
    [self.view addSubview:button4];
}



- (UIButton *)createButton {
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    
    button.backgroundColor = [UIColor grayColor];
    [button setImage:[UIImage imageNamed:@"red_public_welfare"] forState:UIControlStateNormal];
    [button setTitle:@"ww" forState:UIControlStateNormal];
    
    return button;
}

@end
