//
//  PassWordViewController.m
//  JiuTian01
//
//  Created by Limy on 2018/12/24.
//  Copyright © 2018年 Limy. All rights reserved.
//

#import "PassWordViewController.h"

@interface PassWordViewController ()<UITextFieldDelegate>
@property (nonatomic,strong) UITextField *OldPW;
@property (nonatomic,strong) UITextField *NewPW;
@property (nonatomic,strong) UITextField *TurePW;
@property (nonatomic,strong) UIView *border;
@property (nonatomic,strong) UIView *border1;
@property (nonatomic,strong) UIView *border2;
@end

@implementation PassWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createView];
}
-(void)createView{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width - ScaleWidth6(684), ScaleHeight6(32))];
    label.text = @"修改密码";
    label.font = [UIFont boldSystemFontOfSize:ScaleWidth6(32)];
    label.textColor = [UIColor whiteColor];
    [label setTextAlignment:NSTextAlignmentCenter];
    self.navigationItem.titleView = label;
    UILabel *Oldps = [[UILabel alloc]initWithFrame:CGRectMake(ScaleWidth6(40), ScaleHeight6(40), ScaleWidth6(150), ScaleHeight6(24))];
    Oldps.textColor = [Tools colorWithHexString:@"4a4a4a"];
    Oldps.text = @"原始密码";
    Oldps.font = [UIFont systemFontOfSize:ScaleWidth6(24)];
    [self.view addSubview:Oldps];
    _OldPW = [[UITextField alloc]initWithFrame:CGRectMake(MaxX(Oldps.frame), ScaleHeight6(40), ScaleWidth6(520), ScaleHeight6(24))];
    _OldPW.delegate=self;
    _OldPW.placeholder = @"请填写原始密码";
    _OldPW.textColor = grayWordColor;
    _OldPW.font = [UIFont systemFontOfSize:ScaleWidth6(24)];
    _OldPW.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:_OldPW];
    _border = [[UIView alloc]initWithFrame:CGRectMake(ScaleWidth6(190), ScaleHeight6(104), ScreenWidth-ScaleWidth6(80)-ScaleWidth6(150), ScaleHeight6(1))];
        _border.backgroundColor = [Tools colorWithHexString:@"b1b1b1"];
        [self.view addSubview:_border];
    _border1 = [[UIView alloc]initWithFrame:CGRectMake(ScaleWidth6(190), ScaleHeight6(208), ScreenWidth-ScaleWidth6(80)-ScaleWidth6(150), ScaleHeight6(1))];
    _border1.backgroundColor = [Tools colorWithHexString:@"b1b1b1"];
    [self.view addSubview:_border1];
    _border2 = [[UIView alloc]initWithFrame:CGRectMake(ScaleWidth6(190), ScaleHeight6(312), ScreenWidth-ScaleWidth6(80)-ScaleWidth6(150), ScaleHeight6(1))];
    _border2.backgroundColor = [Tools colorWithHexString:@"b1b1b1"];
    [self.view addSubview:_border2];
    UILabel *newpass = [[UILabel alloc]initWithFrame:CGRectMake(ScaleWidth6(40), MaxY(_OldPW.frame)+ScaleHeight6(80), ScaleWidth6(150), ScaleHeight6(24))];
    newpass.textColor =[Tools colorWithHexString:@"4a4a4a"];
    newpass.text = @"新密码";
    newpass.font = [UIFont systemFontOfSize:ScaleWidth6(24)];
    [self.view addSubview:newpass];
    _NewPW = [[UITextField alloc]initWithFrame:CGRectMake(MaxX(newpass.frame), MinY(newpass.frame), ScaleWidth6(520), ScaleHeight6(24))];
    _NewPW.placeholder = @"请填写新密码";
    _NewPW.delegate=self;
    _NewPW.textColor = grayWordColor;
    _NewPW.font = [UIFont systemFontOfSize:ScaleWidth6(24)];
    _NewPW.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:_NewPW];
    UILabel *turepass= [[UILabel alloc]initWithFrame:CGRectMake(ScaleWidth6(40), MaxY(newpass.frame)+ScaleHeight6(80), ScaleWidth6(150), ScaleHeight6(24))];
    turepass.textColor = [Tools colorWithHexString:@"4a4a4a"];
    turepass.text = @"确认密码";
    turepass.font = [UIFont systemFontOfSize:ScaleWidth6(24)];
    [self.view addSubview:turepass];
    _TurePW = [[UITextField alloc]initWithFrame:CGRectMake(MaxX(turepass.frame), MinY(turepass.frame), ScaleWidth6(520), ScaleHeight6(24))];
    _TurePW.placeholder = @"再次填写确认";
    _TurePW.textColor=grayWordColor;
    _TurePW.delegate = self;
    _TurePW.font = [UIFont systemFontOfSize:ScaleWidth6(24)];
    _TurePW.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:_TurePW];
    UILabel *annotation = [[UILabel alloc]initWithFrame:CGRectMake(ScaleWidth6(40), MaxY(turepass.frame)+ScaleHeight6(80), ScaleWidth6(500), ScaleHeight6(20))];
    annotation.textColor=grayWordColor;
    NSMutableAttributedString *zhuStr =[[NSMutableAttributedString alloc] initWithString:@"*注：密码必须是8-16位，数字/字母/字符两种组合。"];
    [zhuStr addAttribute:NSForegroundColorAttributeName value:ThemeColor range:NSMakeRange(8, 4)];
    annotation.attributedText =zhuStr;
    annotation.font =[UIFont systemFontOfSize:ScaleWidth6(20)];
    [self.view addSubview:annotation];
    UIButton *commit = [[UIButton alloc]initWithFrame:CGRectMake(ScaleWidth6(40), MaxY(annotation.frame)+ScaleHeight6(160), ScreenWidth-ScaleWidth6(80), ScaleHeight6(80))];
    [commit setBackgroundImage:[UIImage imageNamed:@"提交"] forState:UIControlStateNormal];
    [commit addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:commit];
    
}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    if (textField ==_OldPW) {
        _border.backgroundColor =ThemeColor;
        _border1.backgroundColor =[Tools colorWithHexString:@"adadad"];
        _border2.backgroundColor =[Tools colorWithHexString:@"adadad"];
    }else if (textField ==_NewPW){
        _border.backgroundColor =[Tools colorWithHexString:@"adadad"];
        _border1.backgroundColor =ThemeColor;
        _border2.backgroundColor =[Tools colorWithHexString:@"adadad"];
    }else if (textField ==_TurePW){
        _border.backgroundColor =[Tools colorWithHexString:@"adadad"];
        _border1.backgroundColor =[Tools colorWithHexString:@"adadad"];
        _border2.backgroundColor =ThemeColor;
    }
}
-(void)btnClick{
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
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
