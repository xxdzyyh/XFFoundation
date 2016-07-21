//
//  XFRequest.m
//  CTQProject
//
//  Created by wangxuefeng on 16/6/21.
//  Copyright © 2016年 code. All rights reserved.
//

#import "XFRequest.h"
#import <AFNetworking/AFNetworking.h>

@interface XFRequest ()

@property (strong, nonatomic) NSMutableDictionary *paramters;

@end

@implementation XFRequest

#pragma mark - life cycle

- (instancetype)initWithPath:(NSString *)path {
    self = [super init];
    if (self) {
        _path = path;
    }
    return self;
}

- (instancetype)initWithPath:(NSString *)path finish:(XFRequestBlock)finishBlock {
    self = [super init];
    if (self) {
        _path = path;
        _finishBlock = finishBlock;
    }
    return self;
}

- (void)dealloc {
    
}

- (void)start {
    [self execute:nil];
}

#pragma mark - setter & getter

- (NSMutableDictionary *)params {
    return _paramters;
}

- (NSMutableDictionary *)paramters {
    if (_paramters == nil) {
        _paramters = [NSMutableDictionary dictionary];
    }
    return _paramters;
}

- (void)cancel {
    _cancel = YES;
}

#pragma mark - subclass should override

+ (NSString *)domain {
    return @"http://v.juhe.cn/xhzd/query";
}

- (void)execute:(void (^)(XFRequest *, BOOL))completion {
    
    NSString *path = [self.path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSString *url = [NSString stringWithFormat:@"%@%@",[[self class] domain],path];
    
    NSMutableDictionary *dict = self.params;
    // 约定统一使用 POST 请求
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.requestSerializer  = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"application/json"];
    manager.requestSerializer.timeoutInterval = 60;
    
    [manager POST:url parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        id result = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:NULL];
        
        if (self.finishBlock) {
            self.finishBlock(self,result);
        }
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(request:finishedWithResult:)]) {
            [self.delegate request:self finishedWithResult:result];
        }
        // 通知 requestQueue
        if (completion) {
            completion(self,YES);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSDictionary *dict = @{ @"info" : [error.userInfo objectForKey:NSLocalizedDescriptionKey],
                                @"status" : @(error.code) };
        if (self.finishBlock) {
            self.finishBlock(self,dict);
        }
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(request:finishedWithResult:)]) {
            [self.delegate request:self finishedWithResult:dict];
        }
        
        // 通知 requestQueue
        if (completion) {
            completion(self,NO);
        }
    }];
}

#pragma mark - subclass should not override

-(void)addParameter:(NSString *)name value:(id)value {
    if (name.length == 0 || value == nil) {
        return;
    }
    
    if ([value isKindOfClass:[NSString class]]) {
        
        NSString *va = (NSString *)value;
        
        if (va.length == 0) {
            return;
        }
    }
    [self.paramters setObject:value forKey:name];
}

- (void)addParameters:(NSDictionary *)parameters {
    for (NSString *obj in parameters.allKeys) {
        
        id value = [parameters objectForKey:obj];
        
        if ([value isKindOfClass:[NSString class]]) {
            
            NSString *va = (NSString *)value;
            
            if (va.length == 0) {
                continue;
            }
        }
        [self.paramters setObject:value forKey:obj];
    }
}

@end
