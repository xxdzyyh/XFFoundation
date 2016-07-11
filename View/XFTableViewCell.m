//
//  XFTableViewCell.m
//  CTQProject
//
//  Created by wangxuefeng on 16/5/27.
//  Copyright © 2016年 code. All rights reserved.
//

#import "XFTableViewCell.h"
#import "MBProgressHUD.h"

@implementation XFTableViewCell

+ (NSString *)identifier {
    return NSStringFromClass([self class]);
}

+ (NSInteger)cellHeight {
    return 50;
}

- (void)configCellWithData:(id)item {
    self.data = item;
}

+ (id)cellForTableView:(UITableView *)tableView {
    NSString *cellIdentifer = [self identifier];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    
    if (cell == nil) {
        NSBundle *classBundle = [NSBundle bundleForClass:self];
        // 虽然nib名字可以与cell类名不同，但是貌似没有理由不同
        NSString * path = [classBundle pathForResource:NSStringFromClass(self) ofType:@"nib"];
        
        if (path.length > 0) {
            UINib *nib = [UINib nibWithNibName:NSStringFromClass(self) bundle:classBundle];
            
            //注册以后，dequeueReusableCellWithIdentifier返回必定不为空，只会执行一次
            [tableView registerNib:nib forCellReuseIdentifier:cellIdentifer];
            
            NSArray *nibObjects = [nib instantiateWithOwner:nil options:nil];
            
            NSAssert2(([nibObjects count] > 0) &&
                      [[nibObjects firstObject] isKindOfClass:self], @"Nib '%@' does not appert a valid %@", NSStringFromClass(self), NSStringFromClass(self));
            
            cell = [nibObjects firstObject];
            cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
        } else {
            
            NSAssert1(0, @"Nib with name : %@ not found",NSStringFromClass(self));
            
            return nil;
        }
    }
    
    return cell;
}

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIImage *)originImage:(UIImage *)image scaleToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);  //size 为CGSize类型，即你所需要的图片尺寸
    
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return scaledImage;   //返回的就是已经改变的图片
}

- (void)showInfoWithStatus:(NSString *)status {
    float h = [UIScreen mainScreen].bounds.size.height;
    
    UIWindow *window = [[[UIApplication sharedApplication] windows] lastObject];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    
    hud.userInteractionEnabled = NO;
    hud.mode = MBProgressHUDModeText;
    hud.labelText = status;
    hud.margin = 10.f;
    hud.yOffset = h/2 - 100;
    hud.removeFromSuperViewOnHide = YES;
    
    [hud hide:YES afterDelay:1.5];
}

@end
