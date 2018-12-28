//
//  SecondViewController.m
//  JiuTian01
//
//  Created by Limy on 2018/12/14.
//  Copyright © 2018年 Limy. All rights reserved.
//

#import "SecondViewController.h"
#import "HeadTableViewCell.h"
#import "HYCircleProgressView.h"
#import <AudioToolbox/AudioToolbox.h>
#import "Index1TableViewCell.h"
#import "Index2TableViewCell.h"
#import "Index3TableViewCell.h"
#import "Index4TableViewCell.h"
#import "PCmodel.h"
@interface SecondViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UILabel *UserMoneyL;
@property (nonatomic,strong) HYCircleProgressView *progressView;
@property (nonatomic,strong)UIView *bottmV;
@property (nonatomic,strong)UIImageView *userV;
@property (nonatomic,strong)PCmodel *pcmodel;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self navigationBar];
    [self AFN];
     [self createView];
    
}
-(void)AFN{
    NSString *URL =[NSString stringWithFormat:@"%@%@",CH_MainUrl,CH_Url_dispatchList];
    NSDictionary *param =@{@"deviceId":getUserDefault(@"deviceId"),@"token":getUserDefault(@"token")};
    [NetWorkingTools PostWithURL:URL params:param success:^(id json) {
        NSLog(@"%@",json);
        self.pcmodel = [PCmodel yy_modelWithDictionary:json];
        [self.tableView reloadData];
    } failure:^(NSError *error) {
    }];
}
-(void)navigationBar{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width - ScaleWidth6(684), ScaleHeight6(32))];
    label.text = @"派车单";
    label.font = [UIFont boldSystemFontOfSize:ScaleWidth6(32)];
    label.textColor = [UIColor whiteColor];
    [label setTextAlignment:NSTextAlignmentCenter];
    self.navigationItem.titleView = label;
    UIButton *navbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    navbtn.frame = CGRectMake(0, 0, ScaleWidth6(36), ScaleHeight6(36));
    [navbtn setImage:[UIImage imageNamed:@"提醒"] forState:UIControlStateNormal];
    [navbtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithCustomView:navbtn];
    self.navigationItem.rightBarButtonItem = right;
}

