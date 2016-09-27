//
//  XFButton.h
//  CTQProject
//
//  Created by wangxuefeng on 16/9/22.
//  Copyright © 2016年 code. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,XFButtonImagePostion) {
    XFButtonImagePostionTop,/*< 图片在上面 */
    XFButtonImagePostionLeft,/*< 图片在左边 */
    XFButtonImagePostionRight,/*< 图片在右边 */
    XFButtonImagePostionBottom/*< 图片在下面 */
};

@interface XFButton : UIButton

// 文字和图片之间的间距
@property (assign, nonatomic) float padding;

@property (assign, nonatomic) XFButtonImagePostion imagePostion;

@end
