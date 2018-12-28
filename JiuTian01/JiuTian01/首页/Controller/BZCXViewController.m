//
//  BZCXViewController.m
//  JiuTian01
//
//  Created by Limy on 2018/12/21.
//  Copyright © 2018年 Limy. All rights reserved.
//

#import "BZCXViewController.h"
#import "BZCXTableViewCell.h"

@interface BZCXViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UILabel *Date;
@property(nonatomic,strong)UILabel *userName;
@end

@implementation BZCXViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createView];
}
-(void)createView{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width - ScaleWidth6(684), ScaleHeight6(32))];
    label.text = @"报账查询";
    label.font = [UIFont boldSystemFontOfSize:ScaleWidth6(32)];
    label.textColor = [UIColor whiteColor];
    [label setTextAlignment:NSTextAlignmentCenter];
    self.navigationItem.titleView = label;
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)style:UITableViewStylePlain];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    
    _tableView.tableFooterView =[[UIView alloc] initWithFrame:CGRectZero];
    _tableView.separatorStyle = UITableViewCellEditingStyleNone;
    [self.view addSubview:_tableView];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return ScaleHeight6(270);
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *arr = @[@"审核通过",@"审核未通过",@"审核中"];
    NSArray *textarr=@[@"维修保养",@"底道补助",@"维修保养"];
    BZCXTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"123"];
    if (!cell) {
    cell =[[BZCXTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"123"];
    cell.selectionStyle =UITableViewCellSelectionStyleNone;
    cell.Date.text=@"2018年12月24日";
    cell.userName.text = @"丁一一";
    cell.text.text = textarr[indexPath.row];
    cell.img.image = [UIImage imageNamed:@"照片"];
    cell.colorImg.image=[UIImage imageNamed:arr[indexPath.row]];
    }
        return cell;
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
