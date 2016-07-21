//
//  XFViewController.m
//  XFFoundation
//
//  Created by wangxuefeng on 16/6/8.
//  Copyright © 2016年 wangxuefeng. All rights reserved.
//

#import "XFViewController.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import "XFEmptyView.h"
#import "XFErrorView.h"
#import "XFLoadingView.h"

@interface XFViewController () <XFErrorViewDelegate> {
    // 是否为第一次加载数据
    BOOL _isFisrtLoading;
}

@property (strong, nonatomic) XFErrorView   *errorView;
@property (weak  , nonatomic) UIView        *loadingSuperiew;
@property (strong, nonatomic) MBProgressHUD *hud;
@property (strong, nonatomic) XFLoadingView *loadingView;

@end

@implementation XFViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        
        // default is YES
        _shouldShowErrorView = YES;
        _dataType = XFDataTypeRequest;
        _isFisrtLoading = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [SVProgressHUD setMinimumDismissTimeInterval:1.5];
    [SVProgressHUD setInfoImage:nil];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(requestFailedNeedLogin) name:@"kReuqestNeedLogin" object:nil];
}

- (void)requestFailedNeedLogin {
    [self closeLoadingView];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    [self closeLoadingView];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"kReuqestNeedLogin" object:nil];
}

#pragma mark - event response

- (void)retryAfterRequestFailed {
    [self closeErrorView];
    [self.mainQueue execute];
}

- (void)recoveryFromError:(XFErrorView *)errorView {
    [self retryAfterRequestFailed];
}

- (void)setErrorMessage:(NSString *)errorMessage {
    self.errorView.info = errorMessage;
}

- (void)showErrorView {
    if (!self.errorView.superview) {
        [self.view addSubview:self.errorView];
    }
}

- (void)closeErrorView {
    if (self.errorView.superview) {
        [self.errorView removeFromSuperview];
    }
}

- (void)showLoadingView {
    if (_isHUDShowing == YES) {
        return;
    } else {
        if (_isFisrtLoading) {
            [self.loadingView showAtView:self.view];
        } else {
            UIWindow *window = [[[UIApplication sharedApplication] windows] lastObject];
            
            if (![_hud.superview isEqual:window]) {
                _hud = nil;
            }
            self.hud.backgroundColor = [UIColor clearColor];
            [self.hud show:YES];
            
        }
        _isHUDShowing = YES;
    }
}

- (void)closeLoadingView {
    
    if (_hud.superview) {
        [_hud hide:YES];
    }
    
    if (self.loadingView.superview) {
        [self.loadingView dismiss];
    }
    
    _isHUDShowing = NO;
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

- (void)showInfoAtWindowCenterWithStatus:(NSString *)status {
    UIWindow *window = [[[UIApplication sharedApplication] windows] lastObject];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    
    hud.userInteractionEnabled = NO;
    hud.mode = MBProgressHUDModeText;
    hud.labelText = status;
    hud.margin = 10.f;
    hud.removeFromSuperViewOnHide = YES;
    
    [hud hide:YES afterDelay:1.5];
}

- (void)showCenterInfoWithStatus:(NSString *)status {
    UIWindow *window = [[[UIApplication sharedApplication] windows] lastObject];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    
    hud.userInteractionEnabled = NO;
    hud.mode = MBProgressHUDModeText;
    hud.labelText = status;
    hud.margin = 10.f;
    hud.removeFromSuperViewOnHide = YES;
    
    [hud hide:YES afterDelay:1.5];
}

#pragma mark - request queue

- (void)mainRequestStart {
    [self closeLoadingView];
    
    switch (self.hudType) {
        case XFHUDTypeDefault: {
            [self showLoadingView];
            break;
        }
        case XFHUDTypeNone: {
            
            break;
        }
        case XFHUDTypeProgress: {
            [self showLoadingView];
            break;
        }
        case XFHUDTypeNetIndictor: {
            
            break;
        }
    }
}

- (void)mainRequestFinish {
    [self closeLoadingView];
    _isFisrtLoading = NO;
}

- (NSNumber *)mainRequestFailure {
    _isFisrtLoading = NO;
    
    [self closeLoadingView];
    [self showErrorView];
    
    return @(self.shouldShowErrorView);
}

- (void)mainRequestSuccess {
    
}

#pragma mark - getter & setter

- (XFLoadingView *)loadingView {
    if (_loadingView == nil) {
        _loadingView = [XFLoadingView loadingView];
    }
    return _loadingView;
}

- (XFErrorView *)errorView {
    if (_errorView == nil) {
        _errorView = [[XFErrorView alloc] initWithFrame:self.view.bounds];
        
        _errorView.imageName = @"img_mr_nowifi";
        _errorView.delegate = self;
    }
    return _errorView;
}

- (MBProgressHUD *)hud {
    if (_hud == nil) {
        UIWindow *window = [[[UIApplication sharedApplication] windows] lastObject];
        
        _hud = [[MBProgressHUD alloc] initWithWindow:window];
        
        _hud.userInteractionEnabled = NO;
        _hud.margin = 10.f;
        _hud.removeFromSuperViewOnHide = YES;
        _hud.alpha = 0;
        
        [window addSubview:_hud];
    }

    return _hud;
}

-(XFRequestQueue *)mainQueue {
    if (_mainQueue == nil) {
        _mainQueue = [[XFRequestQueue alloc] initWithName:@"mainQueue"];
        
        _mainQueue.target = self;
        _mainQueue.requestStartSelector   = @selector(mainRequestStart);
        _mainQueue.requestSuccessSelector = @selector(mainRequestSuccess);
        _mainQueue.requestFinishSelector  = @selector(mainRequestFinish);
        _mainQueue.requestFailureSelector = @selector(mainRequestFailure);
    }
    return _mainQueue;
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


@end