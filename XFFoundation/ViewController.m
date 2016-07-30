//
//  ViewController.m
//  XFFoundation
//
//  Created by wangxuefeng on 16/6/8.
//  Copyright © 2016年 wangxuefeng. All rights reserved.
//

#import "ViewController.h"
#import "XFRequest.h"
#import "AFHTTPSessionManager.h"
#import "XFInfoView.h"
#import "XFLoadingView.h"
#import "CTQMainMemberCell.h"
#import "CTQMember.h"
#import "YYKit.h"
#import "CTQMemberView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    
    NSDictionary *dict = @{@"memberId":@84949,@"introduce":@"沈鹏，水滴互助创始人、CEO，美团网第十号员工、美团外卖负责人，曾负责美团外卖全国业务。",@"memberName":@"沈鹏",@"userportrait":@"https://cdn.itjuzi.com/images/3c3d99e322eb87ac8ae2c667dbdb8213.jpg?imageView2/0/w/58/q/100",@"position":@"CEO"};
    
    NSMutableArray *temp = [NSMutableArray array];
    
    for (int i=0;i<1;i++) {
        CTQMember *member = [CTQMember modelWithDictionary:dict];
        
        [temp addObject:member];
    }
    
    self.dataSource = temp;
}

#pragma mark - UITableViewDelegate & UITableViewSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CTQMainMemberCell *cell = [CTQMainMemberCell cellForTableView:tableView];
    
//    [cell configCellWithData:self.dataSource];
  
    CTQMemberView *view = [[CTQMemberView alloc] initWithMember:self.dataSource];
    
    view.size = view.intrinsicContentSize;
    view.center = cell.contentView.center;
    
    [cell.contentView addSubview:view];
    
    [XFLineHelper addBottomLineToView:cell];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [CTQMainMemberCell cellHeight];
}

- (void)upload:(NSString *)uploadUrl {
    
    UIImage *image = [UIImage imageNamed:@"red_public_welfare"];
    
    NSData *imageData = UIImagePNGRepresentation(image);
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager setRequestSerializer:[AFJSONRequestSerializer serializer]];
    
    //    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    //    [manager.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/plain",@"text/html", nil];
    
    [manager POST:uploadUrl parameters:@{@"111":@"2222"} constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        [formData appendPartWithFileData:imageData name:@"Filedata" fileName:@"xxxx.png" mimeType:@"image/png"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

@end
