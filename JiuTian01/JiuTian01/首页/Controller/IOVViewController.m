//
//  IOVViewController.m
//  JiuTian01
//
//  Created by Limy on 2018/12/21.
//  Copyright © 2018年 Limy. All rights reserved.
//

#import "IOVViewController.h"
#import "PPNumberButton.h"
@interface IOVViewController ()
@property(nonatomic,strong)UILabel *Date;
@property(nonatomic,strong)UILabel *userName;


@end

@implementation IOVViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createView];
    // Do any additional setup after loading the view.
}
-(void)createView{
UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width - ScaleWidth6(684), ScaleHeight6(32))];
label.text = @"随车附件";
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
    NSArray *textArr=@[@"千斤顶",@"烟灰缸",@"扳手",@"工作灯",@"鸭嘴式钳子"];
    NSArray *arr = @[@"1",@"1",@"1",@"6",@"1"];
    for (int i = 0 ; i<5; i++) {
        UIView *cell = [[UIView alloc]initWithFrame:CGRectMake(0, MaxY(border.frame)+ScaleHeight6(100)*i, ScreenWidth, ScaleHeight6(100))];
        cell.backgroundColor=whriteColor;
        [self.view addSubview:cell];
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(ScaleWidth6(40), ScaleHeight6(25), ScaleWidth6(50), ScaleHeight6(50))];
        img.image = [UIImage imageNamed:@"随车附件"];
        [cell addSubview:img];
        UILabel *text = [[UILabel alloc]initWithFrame:CGRectMake(MaxX(img.frame)+ScaleWidth6(50), ScaleHeight6(40), ScaleWidth6(125), ScaleHeight6(24))];
        text.textColor=[Tools colorWithHexString:@"4a4a4a"];
        text.font =[UIFont systemFontOfSize:ScaleWidth6(24)];
        text.text=textArr[i];
        [cell addSubview:text];
        UIView *border = [[UIView alloc]initWithFrame:CGRectMake(0, ScaleHeight6(99), MaxX(cell.frame), ScaleHeight6(1))];
        border.backgroundColor = [Tools colorWithHexString:@"#b1b1b1"];
        [cell addSubview:border];
        PPNumberButton *Fbtn = [[PPNumberButton alloc]initWithFrame:CGRectMake(MaxX(img.frame)+ScaleWidth6(144)+ScaleWidth6(50), ScaleHeight6(25), ScaleWidth6(200), ScaleHeight6(50))];
        Fbtn.shakeAnimation = YES;
        [Fbtn setImageWithincreaseImage:[UIImage imageNamed:@"+"] decreaseImage:[UIImage imageNamed:@"--"]];
        Fbtn.max =[arr[i] intValue];
        Fbtn.numberBlock = ^(NSString *num){
           NSLog(@"%@",num);
        };
        [cell addSubview:Fbtn];
        UILabel *Flabel =[[UILabel alloc] initWithFrame:CGRectMake(MaxX(Fbtn.frame) +ScaleWidth6(4), MinY(Fbtn.frame) +ScaleHeight6(30), ScaleWidth6(160), ScaleWidth6(20))];
        Flabel.textColor =[Tools colorWithHexString:@"#999999"];
        Flabel.font =[UIFont systemFontOfSize:ScaleWidth6(20)];
        Flabel.text =[NSString stringWithFormat:@"标配：%d个",Fbtn.max];
        [cell addSubview:Flabel];
        UIImageView *statusimage =[[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth-ScaleWidth6(140), MinY(Fbtn.frame), ScaleWidth6(100), ScaleHeight6(50))];
        [cell addSubview:statusimage];
        NSString *str =[NSString stringWithFormat:@"%d",Fbtn.max];
        statusimage.image =[UIImage imageNamed:@"01"];
        Fbtn.numberBlock = ^(NSString *num){
            NSLog(@"%@",num);
            if ([num isEqualToString:str]) {
                statusimage.image =[UIImage imageNamed:@"02"];
            }else{
                statusimage.image =[UIImage imageNamed:@"01"];
            }
        };
    }
    UIButton *submitBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [submitBtn setImage:[UIImage imageNamed:@"提交"] forState:BtnNormal];
    submitBtn.frame =CGRectMake(ScaleWidth6(40),MaxY(border.frame) +ScaleHeight6(660), ScaleWidth6(670), ScaleHeight6(80));
    [submitBtn addTarget:self action:@selector(submitBtnClick) forControlEvents:BtnTouchUpInside];
    [self.view addSubview:submitBtn];
}

-(void)submitBtnClick{
    
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
