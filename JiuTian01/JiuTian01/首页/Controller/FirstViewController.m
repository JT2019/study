//
//  FirstViewController.m
//  JiuTian01
//
//  Created by Limy on 2018/12/14.
//  Copyright © 2018年 Limy. All rights reserved.
//

#import "FirstViewController.h"
#import "ZcellTableViewCell.h"
#import "TipViewController.h"
#import "CLAJViewController.h"
#import "BZCXViewController.h"
#import "GroupInViewController.h"
@interface FirstViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong)UIButton *navbtn;
@property (nonatomic,strong) UIImageView *userV;
@property (nonatomic,strong) UILabel *userName;
@property (nonatomic,strong) UILabel *userSupercargo;
@property (nonatomic,strong) UILabel *userlocation;
@property (nonatomic,strong) UILabel *userType;
@property (nonatomic,strong) UILabel *userCurrentRoute;


@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    [self createView];
    [self loadWithAFN];
}
-(void)createView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-ScaleHeight6(44))style:UITableViewStyleGrouped];
   _tableView.dataSource = self;
    _tableView.delegate =self;
    _tableView.backgroundColor = whriteColor;
    _tableView.showsVerticalScrollIndicator =NO;
    _tableView.separatorStyle = UITableViewCellEditingStyleNone;
    [self.view addSubview:_tableView];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width - ScaleWidth6(684), ScaleHeight6(32))];
    label.text = @"首页";
    label.font = [UIFont boldSystemFontOfSize:ScaleWidth6(32)];
    label.textColor = [UIColor whiteColor];
    [label setTextAlignment:NSTextAlignmentCenter];
    self.navigationItem.titleView = label;
    _navbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _navbtn.frame = CGRectMake(0, 0, ScaleWidth6(36), ScaleHeight6(36));
    [_navbtn setImage:[UIImage imageNamed:@"提醒"] forState:UIControlStateNormal];
    [_navbtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithCustomView:_navbtn];
    self.navigationItem.rightBarButtonItem = right;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headV=[[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScaleHeight6(745))];
    headV.backgroundColor = whriteColor;
    UIView *blueV=[[UIView alloc]initWithFrame:CGRectMake(0, 0,ScreenWidth, ScaleHeight6(275))];
    blueV.backgroundColor = ThemeColor;
    [headV addSubview:blueV];
    UIView *head = [[UIView alloc]initWithFrame:CGRectMake(ScaleWidth6(20), 0, ScaleWidth6(710), ScaleHeight6(330))];
    head.backgroundColor = whriteColor;
    head.layer.borderColor =ThemeColor.CGColor;
    head.layer.borderWidth =ScaleWidth6(1);
    head.layer.cornerRadius =ScaleWidth6(15);
    [headV addSubview:head];
    _userV = [[UIImageView alloc]initWithFrame:CGRectMake(ScaleWidth6(20), ScaleHeight6(26), ScaleWidth6(160), ScaleHeight6(218))];
    _userV.image = [UIImage imageNamed:@"照片"];
    [head addSubview:_userV];
    UILabel *dname = [[UILabel alloc]initWithFrame:CGRectMake(MaxX(_userV.frame)+ScaleWidth6(20), ScaleHeight6(32), ScaleWidth6(90), ScaleWidth6(22))];
    dname.textColor =grayWordColor;
    dname.text =@"驾驶员：";
    dname.font =[UIFont systemFontOfSize:ScaleWidth6(22)];
    [head addSubview:dname];
    _userName =[[UILabel alloc] initWithFrame:CGRectMake(MaxX(dname.frame), MinY(dname.frame), ScaleWidth6(90), ScaleWidth6(22))];
    _userName.textColor =grayWordColor;
    _userName.text =@"丁一一";
    _userName.font =[UIFont systemFontOfSize:ScaleWidth6(22)];
    [head addSubview:_userName];
    UILabel *yname = [[UILabel alloc]initWithFrame:CGRectMake(MaxX(_userName.frame), MinY(dname.frame), ScaleWidth6(90), ScaleHeight6(22))];
    yname.textColor = grayWordColor;
    yname.text = @"押运员：";
    yname.font = [UIFont systemFontOfSize:ScaleWidth6(22)];
    [head addSubview:yname];
    _userSupercargo = [[UILabel alloc]initWithFrame:CGRectMake(MaxX(yname.frame), MinY(dname.frame), ScaleWidth6(90), ScaleHeight6(22))];
    _userSupercargo.textColor=grayWordColor;
    _userSupercargo.text = @"丁二二";
    _userSupercargo.font = [UIFont systemFontOfSize:ScaleWidth6(22)];
    [head addSubview:_userSupercargo];
    UILabel *bsc = [[UILabel alloc]initWithFrame:CGRectMake(MaxX(_userV.frame)+ScaleWidth6(20),MaxY(dname.frame)+ScaleHeight6(18), ScaleWidth6(90), ScaleHeight6(22))];
    bsc.textColor = grayWordColor;
    bsc.text = @"办事处：";
    bsc.font = [UIFont systemFontOfSize:ScaleWidth6(22)];
    [head addSubview:bsc];
    _userlocation= [[UILabel alloc]initWithFrame:CGRectMake(MaxX(bsc.frame), MinY(bsc.frame), ScaleWidth6(90), ScaleHeight6(22))];
    _userlocation.textColor = grayWordColor;
    _userlocation.text = @"吉林市";
    _userlocation.font = [UIFont systemFontOfSize:ScaleWidth6(22)];
    [head addSubview:_userlocation];
    UILabel *rytype = [[UILabel alloc]initWithFrame:CGRectMake(MaxX(_userlocation.frame), MinY(bsc.frame), ScaleWidth6(115), ScaleHeight6(22))];
    rytype.textColor = grayWordColor;
    rytype.text = @"燃料类型：";
    rytype.font = [UIFont systemFontOfSize:ScaleWidth6(22)];
    [head addSubview:rytype];
    _userType = [[UILabel alloc]initWithFrame:CGRectMake(MaxX(rytype.frame), MinY(rytype.frame),ScaleWidth6(70), ScaleHeight6(22))];
    _userType.textColor = grayWordColor;
    _userType.text = @"柴油";
    _userType.font = [UIFont systemFontOfSize:ScaleWidth6(22)];
    [head addSubview:_userType];
    UILabel *dylc = [[UILabel alloc]initWithFrame:CGRectMake(MinX(bsc.frame), MaxY(bsc.frame)+ScaleHeight6(18), ScaleWidth6(115), ScaleHeight6(22))];
    dylc.textColor =grayWordColor;
    dylc.text = @"当月里程：";
    dylc.font = [UIFont systemFontOfSize:ScaleWidth6(22)];
    [head addSubview:dylc];
    _userCurrentRoute = [[UILabel alloc]initWithFrame:CGRectMake(MaxX(dylc.frame), MinY(dylc.frame), ScaleWidth6(193), ScaleHeight6(22))];
    _userCurrentRoute.textColor=grayWordColor;
    _userCurrentRoute.text=@"3,219km";
    _userCurrentRoute.font = [UIFont systemFontOfSize:ScaleWidth6(22)];
    [head addSubview:_userCurrentRoute];
    
    UILabel *zjlc = [[UILabel alloc]initWithFrame:CGRectMake(MinX(dylc.frame), MaxY(dylc.frame)+ScaleHeight6(18), ScaleWidth6(115), ScaleHeight6(22))];
    zjlc.textColor = grayWordColor;
    zjlc.text = @"总计里程：";
    zjlc.font = [UIFont systemFontOfSize:ScaleWidth6(22)];
    [head addSubview:zjlc];
    UILabel *zjlc1 = [[UILabel alloc]initWithFrame:CGRectMake(MaxX(zjlc.frame), MaxY(dylc.frame)+ScaleHeight6(18), ScaleWidth6(130), ScaleHeight6(22))];
    zjlc1.textColor = grayWordColor;
    zjlc1.text = @"206,368km";
    zjlc1.font = [UIFont systemFontOfSize:ScaleWidth6(22)];
    [head addSubview:zjlc1];
    
    UILabel *wxpDate = [[UILabel alloc]initWithFrame:CGRectMake(MinX(zjlc.frame), MaxY(zjlc.frame) +ScaleHeight6(18), ScaleWidth6(328), ScaleWidth6(22))];
    wxpDate.textColor = grayWordColor;
    wxpDate.text = @"危险品驾驶证到期日期：2020年";
    wxpDate.font = [UIFont systemFontOfSize:ScaleWidth6(22)];
    [head addSubview:wxpDate];
    UILabel *wxpDate1 = [[UILabel alloc]initWithFrame:CGRectMake(MinX(wxpDate.frame), MaxY(wxpDate.frame) +ScaleHeight6(18), ScaleWidth6(328), ScaleWidth6(22))];
    wxpDate1.textColor = grayWordColor;
    wxpDate1.text = @"危险品押运证到期日期：2020年";
    wxpDate1.font = [UIFont systemFontOfSize:ScaleWidth6(22)];
    [head addSubview:wxpDate1];
    UIImageView *anquan = [[UIImageView alloc]initWithFrame:CGRectMake(head.frame.size.width -ScaleWidth6(154) -ScaleWidth6(5), ScaleHeight6(28), ScaleWidth6(154), ScaleHeight6(170))];
    anquan.image = [UIImage imageNamed:@"安全行驶"];
    [head addSubview:anquan];
    UILabel *anquantext = [[UILabel alloc]initWithFrame:CGRectMake(0, ScaleHeight6(33), ScaleWidth6(154), ScaleHeight6(18))];
    anquantext.text = @"已安全行驶";
    anquantext.textColor = whriteColor;
    anquantext.font=[UIFont systemFontOfSize:ScaleWidth6(18)];
    anquantext.textAlignment = NSTextAlignmentCenter;
    [anquan addSubview:anquantext];
    UILabel *anquanshu = [[UILabel alloc]initWithFrame:CGRectMake(ScaleWidth6(20), MaxY(anquantext.frame) +ScaleHeight6(15), ScaleWidth6(78), ScaleHeight6(25))];
    anquanshu.text = @"214,512";
    anquanshu.textColor=whriteColor;
    anquanshu.font = [UIFont systemFontOfSize:ScaleWidth6(20)];
    [anquan addSubview:anquanshu];
    UILabel *gongli = [[UILabel alloc]initWithFrame:CGRectMake(MaxX(anquanshu.frame)+ScaleWidth6(5), MinY(anquanshu.frame)+ScaleHeight6(8), ScaleWidth6(26), ScaleHeight6(16))];
    gongli.textColor = whriteColor;
    gongli.text = @"KM";
    gongli.font = [UIFont systemFontOfSize:ScaleWidth6(16)];
    [anquan addSubview:gongli];
    UIImageView *aqdj = [[UIImageView alloc]initWithFrame:CGRectMake(head.bounds.size.width-ScaleWidth6(165), MaxY(anquan.frame)+ScaleHeight6(8), ScaleWidth6(160), ScaleHeight6(38))];
    aqdj.image = [UIImage imageNamed:@"安全行驶框"];
    [head addSubview:aqdj];
    UIImageView *aqimg = [[UIImageView alloc]initWithFrame:CGRectMake(ScaleWidth6(8), ScaleWidth6(6), ScaleWidth6(26), ScaleHeight6(26))];
    aqimg.image = [UIImage imageNamed:@"安全行驶等级"];
    [aqdj addSubview:aqimg];
    UILabel *aqdjtext = [[UILabel alloc]initWithFrame:CGRectMake(MaxX(aqimg.frame)+ScaleWidth6(6), ScaleHeight6(10), ScaleWidth6(85), ScaleHeight6(18))];
    aqdjtext.textColor = grayWordColor;
    aqdjtext.text = @"安全等级:";
    aqdjtext.font = [UIFont systemFontOfSize:ScaleWidth6(18)];
    [aqdj addSubview:aqdjtext];
    UILabel *gradePrice = [[UILabel alloc]initWithFrame:CGRectMake(MaxX(aqdjtext.frame), ScaleHeight6(10), ScaleWidth6(35), ScaleHeight6(18))];
    gradePrice.textColor=ThemeColor;
    gradePrice.text = @"V3";
    gradePrice.font = [UIFont systemFontOfSize:ScaleWidth6(18)];
    [aqdj addSubview:gradePrice];
    UIView *border = [[UIView alloc]initWithFrame:CGRectMake(ScaleWidth6(26), MaxY(_userV.frame)+ScaleHeight6(30), ScaleWidth6(710)-ScaleWidth6(26)-ScaleWidth6(26), ScaleHeight6(1))];
    border.backgroundColor = ThemeColor;
    [head addSubview:border];
    UILabel *userCarId = [[UILabel alloc]initWithFrame:CGRectMake(ScaleWidth6(90), MaxY(border.frame) +ScaleHeight6(15), ScaleWidth6(265), ScaleHeight6(22))];
    userCarId.textColor = grayWordColor;
    userCarId.text=@"主车车牌号:吉B 88888";
    userCarId.font=[UIFont systemFontOfSize:ScaleWidth6(22)];
    [head addSubview:userCarId];
    UILabel *userCarIdl = [[UILabel alloc]initWithFrame:CGRectMake(MaxX(userCarId.frame), MaxY(border.frame) +ScaleHeight6(15), ScaleWidth6(265), ScaleHeight6(22))];
    userCarIdl.textColor = grayWordColor;
    userCarIdl.text = @"挂车车牌号:吉B 666666";
    userCarIdl.font = [UIFont systemFontOfSize:ScaleWidth6(22)];
    [head addSubview:userCarIdl];
    
    NSArray *Arr =@[@"维修保养",@"倒胎换胎",@"报账查询",@"其他申请",
                    @"车辆安检",@"行政申请",@"在线考试",@"发泄平台"];
    for (int i = 0; i<8; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(ScaleWidth6(40)+(ScaleWidth6(90)+ScaleWidth6(104))*(i%4),MaxY(head.frame)+ScaleHeight6(30)+(ScaleHeight6(90)+ScaleHeight6(16)+ScaleHeight6(22)+ScaleHeight6(30))*(i/4), ScaleWidth6(90), ScaleHeight6(90));
        [btn setImage:[UIImage imageNamed:Arr[i]] forState:UIControlStateNormal];
        btn.tag = i+100;
        [btn addTarget:self action:@selector(funbtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [headV addSubview:btn];
        UILabel *headline =[[UILabel alloc] initWithFrame:CGRectMake(MinX(btn.frame), MaxY(btn.frame) +ScaleHeight6(16), ScaleWidth6(90), ScaleHeight6(22))];
        headline.textColor =grayWordColor;
        headline.text =Arr[i];
        headline.font =[UIFont boldSystemFontOfSize:ScaleWidth6(22)];
        [headV addSubview:headline];
    }
        UIView *bd =[[UILabel alloc] initWithFrame:CGRectMake(0,MaxY(head.frame) +ScaleHeight6(345), ScreenWidth, ScaleHeight6(8))];
        bd.backgroundColor =[Tools colorWithHexString:@"#e6ebed"];
        [headV addSubview:bd];
    UIImageView *halvingLine = [[UIImageView alloc]initWithFrame:CGRectMake(ScaleWidth6(20), MaxY(bd.frame)+ScaleHeight6(14), ScaleWidth6(4), ScaleHeight6(28))];
    halvingLine.image = [UIImage imageNamed:@"分割线"];
    [headV addSubview:halvingLine];
    UILabel *inform = [[UILabel alloc]initWithFrame:CGRectMake(MaxX(halvingLine.frame)+ScaleWidth6(4), MaxY(bd.frame)+ScaleHeight6(16), ScaleWidth6(120), ScaleHeight6(26))];
    inform.textColor = grayWordColor;
    inform.text=@"集团通知";
    inform.font = [UIFont systemFontOfSize:ScaleWidth6(26)];
    [headV addSubview:inform];
    UIView *bd2 = [[UIView alloc]initWithFrame:CGRectMake(0,MaxY(inform.frame) +ScaleHeight6(20), ScreenWidth, ScaleHeight6(1))];
    bd2.backgroundColor =[Tools colorWithHexString:@"#e6ebed"];
    [headV addSubview:bd2];
    return headV;
}

-(void)btnClick{
    TipViewController *tip = [[TipViewController alloc]init];
    [self.navigationController pushViewController:tip animated:YES];
}
-(void)funbtnClick:(UIButton *)sender{
    if (sender.tag ==104){
        CLAJViewController *vc =[[CLAJViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if(sender.tag==102){
        BZCXViewController *vc=[[BZCXViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
        }
}
-(void)loadWithAFN{
    NSString *URL =[NSString stringWithFormat:@"%@%@",CH_MainUrl,CH_Url_HomePage];
    NSDictionary *param =@{@"deviceId":getUserDefault(@"deviceId"),@"token":getUserDefault(@"token")};
    [NetWorkingTools PostWithURL:URL params:param success:^(id json) {
        NSLog(@"%@",json);
        NSDictionary *xinxi= json[@"information"];
        NSLog(@"%@",xinxi);
        self.userName.text = [xinxi valueForKey:@"driverName"];
        self.userSupercargo.text  = [xinxi valueForKey:@"supercargoName"];
        self.userlocation.text = [xinxi valueForKey:@"company"];
        self.userType.text = [xinxi valueForKey:@"fuelType"];

        [self.userV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",urll,[xinxi valueForKey:@"photosOfPeople"]]] placeholderImage:[UIImage imageNamed:@"照片"]];
        
    } failure:^(NSError *error) {
    }];
    }
    /*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZcellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell=[[ZcellTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle =UITableViewCellSelectionStyleNone;
    }
    return cell;
}

-(void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return ScaleHeight6(745);
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return ScaleHeight6(185);
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGPoint offset = _tableView.contentOffset;
    if (offset.y <= 0) {
        offset.y = 0;
    }
    _tableView.contentOffset = offset;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    GroupInViewController *vc = [[GroupInViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    ZcellTableViewCell *cell = [[ZcellTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
//    return cell;
    //}
@end
