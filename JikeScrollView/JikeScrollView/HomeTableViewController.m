//
//  HomeTableViewController.m
//  JiKeScrollView
//
//  Created by 李龙 on 16/11/24.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import "HomeTableViewController.h"
#import "JiKeScrollViewVC.h"
#import "JiKeScrollImageViewVC.h"
#import "JiKeScrollLabelVC.h"

@interface HomeTableViewController ()

@property (nonatomic,strong) NSArray *titleArray;
@property (nonatomic,strong) NSArray *pushVCNameArray;

@end

@implementation HomeTableViewController

static NSString *cellFlag= @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
 
    _titleArray = [NSArray arrayWithObjects:@"即刻首页滚动效果",@"JikeImageView滚动效果",@"JikeScrollLabel滚动效果", nil];
    _pushVCNameArray = [NSArray arrayWithObjects:@"JiKeScrollViewVC",@"JiKeScrollImageViewVC",@"JiKeScrollLabelVC", nil];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellFlag];
    self.tableView.tableFooterView = [UIView new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellFlag forIndexPath:indexPath];
    
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.textLabel.text = [_titleArray[indexPath.row] stringByAppendingString:@" - 手势返回"];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self pushToVC:_pushVCNameArray[indexPath.row]];
}


- (void)pushToVC:(NSString *)vcName{
    Class someClass = NSClassFromString(vcName);
    id obj = [[someClass alloc] init];
    [self.navigationController pushViewController:obj animated:YES];
}


@end

