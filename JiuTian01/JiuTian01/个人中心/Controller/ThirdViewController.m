//
//  ThirdViewController.m
//  JiuTian01
//
//  Created by Limy on 2018/12/14.
//  Copyright © 2018年 Limy. All rights reserved.
//

#import "ThirdViewController.h"
#import "CustomTableViewCell.h"
#import "TipViewController.h"
#import "PassWordViewController.h"
#import "GroupInformViewController.h"
#import "CLJJViewController.h"
#import "PapersDateViewController.h"
#import "AllTruckingViewController.h"
#import "RootViewController.h"
#import "AppDelegate.h"
@interface ThirdViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UIButton *userBtn;
@property(nonatomic,strong)UILabel *userName;
@property(nonatomic,strong)UILabel *grade;
@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self navigationBar];
    [self createView];
}
-(void)navigationBar{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width - ScaleWidth6(684), ScaleHeight6(32))];
    label.text = @"个人中心";
    label.font = [UIFont boldSystemFontOfSize:ScaleWidth6(32)];
    label.textColor = [UIColor whiteColor];
    [label setTextAlignment:NSTextAlignmentCenter];
    self.navigationItem.titleView = label;
    UIButton *navbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    navbtn.frame = CGRectMake(0, 0, ScaleWidth6(36), ScaleHeight6(36));
    [navbtn setImage:[UIImage imageNamed:@"提醒"] forState:UIControlStateNormal];
    [navbtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithCustomView:navbtn];
    self.navigationItem.rightBarButtonItem = right;
}
-(void)btnClick{
    TipViewController *tip = [[TipViewController alloc]init];
    [self.navigationController pushViewController:tip animated:YES];
}

-(void)createView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.scrollEnabled =NO;
    _tableView.tableFooterView =[[UIView alloc] initWithFrame:CGRectZero];
    _tableView.separatorStyle = UITableViewCellEditingStyleNone;
    [self.view addSubview:_tableView];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *blueV= [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth,  ScaleHeight6(305))];
    blueV.backgroundColor = ThemeColor;
    [self.view addSubview:blueV];
    _userBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [_userBtn addTarget:self action:@selector(btnn) forControlEvents:UIControlEventTouchUpInside];
    [_userBtn setImage:[UIImage imageNamed:@"头像"] forState:UIControlStateNormal];
    _userBtn.frame =CGRectMake((ScreenWidth -ScaleWidth6(218))/2, 0, ScaleWidth6(218), ScaleWidth6(218));
    _userBtn.layer.cornerRadius =ScaleWidth6(218)/2;
    _userBtn.layer.masksToBounds =YES;
    [blueV addSubview:_userBtn];
    _userName =[[UILabel alloc] initWithFrame:CGRectMake(MinX(_userBtn.frame), MaxY(_userBtn.frame) +ScaleHeight6(40), ScaleWidth6(218), ScaleWidth6(26))];
    _userName.textColor =whriteColor;
    _userName.font =[UIFont systemFontOfSize:ScaleWidth6(26)];
    _userName.textAlignment =NSTextAlignmentCenter;
    _userName.text =@"未登录";
    [blueV addSubview:_userName];
    UIImageView *leve =[[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth -ScaleWidth6(158), MaxY(_userBtn.frame) +ScaleHeight6(25), ScaleWidth6(158), ScaleHeight6(40))];
    leve.image =[UIImage imageNamed:@"安全等级"];
    [blueV addSubview:leve];
    UIImageView *picV =[[UIImageView alloc] initWithFrame:CGRectMake(ScaleWidth6(12), ScaleHeight6(6), ScaleWidth6(26), ScaleHeight6(28))];
    picV.image =[UIImage imageNamed:@"安全等级图标"];
    [leve addSubview:picV];
    UILabel *titleL =[[UILabel alloc] initWithFrame:CGRectMake(MaxX(picV.frame) +ScaleWidth6(6), ScaleHeight6(10), ScaleWidth6(86), ScaleWidth6(18))];
    titleL.textColor =grayWordColor;
    titleL.font =[UIFont systemFontOfSize:ScaleWidth6(18)];
    titleL.text =@"安全等级:";
    [leve addSubview:titleL];
    _grade =[[UILabel alloc] initWithFrame:CGRectMake(MaxX(titleL.frame), ScaleHeight6(10), ScaleWidth6(40), ScaleWidth6(18))];
    _grade.textColor =ThemeColor;
    _grade.font =[UIFont systemFontOfSize:ScaleWidth6(18)];
    _grade.text =@"V3";
    [leve addSubview:_grade];
    return blueV;
}
-(void)btnn{
   
    NSString *URL = [NSString stringWithFormat:@"%@%@",CH_MainUrl,CH_Url_doLogin];
    NSDictionary *param = @{@"deviceId":getUserDefault(@"deviceId"),@"token":getUserDefault(@"token")};
    [NetWorkingTools PostWithURL:URL params:param success:^(id json) {
        NSLog(@"%@",json);
    
        setUserDefault(nil,@"token");
        [self dologin];
    } failure:^(NSError *error) {
    }];
}
-(void)dologin{
    RootViewController *root= [[RootViewController alloc]init];
    AppDelegate *appdelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    appdelegate.window.rootViewController=root;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *arr = @[@"修改密码",@"集团通知",@"车辆交接",@"证件到期时间",@"全部派车单"];
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"123"];
    if (!cell) {
        cell =[[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"123"];
        cell.timg.image = [UIImage imageNamed:arr[indexPath.row]];
        cell.text.text=arr[indexPath.row];
        cell.selectionStyle =UITableViewCellSelectionStyleNone;
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return ScaleHeight6(305);
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return ScaleHeight6(100);
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        PassWordViewController *vc = [[PassWordViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row ==1){
        GroupInformViewController *vc = [[GroupInformViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if(indexPath.row ==2){
       CLJJViewController *vc = [[CLJJViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if(indexPath.row ==3){
        PapersDateViewController *vc = [[PapersDateViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if(indexPath.row ==4){
        AllTruckingViewController *vc = [[AllTruckingViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}
@end
