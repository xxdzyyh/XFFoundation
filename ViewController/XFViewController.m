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


@interface XFErrorView : UIControl

@property (strong, nonatomic) UIImage *errorImage;
@property (strong, nonatomic) UILabel *lblMessage;

@end

@implementation XFErrorView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        self.backgroundColor = [UIColor whiteColor];
        
        _lblMessage = [[UILabel alloc] initWithFrame:self.bounds];

        _lblMessage.textAlignment = NSTextAlignmentCenter;
        _lblMessage.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        
        [self addSubview:_lblMessage];
    }
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    
    self.frame = [super bounds];
}
@end

@interface XFViewController ()

@property (strong, nonatomic) XFErrorView * errorView;

@property (weak  , nonatomic) UIView *loadingSuperiew;

@property (strong, nonatomic) MBProgressHUD *hud;

@end

@implementation XFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    float h = [UIScreen mainScreen].bounds.size.height;
    
    [SVProgressHUD setMinimumDismissTimeInterval:1.5];
    [SVProgressHUD setInfoImage:nil];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillAppear) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillDisappear) name:UIKeyboardWillHideNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    
    [self closeLoadingView];
}

- (void)keyboardWillAppear {
    _keyboardShowing = YES;
}

- (void)keyboardWillDisappear {
    _keyboardShowing = NO;
}

#pragma mark - event response

- (void)retryAfterRequestFailed {
    [self.mainQueue execute];
}

- (void)setErrorMessage:(NSString *)errorMessage {
    self.errorView.lblMessage.text = errorMessage;
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
    _hud = nil;
    [self.hud show:YES];
}

- (void)closeLoadingView {

    [_hud hide:YES];
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

#pragma mark - request queue

- (void)mainRequestStart {
    [self closeLoadingView];
    [self showLoadingView];
}

- (void)mainRequestFinish {
    [self closeLoadingView];
}

- (NSNumber *)mainRequestFailure {
    [self closeLoadingView];
    [self showErrorView];
    
    return @1;
}

- (void)mainRequestSuccess {
    
}

#pragma mark - getter & setter

- (XFErrorView *)errorView {
    if (_errorView == nil) {
        _errorView = [[XFErrorView alloc] initWithFrame:self.view.bounds];
        
        [_errorView addTarget:self action:@selector(retryAfterRequestFailed) forControlEvents:UIControlEventTouchUpInside];
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