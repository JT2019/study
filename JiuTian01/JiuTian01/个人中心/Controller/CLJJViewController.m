//
//  CLJJViewController.m
//  JiuTian01
//
//  Created by Limy on 2018/12/24.
//  Copyright © 2018年 Limy. All rights reserved.
//

#import "CLJJViewController.h"
#import "JCSQViewController.h"
#import "SQJCViewController.h"
@interface CLJJViewController ()
@property(nonatomic,strong)UILabel *number;
@property(nonatomic,strong)UILabel *Date;
@property(nonatomic,strong)UILabel *userName;

@end

@implementation CLJJViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createView];
}
-(void)createView{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width - ScaleWidth6(684), ScaleHeight6(32))];
    label.text = @"车辆交接";
    label.font = [UIFont boldSystemFontOfSize:ScaleWidth6(32)];
    label.textColor = [UIColor whiteColor];
    [label setTextAlignment:NSTextAlignmentCenter];
    self.navigationItem.titleView = label;
    UIView *head= [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth,  ScaleHeight6(68))];
    head.backgroundColor = whriteColor;
    [self.view addSubview:head];
    UIView *border = [[UIView alloc]initWithFrame:CGRectMake(0,ScaleHeight6(67), ScreenWidth, ScaleHeight6(1))];
    border.backgroundColor = [Tools colorWithHexString:@"#b1b1b1"];
    [head addSubview:border];
    
    _number = [[UILabel alloc]initWithFrame:CGRectMake(ScaleWidth6(40), ScaleHeight6(22), ScaleWidth6(360), ScaleHeight6(22))];
    _number.textColor=[Tools colorWithHexString:@"#4a4a4a"];
    _number.text=@"请务必谨慎选择";
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
    UIButton *btnL = [UIButton buttonWithType:UIButtonTypeCustom];
    btnL.frame= CGRectMake(ScaleWidth6(40), MaxY(border.frame) +ScaleHeight6(40), ScaleWidth6(314), ScaleHeight6(143));
    [btnL setImage:[UIImage imageNamed:@"申请交车"] forState:UIControlStateNormal];
    [btnL addTarget:self action:@selector(btnLclick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnL];
    UIButton *btnR = [UIButton buttonWithType:UIButtonTypeCustom];
    btnR.frame = CGRectMake(MaxX(btnL.frame) +ScaleWidth6(42), MaxY(border.frame) +ScaleHeight6(40), ScaleWidth6(314), ScaleHeight6(143));
    [btnR setImage:[UIImage imageNamed:@"申请接车"] forState:UIControlStateNormal];
    [btnR addTarget:self action:@selector(btnRclick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnR];
}
-(void)btnLclick{
    JCSQViewController *vc = [[JCSQViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)btnRclick{
    SQJCViewController *vc = [[SQJCViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
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
