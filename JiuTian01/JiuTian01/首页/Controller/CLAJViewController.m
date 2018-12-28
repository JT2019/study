//
//  CLAJViewController.m
//  JiuTian01
//
//  Created by Limy on 2018/12/20.
//  Copyright © 2018年 Limy. All rights reserved.
//

#import "CLAJViewController.h"
#import "CLAJTableViewCell.h"
#import "CarStateViewController.h"
#import "TyreViewController.h"
#import "IOVViewController.h"
@interface CLAJViewController()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UILabel *number;
@property(nonatomic,strong)UILabel *Date;
@property(nonatomic,strong)UILabel *userName;
@end

@implementation CLAJViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createView];
}
-(void)createView{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width - ScaleWidth6(684), ScaleHeight6(32))];
    label.text = @"车辆安检";
    label.font = [UIFont boldSystemFontOfSize:ScaleWidth6(32)];
    label.textColor = [UIColor whiteColor];
    [label setTextAlignment:NSTextAlignmentCenter];
    self.navigationItem.titleView = label;
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    _tableView.delegate = self;
    _tableView.dataSource=self;
    _tableView.tableFooterView =[[UIView alloc] initWithFrame:CGRectZero];
    _tableView.separatorStyle = UITableViewCellEditingStyleNone;
    [self.view addSubview:_tableView];
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *foot = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width,ScaleHeight6(240) )];
    foot.backgroundColor=whriteColor;
    [self.view addSubview:foot];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"提交"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(comitbtn) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(ScaleWidth6(40), ScaleHeight6(160),foot.bounds.size.width-ScaleWidth6(80), ScaleHeight6(80));
    [foot addSubview:btn];
    return  foot;
}
-(void)comitbtn{
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *head= [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth,  ScaleHeight6(68))];
    head.backgroundColor = whriteColor;
    [self.view addSubview:head];
    UIView *border = [[UIView alloc]initWithFrame:CGRectMake(0,ScaleHeight6(67), ScreenWidth, ScaleHeight6(1))];
    border.backgroundColor = [Tools colorWithHexString:@"#b1b1b1"];
    [head addSubview:border];
    
    _number = [[UILabel alloc]initWithFrame:CGRectMake(ScaleWidth6(40), ScaleHeight6(22), ScaleWidth6(360), ScaleHeight6(22))];
    _number.textColor=[Tools colorWithHexString:@"#4a4a4a"];
    _number.text=@"车牌号码：吉B 88888";
    _number.font = [UIFont systemFontOfSize:ScaleWidth6(22)];
    [head addSubview:_number];
    _Date = [[UILabel alloc]initWithFrame:CGRectMake(ScaleWidth6(410), ScaleHeight6(22), ScaleWidth6(175), ScaleHeight6(22))];
    _Date.textColor = [Tools colorWithHexString:@"#4a4a4a"];
    _Date.text=@"2018年12月20日";
    _Date.font = [UIFont systemFontOfSize:ScaleWidth6(22)];
    [head addSubview:_Date];
    _userName = [[UILabel alloc]initWithFrame:CGRectMake(MaxX(_Date.frame)+ScaleWidth6(60), ScaleHeight6(22), ScaleWidth6(100), ScaleHeight6(22))];
    _userName.textColor=[Tools colorWithHexString:@"#4a4a4a"];
    _userName.text=@"丁一一";
    _userName.font=[UIFont systemFontOfSize:ScaleWidth6(22)];
    [head addSubview:_userName];
    UIView *bodr=[[UIView alloc]initWithFrame:CGRectMake(ScreenWidth- ScaleWidth6(138), ScaleHeight6(12), ScaleWidth6(1), ScaleHeight6(40))];
    bodr.backgroundColor = [Tools colorWithHexString:@"#b1b1b1"];
    [head addSubview:bodr];
    return head;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return ScaleHeight6(68);
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return ScaleHeight6(100);
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
        NSArray *arr = @[@"车辆状态",@"轮胎状态",@"随车附件",@"标志标示",@"防护用品"];
    CLAJTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"123"];
    if (!cell) {
        cell =[[CLAJTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"123"];
        cell.timg.image = [UIImage imageNamed:arr[indexPath.row]];
    cell.state.text = arr[indexPath.row];
        cell.selectionStyle =UITableViewCellSelectionStyleNone;
    cell.comit.text = @"已提交";
    cell.qualified.text = @"不合格";
    cell.qualified.textColor= [Tools colorWithHexString:@"#ff9900"];
        
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        CarStateViewController *vc = [[CarStateViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.row==1) {
        TyreViewController *vc = [[TyreViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if(indexPath.row==2){
        IOVViewController *vc = [[IOVViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}
@end
