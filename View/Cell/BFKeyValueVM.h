//
//  BFKeyValueVM.h
//  BFMoney
//
//  Created by xiaoniu on 2019/7/30.
//  Copyright © 2019 com.bluefin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,BFKeyValueCellType) {
    BFKeyValueCellTypeDefault,
    BFKeyValueCellTypeInput,
    BFKeyValueCellTypeArrow,
    BFKeyValueCellTypeSegment,
    BFKeyValueCellTypeSwitch,
    BFKeyValueCellTypeEmpty
};

NS_ASSUME_NONNULL_BEGIN

@interface BFKeyValueVM : NSObject

@property (nonatomic, copy) NSString *key;
@property (nonatomic, copy) NSString *value;

// 是否允许值为空
@property (nonatomic, assign) BOOL allowEmpty;

@property (nonatomic, copy) NSString *placeholder;
@property (nonatomic, copy) NSString *unit;
@property (nonatomic, strong) UIView *customUnitView;
@property (nonatomic, assign) BFKeyValueCellType cellType;

// BFKeyValueCellTypeSwitch
@property (nonatomic, assign) BOOL isOn;

// 输入最大长度
@property (nonatomic, assign) NSInteger maxLength;

// 如果设置了textShouldChange,maxLength将不生效
@property (nonatomic, strong) BOOL(^textShouldChange)(NSString *currentString,NSString *tobeString);

// 输入键盘类型
@property (nonatomic, assign) UIKeyboardType keyboardType;

@end

NS_ASSUME_NONNULL_END
