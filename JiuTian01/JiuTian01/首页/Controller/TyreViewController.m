//
//  TyreViewController.m
//  JiuTian01
//
//  Created by Limy on 2018/12/20.
//  Copyright © 2018年 Limy. All rights reserved.
//

#import "TyreViewController.h"

@interface TyreViewController ()
@property(nonatomic,strong)UILabel *Date;
@property(nonatomic,strong)UILabel *userName;
@end

@implementation TyreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self creatView];
}
-(void)creatView{
UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width - ScaleWidth6(684), ScaleHeight6(32))];
label.text = @"轮胎状态";
label.font = [UIFont boldSystemFontOfSize:ScaleWidth6(32)];
label.textColor = [UIColor whiteColor];
[label setTextAlignment:NSTextAlignmentCenter];
self.navigationItem.titleView = label;
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(ScaleWidth6(40), ScaleHeight6(22), ScaleWidth6(200), ScaleHeight6(22))];
    title.textColor=[Tools colorWithHexString:@"#4a4a4a"];
    title.text=@"请确认好随车附件";
    title.font = [UIFont systemFontOfSize:ScaleWidth6(22)];
    [self.view addSubview:title];
    _Date = [[UILabel alloc]initWithFrame:CGRectMake(ScaleWidth6(410), ScaleHeight6(22), ScaleWidth6(175), ScaleHeight6(22))];
    _Date.textColor = [Tools colorWithHexString:@"#4a4a4a"];
    _Date.text=@"2018年12月20日";
    _Date.font = [UIFont systemFontOfSize:ScaleWidth6(22)];
    [self.view addSubview:_Date];
    _userName = [[UILabel alloc]initWithFrame:CGRectMake(MaxX(_Date.frame)+ScaleWidth6(60), ScaleHeight6(22), ScaleWidth6(100), ScaleHeight6(22))];
    _userName.textColor=[Tools colorWithHexString:@"#4a4a4a"];
    _userName.text=@"丁一一";
    _userName.font=[UIFont systemFontOfSize:ScaleWidth6(22)];
    [self.view addSubview:_userName];
    UIView *bodr=[[UIView alloc]initWithFrame:CGRectMake(ScreenWidth- ScaleWidth6(138), ScaleHeight6(12), ScaleWidth6(1), ScaleHeight6(40))];
    bodr.backgroundColor = [Tools colorWithHexString:@"#4a4a4a"];
    [self.view addSubview:bodr];
    UIView *border = [[UIView alloc]initWithFrame:CGRectMake(0, ScaleHeight6(67), ScreenWidth, ScaleHeight6(1))];
    border.backgroundColor = [Tools colorWithHexString:@"b1b1b1"];
    [self.view addSubview:border];
    UIImageView *normal = [[UIImageView alloc]initWithFrame:CGRectMake(ScaleWidth6(40), MaxY(border.frame)+ScaleHeight6(10), ScaleWidth6(30), ScaleHeight6(30))];
    normal.image = [UIImage imageNamed:@"轮胎正常"];
    [self.view addSubview:normal];
    UIImageView *damage = [[UIImageView alloc]initWithFrame:CGRectMake(ScaleWidth6(40), MaxY(normal.frame)+ScaleHeight6(10), ScaleWidth6(30), ScaleHeight6(30))];
    damage.image = [UIImage imageNamed:@"轮胎损坏"];
    [self.view addSubview:damage];
    UILabel *nor = [[UILabel alloc]initWithFrame:CGRectMake(MaxX(normal.frame)+ScaleWidth6(4), MaxY(border.frame)+ScaleHeight6(16), ScaleWidth6(100), ScaleHeight6(24))];
    nor.textColor=[Tools colorWithHexString:@"4a4a4a"];
    nor.text = @"轮胎正常";
    nor.font = [UIFont systemFontOfSize:ScaleWidth6(24)];
    [self.view addSubview:nor];
    UILabel *dge = [[UILabel alloc]initWithFrame:CGRectMake(MaxX(damage.frame)+ScaleWidth6(4), MaxY(nor.frame)+ScaleHeight6(18), ScaleWidth6(100), ScaleHeight6(24))];
    dge.textColor=[Tools colorWithHexString:@"4a4a4a"];
    dge.text=@"轮胎损坏";
    dge.font = [UIFont systemFontOfSize:ScaleWidth6(24)];
    [self.view addSubview:dge];
    UIImageView *vehicleModel = [[UIImageView alloc]initWithFrame:CGRectMake(ScaleWidth6(220), MaxY(border.frame)+ScaleHeight6(90), ScaleWidth6(310), ScaleHeight6(742))];
    vehicleModel.image = [UIImage imageNamed:@"车型"];
    [self.view addSubview:vehicleModel];
    UILabel *lL =[[UILabel alloc] initWithFrame:CGRectMake(MinX(vehicleModel.frame) -ScaleWidth6(4) -ScaleWidth6(60), MinY(vehicleModel.frame)+ScaleHeight6(10), ScaleWidth6(60), ScaleHeight6(20))];
    lL.text =@"L";
    lL.textColor =grayWordColor;
    lL.font =[UIFont systemFontOfSize:ScaleHeight6(20)];
    lL.textAlignment =NSTextAlignmentCenter;
    [self.view addSubview:lL];
    
    UILabel *rL =[[UILabel alloc] initWithFrame:CGRectMake(MaxX(vehicleModel.frame) +ScaleWidth6(4) , MinY(vehicleModel.frame)+ScaleHeight6(10), ScaleWidth6(60), ScaleHeight6(20))];
    rL.text =@"R";
    rL.textColor =grayWordColor;
    rL.font =[UIFont systemFontOfSize:ScaleHeight6(20)];
    rL.textAlignment =NSTextAlignmentCenter;
    [self.view addSubview:rL];
    UIButton *btnL = [UIButton buttonWithType:UIButtonTypeCustom];
    btnL.frame = CGRectMake(ScaleWidth6(156), MaxY(lL.frame)+ScaleHeight6(20), ScaleWidth6(60), ScaleHeight6(100));
    [btnL setImage:[UIImage imageNamed:@"正常轮胎"] forState:UIControlStateNormal];
    [btnL setImage:[UIImage imageNamed:@"损坏轮胎"] forState:UIControlStateSelected];
    [btnL addTarget:self action:@selector(btnLClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnL];
    
    UIButton *btnR = [[UIButton alloc]initWithFrame:CGRectMake(MaxX(vehicleModel.frame)+ScaleWidth6(4), MaxY(rL.frame)+ScaleHeight6(20), ScaleWidth6(60), ScaleHeight6(100))];
    [btnR setImage:[UIImage imageNamed:@"正常轮胎"] forState:UIControlStateNormal];
    [btnR setImage:[UIImage imageNamed:@"损坏轮胎"] forState:UIControlStateSelected];
    [btnR addTarget:self action:@selector(btnRClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnR];
    
    for (int i = 0; i<4; i++) {
        UIButton *btnnL = [UIButton buttonWithType:UIButtonTypeCustom];
        btnnL.frame = CGRectMake(ScaleWidth6(156)+ScaleWidth6(69)*(i%2), MaxY(btnR.frame)+ScaleHeight6(20)+ScaleHeight6(104)*(i/2), ScaleWidth6(60), ScaleHeight6(100));
        [btnnL setImage:[UIImage imageNamed:@"正常轮胎"] forState:UIControlStateNormal];
        [btnnL setImage:[UIImage imageNamed:@"损坏轮胎"] forState:UIControlStateSelected];
        [btnnL addTarget:self action:@selector(btnnLClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btnnL];
    }
    
    for (int i =0; i<6; i++) {
        UIButton *btnnnL = [UIButton buttonWithType:UIButtonTypeCustom];
        btnnnL.frame = CGRectMake(ScaleWidth6(156)+ScaleWidth6(69)*(i%2), MaxY(btnR.frame)+ScaleHeight6(224)+ScaleHeight6(48)+ScaleHeight6(104)*(i/2), ScaleWidth6(60), ScaleHeight6(100));
        [btnnnL setImage:[UIImage imageNamed:@"正常轮胎"] forState:UIControlStateNormal];
        [btnnnL setImage:[UIImage imageNamed:@"损坏轮胎"] forState:UIControlStateSelected];
        [btnnnL addTarget:self action:@selector(btnnnLClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btnnnL];
    }
    for (int i = 0; i<4; i++) {
        UIButton *btnnR = [UIButton buttonWithType:UIButtonTypeCustom];
        btnnR.frame = CGRectMake(MaxX(btnL.frame)+ScaleWidth6(249)+ScaleWidth6(68)*(i%2), MaxY(btnR.frame)+ScaleHeight6(20)+ScaleHeight6(104)*(i/2), ScaleWidth6(60), ScaleHeight6(100));
        [btnnR setImage:[UIImage imageNamed:@"正常轮胎"] forState:UIControlStateNormal];
        [btnnR setImage:[UIImage imageNamed:@"损坏轮胎"] forState:UIControlStateSelected];
        [btnnR addTarget:self action:@selector(btnnRClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btnnR];
    }
    for (int i =0; i<6; i++) {
        UIButton *btnnnR = [UIButton buttonWithType:UIButtonTypeCustom];
        btnnnR.frame = CGRectMake(MaxX(btnL.frame)+ScaleWidth6(249)+ScaleWidth6(68)*(i%2), MaxY(btnR.frame)+ScaleHeight6(224)+ScaleHeight6(48)+ScaleHeight6(104)*(i/2), ScaleWidth6(60), ScaleHeight6(100));
        [btnnnR setImage:[UIImage imageNamed:@"正常轮胎"] forState:UIControlStateNormal];
        [btnnnR setImage:[UIImage imageNamed:@"损坏轮胎"] forState:UIControlStateSelected];
        [btnnnR addTarget:self action:@selector(btnnnRClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btnnnR];
    }
    UIButton *btnFoot = [UIButton buttonWithType:UIButtonTypeCustom];
    btnFoot.frame = CGRectMake(ScaleWidth6(325), MaxY(vehicleModel.frame)+ScaleHeight6(4), ScaleWidth6(100), ScaleHeight6(60));
    [btnFoot setImage:[UIImage imageNamed:@"备胎好"] forState:UIControlStateNormal];
    [btnFoot setImage:[UIImage imageNamed:@"备胎坏"] forState:UIControlStateSelected];
    [btnFoot addTarget:self action:@selector(btnFootClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnFoot];
    UIButton *commit = [UIButton buttonWithType:UIButtonTypeSystem];
    commit.frame=CGRectMake(ScaleWidth6(40), MaxY(btnFoot.frame)+ScaleHeight6(80), ScreenWidth-ScaleWidth6(80), ScaleHeight6(80));
    [commit setBackgroundImage:[UIImage imageNamed:@"提交"] forState:UIControlStateNormal];
    [self.view addSubview:commit];
    
}
-(void)btnFootClick:(UIButton*)btn{
    btn.selected =!(btn.selected);
}
-(void)btnnnRClick:(UIButton*)btn{
    btn.selected =!(btn.selected);
}
-(void)btnnRClick:(UIButton*)btn{
    btn.selected =!(btn.selected);
}
-(void)btnnnLClick:(UIButton*)btn{
    btn.selected =!(btn.selected);
}
-(void)btnnLClick:(UIButton*)btn{
    btn.selected =!(btn.selected);
}
-(void)btnLClick:(UIButton*)btn{
    btn.selected =!(btn.selected);
}
-(void)btnRClick:(UIButton*)btn{
    btn.selected =!(btn.selected);
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
