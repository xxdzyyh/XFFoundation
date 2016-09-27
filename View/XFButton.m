//
//  XFButton.m
//  CTQProject
//
//  Created by wangxuefeng on 16/9/22.
//  Copyright © 2016年 code. All rights reserved.
//

#import "XFButton.h"
#import <YYKit/YYKit.h>

@implementation XFButton

- (void)layoutSubviews {
    [super layoutSubviews];// 调用super来设置大小
    
    self.titleLabel.textAlignment = NSTextAlignmentCenter;

    float x = self.width - self.imageView.width - self.padding - self.titleLabel.width;
    
    float y = self.height - self.imageView.height - self.padding - self.titleLabel.height;
    
    x = x/2;
    y = y/2;
    
    switch (self.imagePostion) {
        case XFButtonImagePostionTop: {
            [self makeImageTop:y];
            break;
        }
        case XFButtonImagePostionLeft: {
            [self makeImageLeft:x];
            break;
        }
        case XFButtonImagePostionRight: {
            [self makeImageRight:x];
            break;
        }
        case XFButtonImagePostionBottom: {
            [self makeImageBottom:y];
            break;
        }
    }
}

- (void)makeImageTop:(float)y {
    self.imageView.center  = CGPointMake(self.width/2, y+self.imageView.height/2);
    self.titleLabel.center = CGPointMake(self.width/2, self.height-y-self.titleLabel.height/2);
}

- (void)makeImageLeft:(float)x {
    self.imageView.center  = CGPointMake(x+self.imageView.width/2, self.bounds.size.height/2);
    self.titleLabel.center = CGPointMake(self.width-x-self.titleLabel.width/2,self.bounds.size.height/2);
}

- (void)makeImageRight:(float)x {
    self.titleLabel.center = CGPointMake(x+self.titleLabel.width/2,self.bounds.size.height/2);
    self.imageView.center  = CGPointMake(self.width-x-self.imageView.width/2, self.bounds.size.height/2);
}

- (void)makeImageBottom:(float)y {
    self.titleLabel.center = CGPointMake(self.width/2, y+self.imageView.height/2);
    self.imageView.center  = CGPointMake(self.width/2, self.height-y-self.imageView.height/2);
}

@end