- (void)createView{
    UIView *blueV =[[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScaleHeight6(275))];
    blueV.backgroundColor =ThemeColor;
    [self.view addSubview:blueV];
    UIView *head = [[UIView alloc]initWithFrame:CGRectMake(ScaleWidth6(20), 0, ScreenWidth-ScaleWidth6(40), ScaleHeight6(1000))];
    head.backgroundColor=whriteColor;
    head.layer.cornerRadius = ScaleWidth6(15);
    head.layer.borderWidth = ScaleWidth6(1);
    head.layer.borderColor = [Tools colorWithHexString:@"#c5c5c5"].CGColor;
    [self.view addSubview:head];
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, head.bounds.size.width, head.bounds.size.height)style:UITableViewStylePlain];
    _tableView.layer.cornerRadius = ScaleWidth6(15);
    _tableView.layer.borderWidth = ScaleWidth6(1);
    _tableView.dataSource = self;
    _tableView.delegate =self;
    _tableView.backgroundColor = whriteColor;
    _tableView.showsVerticalScrollIndicator =NO;
    _tableView.separatorStyle =UITableViewCellSeparatorStyleNone;
    [head addSubview:_tableView];
    
    _bottmV =[[UIView alloc] initWithFrame:CGRectMake(ScaleWidth6(20), MaxY(head.frame) +ScaleHeight6(8), ScaleWidth6(710), ScaleHeight6(94))];
    _bottmV.backgroundColor =whriteColor;
    _bottmV.layer.borderColor =[Tools colorWithHexString:@"#c5c5c5"].CGColor;
    _bottmV.layer.borderWidth =ScaleWidth6(1);
    _bottmV.layer.cornerRadius =ScaleHeight6(15);
    [self.view addSubview:_bottmV];
    
    UILabel *tip =[[UILabel alloc] initWithFrame:CGRectMake(ScaleWidth6(18), ScaleHeight6(32), ScaleWidth6(445), ScaleWidth6(26))];
    tip.textColor =grayWordColor;
    tip.text =@"你有一条新的派车单产生，是否接受?";
    tip.font =[UIFont systemFontOfSize:ScaleWidth6(26)];
    [_bottmV addSubview:tip];
    
    UIButton *aBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    aBtn.frame =CGRectMake(MaxX(tip.frame), ScaleHeight6(18), ScaleWidth6(110), ScaleHeight6(54));
    [aBtn setTitle:@"接受" forState:UIControlStateNormal];
    [aBtn setBackgroundImage:[UIImage imageNamed:@"接受"] forState:UIControlStateNormal];
    [aBtn setTitleColor:whriteColor forState:UIControlStateNormal];
    aBtn.titleLabel.font =[UIFont systemFontOfSize:ScaleWidth6(20)];
    aBtn.layer.borderColor =grayWordColor.CGColor;
    aBtn.layer.borderWidth =ScaleWidth6(1);
    [aBtn addTarget:self action:@selector(aBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_bottmV addSubview:aBtn];
    
    UIButton *bBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    bBtn.frame=CGRectMake(MaxX(aBtn.frame)+ScaleWidth6(16), ScaleHeight6(18), ScaleWidth6(110), ScaleHeight6(54)) ;
    [bBtn setTitle:@"拒绝" forState:UIControlStateNormal];
    [bBtn setBackgroundImage:[UIImage imageNamed:@"拒绝"] forState:UIControlStateNormal];
    [bBtn setTitleColor:whriteColor forState:UIControlStateNormal];
    bBtn.titleLabel.font =[UIFont systemFontOfSize:ScaleWidth6(20)];
    bBtn.layer.borderColor =[Tools colorWithHexString:@"#c5c5c5"].CGColor;
    bBtn.layer.borderWidth =ScaleWidth6(1);
    [bBtn addTarget:self action:@selector(bBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_bottmV addSubview:bBtn];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
            PCdispatchListInfo *dic = self.pcmodel.dispatchListInfo[indexPath.row];
    if (indexPath.row == 0) {
        HeadTableViewCell *cell = [[HeadTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        _progressView = [[HYCircleProgressView alloc]initWithFrame:CGRectMake(ScaleWidth6(710) -ScaleWidth6(30) -ScaleWidth6(140), ScaleHeight6(105), ScaleWidth6(140), ScaleHeight6(140))];
        _progressView.progressLineWidth =ScaleWidth6(10);
        _progressView.backgroundLineWidth =ScaleWidth6(10);
        [_progressView setBackgroundStrokeColor:[Tools colorWithHexString:@"#dddddd"]];
        [_progressView setProgressStrokeColor:[Tools colorWithHexString:@"#17b891"]];
         [cell.contentView addSubview:_progressView];
            UILabel *money= [[UILabel alloc]initWithFrame:CGRectMake(0, ScaleHeight6(32), ScaleWidth6(140), ScaleWidth6(16))];
            money.textColor =grayWordColor;
            money.text =@"备用金额:";
            money.textAlignment =NSTextAlignmentCenter;
            money.font =[UIFont systemFontOfSize:ScaleWidth6(16)];
            [_progressView addSubview:money];
            _UserMoneyL =[[UILabel alloc] initWithFrame:CGRectMake(0, MaxY(money.frame) +ScaleHeight6(16), ScaleWidth6(140), ScaleWidth6(26))];
            _UserMoneyL.textColor =grayWordColor;
            _UserMoneyL.text = self.pcmodel.reimbursement;
            _UserMoneyL.textAlignment =NSTextAlignmentCenter;
            _UserMoneyL.font =[UIFont systemFontOfSize:ScaleWidth6(26)];
           [_progressView addSubview:_UserMoneyL];
         [cell.headImg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",urll,self.pcmodel.photosOfPeople]] placeholderImage:[UIImage imageNamed:@"照片"]];
        cell.userName.text = self.pcmodel.driverName;
        cell.usName.text=self.pcmodel.supercargoName;
        cell.location.text=self.pcmodel.company;
        cell.type.text=self.pcmodel.fuelType;
        cell.theMonth.text=self.pcmodel.monthMileage;
        cell.All.text=self.pcmodel.totalMileage;
        NSString *strr= [NSString stringWithFormat:@"重空行驶里程：%@",self.pcmodel.emptyCruising];
        cell.single.text=strr;
        NSString *str = [NSString stringWithFormat:@"重空行驶里程：%@",self.pcmodel.heavyDriving];
        cell.repetition.text=str;
        [_progressView setProgress:0.8 animated:YES];
        return cell;
    }else if(indexPath.row==1){
        Index1TableViewCell*cell = [[Index1TableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.limg.image = [UIImage imageNamed:@"01商品信息："];
        cell.merchandise.text = dic.commodityInformation;
        cell.pdId.text=dic.singleCarNumber;
        return cell;
    }else if (indexPath.row==2){
        Index2TableViewCell *cell = [[Index2TableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.timg.image=[UIImage imageNamed:@"02路线信息："];
        cell.Path.text=dic.routeInformation;
        cell.Route.text=@"路线信息：";
        return cell;
    }else if (indexPath.row==3){
        Index3TableViewCell *cell = [[Index3TableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.timg.image=[UIImage imageNamed:@"03预计出发时间"];
        cell.date.text=@"预计出发时间：";
        cell.dateValue.text=dic.estimatedTimeOfDeparture;
        return cell;
    }else if (indexPath.row==4){
        Index3TableViewCell *cell = [[Index3TableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.timg.image=[UIImage imageNamed:@"04实际出发时间："];
        cell.date.text=@"实际出发时间";
        cell.dateValue.text=dic.actualDepartureTime;
        return cell;
    }else if (indexPath.row==5){
        Index3TableViewCell *cell = [[Index3TableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.timg.image=[UIImage imageNamed:@"05预计到达时间"];
        cell.date.text=@"预计到达时间：";
        cell.dateValue.text=dic.astimatedTimeOfArrival;
        return cell;
    }else if(indexPath.row==6){
        Index3TableViewCell *cell = [[Index3TableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.timg.image=[UIImage imageNamed:@"06实际到达时间："];
        cell.date.text=@"实际到达时间：";
        cell.dateValue.text=dic.actualArrivalTime;
        return cell;}
    else if(indexPath.row==7){
        Index4TableViewCell *cell = [[Index4TableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
         cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.timg.image = [UIImage imageNamed:@"07装车吨数"];
        cell.tunnage.text=@"装车吨数";
        [cell.btn addTarget:self action:@selector(tjbtn) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }else if(indexPath.row==8){
        Index4TableViewCell *cell = [[Index4TableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
         cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.timg.image = [UIImage imageNamed:@"08卸车吨数"];
        cell.tunnage.text=@"卸车吨数";
        [cell.btn addTarget:self action:@selector(tjbtn) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }
    else if(indexPath.row==9){
        Index2TableViewCell *cell = [[Index2TableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.timg.image=[UIImage imageNamed:@"09蒸罐清洗"];
        cell.Path.text=@"需要/不需要";
        cell.Route.text=@"蒸罐清洗";
        cell.border.backgroundColor = whriteColor;
        return cell;
    }
    else {
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
        return cell;
    }
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row ==0) {
        return ScaleHeight6(277);
    }else{
        return ScaleHeight6(80);
    }
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGPoint offset = _tableView.contentOffset;
    if (offset.y <= 130) {
        offset.y = 0;
    }
    _tableView.contentOffset = offset;
}

-(void)btnClick:(UIBarButtonItem*)sender{
    
}
-(void)viewWillAppear:(BOOL)animated{
    [_tableView reloadData];
    CAKeyframeAnimation * keyAnimaion = [CAKeyframeAnimation animation];
    keyAnimaion.keyPath = @"transform.rotation";
    keyAnimaion.values = @[@(-10 / 180.0 * M_PI),@(10 /180.0 * M_PI),@(-10 / 180.0 * M_PI)];
    //度数转弧度
    keyAnimaion.removedOnCompletion = YES;
    keyAnimaion.fillMode = kCAFillModeForwards;
    keyAnimaion.duration = 0.3;
    keyAnimaion.repeatCount = 10;
    [self.bottmV.layer addAnimation:keyAnimaion forKey:nil];
    AudioServicesPlaySystemSoundWithCompletion(kSystemSoundID_Vibrate, ^{
        
    });
}
-(void)tjbtn{
    
}
-(void)acceptBtnClick{
    
}
-(void)aBtnClick{
    
}
-(void)bBtnClick{
    
}
@end
