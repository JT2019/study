//
//  CarStateViewController.m
//  JiuTian01
//
//  Created by Limy on 2018/12/20.
//  Copyright © 2018年 Limy. All rights reserved.
//

#import "CarStateViewController.h"
#import "CarStateTableViewCell.h"
@interface CarStateViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UILabel *Date;
@property(nonatomic,strong)UILabel *userName;

@end

@implementation CarStateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createView];
}
-(void)createView{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width - ScaleWidth6(684), ScaleHeight6(32))];
    label.text = @"车辆状态";
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
    UIView *foot = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width,ScaleHeight6(540) )];
    foot.backgroundColor=whriteColor;
    [self.view addSubview:foot];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"提交"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(comitbtn) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(ScaleWidth6(40), ScaleHeight6(460),foot.bounds.size.width-ScaleWidth6(80), ScaleHeight6(80));
    [foot addSubview:btn];
    return  foot;
}
-(void)comitbtn{}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *head= [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth,  ScaleHeight6(68))];
    head.backgroundColor = whriteColor;
    [self.view addSubview:head];
    UIView *border = [[UIView alloc]initWithFrame:CGRectMake(0,ScaleHeight6(67), ScreenWidth, ScaleHeight6(1))];
    border.backgroundColor = [Tools colorWithHexString:@"#b1b1b1"];
    [head addSubview:border];
    
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(ScaleWidth6(40), ScaleHeight6(22), ScaleWidth6(200), ScaleHeight6(22))];
    title.textColor=[Tools colorWithHexString:@"#4a4a4a"];
    title.text=@"请确认好随车附件";
    title.font = [UIFont systemFontOfSize:ScaleWidth6(22)];
    [head addSubview:title];
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
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *arr= @[@"车辆状态",@"防护用品"];
    CarStateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"123"];
        cell =[[CarStateTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"123"];
        cell.selectionStyle =UITableViewCellSelectionStyleNone;
        cell.timg.image = [UIImage imageNamed:arr[indexPath.row]];
    cell.type.text=arr[indexPath.row];
    [cell.swicth setImage:[UIImage imageNamed:@"01"] forState:UIControlStateNormal];
    [cell.swicth setImage:[UIImage imageNamed:@"02"] forState:UIControlStateSelected];
    [cell.swicth addTarget:self action:@selector(swicthClick:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}
-(void)swicthClick:(UIButton*)btn{
    btn.selected=!(btn.selected);
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return ScaleHeight6(68);
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return ScaleHeight6(100);
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
