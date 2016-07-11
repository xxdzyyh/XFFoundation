//
//  XFNavigationController.m
//  CTQProject
//
//  Created byhuang on 16/3/15.
//  Copyright © 2016年 code. All rights reserved.
//

#import "XFNavigationController.h"

@interface XFNavigationController ()<UINavigationControllerDelegate>

@end

@implementation XFNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationBar.titleTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:18],
                                               NSForegroundColorAttributeName:[UIColor whiteColor]};

    self.navigationBar.barTintColor = [UIColor orangeColor];
    self.navigationBar.translucent = NO;
    
    UIImage *image = [UIImage new];
    
    [self.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:image];
    
    
//    self.navigationBar.barTintColor = [UIColor clearColor];
//    self.navigationBar.translucent = YES;
//    
//    UIImage *image = [XFNavigationController createImageWithColor:[UIColor clearColor]];
//    
//    [self.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
//    [self.navigationBar setShadowImage:image];
//    
    self.delegate = self;
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if ([viewController isEqual:self.viewControllers[0]]) {
        // rootViewController就没有必要加返回
        
    } else {
        
        BOOL hasCustomLeftItem = viewController.navigationItem.leftBarButtonItem || viewController.navigationItem.leftBarButtonItems.count > 0;
        
        if (hasCustomLeftItem) {
            // 已经自定义了left item,就不要再添加了
            return;
        }
        
        UIButton *btnLeft = [[UIButton alloc] init];
        
        btnLeft.exclusiveTouch = YES;
        btnLeft.frame = CGRectMake(0, 0, 40, 30);
        
        if ([viewController respondsToSelector:@selector(onCustomBackItemClicked:)]) {
            [btnLeft addTarget:viewController
                        action:@selector(onCustomBackItemClicked:)
              forControlEvents:UIControlEventTouchUpInside];
        } else {
            
            [btnLeft addTarget:self
                        action:@selector(onCustomBackItemClicked:)
              forControlEvents:UIControlEventTouchUpInside];
        }
        
        [btnLeft setImageEdgeInsets:UIEdgeInsetsMake(0, -14.5, 0, +14.5)];
        [btnLeft setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];

        UIBarButtonItem* picActionBtn =  [[UIBarButtonItem alloc] initWithCustomView:btnLeft];
        
        viewController.navigationItem.leftBarButtonItem =  picActionBtn;
    }
}

- (void)onCustomBackItemClicked:(UIButton *)customItem {
    [self popViewControllerAnimated:YES];
}

+ (UIImage*)createImageWithColor:(UIColor*) color {
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
