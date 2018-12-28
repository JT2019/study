//
//  PCDXQViewController.m
//  JiuTian01
//
//  Created by Limy on 2018/12/26.
//  Copyright © 2018年 Limy. All rights reserved.
//

#import "PCDXQViewController.h"
#import "HYCircleProgressView.h"
@interface PCDXQViewController ()
@property (nonatomic,strong) UIImageView *headV;
@property (nonatomic,strong) UILabel *nameL;
@property (nonatomic,strong) UILabel *SNameL;
@property (nonatomic,strong) UILabel *locationL;
@property (nonatomic,strong) UILabel *typeL;
@property (nonatomic,strong) UILabel *currentRouteL;
@property (nonatomic,strong) UILabel *totalRouteL;
@property (nonatomic,strong) UILabel *danRouteL;
@property (nonatomic,strong) UILabel *zhongRouteL;
@property (nonatomic,strong) HYCircleProgressView *progressView;
@property (nonatomic,strong) UILabel *UserMoneyL;
@property (nonatomic,strong) UILabel *CarInformationL;
@property (nonatomic,strong) UILabel *CarNumberL;
@property (nonatomic,strong) UILabel *CarRouteL;
@property (nonatomic,strong) UILabel *CarExpectTimeL;
@property (nonatomic,strong) UILabel *CarfactTimeL;
@property (nonatomic,strong) UILabel *ExpectArriveTimeL;
@property (nonatomic,strong) UILabel *factArriveTimeL;
@property (nonatomic,strong) UILabel *OrNeedL;
@property (nonatomic,strong) UILabel *LoadingL;
@property (nonatomic,strong) UILabel *UnloadL;
@end

@implementation PCDXQViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createView];
    [_progressView setProgress:0.9 animated:YES];
}
-(void)createView{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width - ScaleWidth6(684), ScaleHeight6(32))];
    label.text = @"个人中心";
    label.font = [UIFont boldSystemFontOfSize:ScaleWidth6(32)];
    label.textColor = [UIColor whiteColor];
    [label setTextAlignment:NSTextAlignmentCenter];
    self.navigationItem.titleView = label; UIView *blueV =[[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScaleHeight6(275))];
    blueV.backgroundColor =ThemeColor;
    [self.view addSubview:blueV];
    
    UIView *informationV =[[UIView alloc] initWithFrame:CGRectMake(ScaleWidth6(20), 0, ScaleWidth6(710), ScaleHeight6(1000))];
    informationV.backgroundColor =whriteColor;
    informationV.layer.borderColor =[Tools colorWithHexString:@"#c5c5c5"].CGColor;
    informationV.layer.borderWidth =ScaleWidth6(2);
    informationV.layer.cornerRadius =ScaleHeight6(10);
    [self.view addSubview:informationV];
    
    _headV =[[UIImageView alloc] initWithFrame:CGRectMake(ScaleWidth6(20), ScaleHeight6(26), ScaleWidth6(160), ScaleHeight6(218))];
    _headV.backgroundColor =ThemeColor;
    [informationV addSubview:_headV];
    
    UILabel *DriveNameL =[[UILabel alloc] initWithFrame:CGRectMake(MaxX(_headV.frame)+ScaleWidth6(20), ScaleHeight6(28), ScaleWidth6(90), ScaleWidth6(22))];
    DriveNameL.textColor =grayWordColor;
    DriveNameL.text =@"驾驶员：";
    DriveNameL.font =[UIFont systemFontOfSize:ScaleWidth6(22)];
    [informationV addSubview:DriveNameL];
    _nameL =[[UILabel alloc] initWithFrame:CGRectMake(MaxX(DriveNameL.frame), MinY(DriveNameL.frame), ScaleWidth6(90), ScaleWidth6(22))];
    _nameL.textColor =grayWordColor;
    _nameL.text =@"等等等";
    _nameL.font =[UIFont systemFontOfSize:ScaleWidth6(22)];
    [informationV addSubview:_nameL];
    UILabel *SupercargoNameL =[[UILabel alloc] initWithFrame:CGRectMake(MaxX(_nameL.frame), MinY(DriveNameL.frame), ScaleWidth6(90), ScaleWidth6(22))];
    SupercargoNameL.textColor =grayWordColor;
    SupercargoNameL.text =@"押运员：";
    SupercargoNameL.font =[UIFont systemFontOfSize:ScaleWidth6(22)];
    [informationV addSubview:SupercargoNameL];
    _SNameL =[[UILabel alloc] initWithFrame:CGRectMake(MaxX(SupercargoNameL.frame), MinY(DriveNameL.frame), ScaleWidth6(90), ScaleWidth6(22))];
    _SNameL.textColor =grayWordColor;
    _SNameL.text =@"等等等";
    _SNameL.font =[UIFont systemFontOfSize:ScaleWidth6(22)];
    [informationV addSubview:_SNameL];
    
    UILabel *LocationNameL =[[UILabel alloc] initWithFrame:CGRectMake(MaxX(_headV.frame)+ScaleWidth6(16), MaxY(DriveNameL.frame) +ScaleHeight6(18), ScaleWidth6(90), ScaleWidth6(22))];
    LocationNameL.textColor =grayWordColor;
    LocationNameL.text =@"办事处：";
    LocationNameL.font =[UIFont systemFontOfSize:ScaleWidth6(22)];
    [informationV addSubview:LocationNameL];
    _locationL =[[UILabel alloc] initWithFrame:CGRectMake(MaxX(LocationNameL.frame), MinY(LocationNameL.frame), ScaleWidth6(90), ScaleWidth6(22))];
    _locationL.textColor =grayWordColor;
    _locationL.text =@"等等等";
    _locationL.font =[UIFont systemFontOfSize:ScaleWidth6(22)];
    [informationV addSubview:_locationL];
    UILabel *typeNameL =[[UILabel alloc] initWithFrame:CGRectMake(MaxX(_locationL.frame), MinY(LocationNameL.frame), ScaleWidth6(115), ScaleWidth6(22))];
    typeNameL.textColor =grayWordColor;
    typeNameL.text =@"燃料类型：";
    typeNameL.font =[UIFont systemFontOfSize:ScaleWidth6(22)];
    [informationV addSubview:typeNameL];
    _typeL =[[UILabel alloc] initWithFrame:CGRectMake(MaxX(typeNameL.frame), MinY(typeNameL.frame), ScaleWidth6(70), ScaleWidth6(22))];
    _typeL.textColor =grayWordColor;
    _typeL.text =@"柴油";
    _typeL.font =[UIFont systemFontOfSize:ScaleWidth6(22)];
    [informationV addSubview:_typeL];
    
    _currentRouteL =[[UILabel alloc] initWithFrame:CGRectMake(MinX(LocationNameL.frame), MaxY(_locationL.frame) +ScaleHeight6(16), ScaleWidth6(320), ScaleWidth6(22))];
    _currentRouteL.textColor =grayWordColor;
    _currentRouteL.text =@"当月里程：3219Km";
    _currentRouteL.font =[UIFont systemFontOfSize:ScaleWidth6(22)];
    [informationV addSubview:_currentRouteL];
    
    _totalRouteL =[[UILabel alloc] initWithFrame:CGRectMake(MinX(_currentRouteL.frame), MaxY(_currentRouteL.frame) +ScaleHeight6(16), ScaleWidth6(320), ScaleWidth6(22))];
    _totalRouteL.textColor =grayWordColor;
    _totalRouteL.text =@"总计里程：3219Km";
    _totalRouteL.font =[UIFont systemFontOfSize:ScaleWidth6(22)];
    [informationV addSubview:_totalRouteL];
    
    _danRouteL =[[UILabel alloc] initWithFrame:CGRectMake(MinX(_totalRouteL.frame), MaxY(_totalRouteL.frame) +ScaleHeight6(16), ScaleWidth6(320), ScaleWidth6(22))];
    _danRouteL.textColor =grayWordColor;
    _danRouteL.text =@"单空行驶里程：3219Km";
    _danRouteL.font =[UIFont systemFontOfSize:ScaleWidth6(22)];
    [informationV addSubview:_danRouteL];
    
    _zhongRouteL =[[UILabel alloc] initWithFrame:CGRectMake(MinX(_danRouteL.frame), MaxY(_danRouteL.frame) +ScaleHeight6(16), ScaleWidth6(320), ScaleWidth6(22))];
    _zhongRouteL.textColor =grayWordColor;
    _zhongRouteL.text =@"重空行驶里程：3219Km";
    _zhongRouteL.font =[UIFont systemFontOfSize:ScaleWidth6(22)];
    [informationV addSubview:_zhongRouteL];
    
    _progressView = [[HYCircleProgressView alloc]initWithFrame:CGRectMake(ScaleWidth6(710) -ScaleWidth6(30) -ScaleWidth6(140), ScaleHeight6(105), ScaleWidth6(140), ScaleHeight6(140))];
    [informationV addSubview:_progressView];
    
    _progressView.progressLineWidth =ScaleWidth6(10);
    _progressView.backgroundLineWidth =ScaleWidth6(10);
    [_progressView setBackgroundStrokeColor:[Tools colorWithHexString:@"#dddddd"]];
    [_progressView setProgressStrokeColor:[Tools colorWithHexString:@"#17b891"]];
    
    
    UILabel *moneyL =[[UILabel alloc] initWithFrame:CGRectMake(0, ScaleHeight6(32), ScaleWidth6(140), ScaleWidth6(16))];
    moneyL.textColor =grayWordColor;
    moneyL.text =@"备用金额:";
    moneyL.textAlignment =NSTextAlignmentCenter;
    moneyL.font =[UIFont systemFontOfSize:ScaleWidth6(16)];
    [_progressView addSubview:moneyL];
    
    _UserMoneyL =[[UILabel alloc] initWithFrame:CGRectMake(0, MaxY(moneyL.frame) +ScaleHeight6(16), ScaleWidth6(140), ScaleWidth6(26))];
    _UserMoneyL.textColor =grayWordColor;
    _UserMoneyL.text =@"10600元";
    _UserMoneyL.textAlignment =NSTextAlignmentCenter;
    _UserMoneyL.font =[UIFont systemFontOfSize:ScaleWidth6(26)];
    [_progressView addSubview:_UserMoneyL];
    
    NSArray *imageArr =@[@"商品信息：",@"路线信息：",@"预计出发时间：",@"实际出发时间：",@"预计到达时间：",@"实际到达时间：",@"装车吨数：",@"卸车吨数：",@"蒸罐清洗："];
    for (int i =0; i <9; i++) {
        UIImageView *imageV =[[UIImageView alloc] initWithFrame:CGRectMake(ScaleWidth6(20),MaxY(_headV.frame) +ScaleHeight6(40) +ScaleHeight6(80)*i, ScaleWidth6(44), ScaleHeight6(44))];
        imageV.image =[UIImage imageNamed:imageArr[i]];
        [informationV addSubview:imageV];
        
        UILabel *titleL =[[UILabel alloc] initWithFrame:CGRectMake(MaxX(imageV.frame) +ScaleWidth6(20), MinY(imageV.frame) +ScaleHeight6(11), ScaleWidth6(160), ScaleWidth6(22))];
        titleL.textColor =[Tools colorWithHexString:@"#999999"];
        titleL.text =imageArr[i];
        titleL.font =[UIFont systemFontOfSize:ScaleWidth6(22)];
        titleL.textAlignment =NSTextAlignmentCenter;
        [informationV addSubview:titleL];
        
        if (i ==0) {
            _CarInformationL =[[UILabel alloc] initWithFrame:CGRectMake(MaxX(titleL.frame), MinY(titleL.frame), ScaleWidth6(180), ScaleWidth6(22))];
            _CarInformationL.textColor =grayWordColor;
            _CarInformationL.font =[UIFont systemFontOfSize:ScaleWidth6(22)];
            _CarInformationL.text =@"乙醇";
            [informationV addSubview:_CarInformationL];
            UILabel *numberL =[[UILabel alloc] initWithFrame:CGRectMake(MaxX(_CarInformationL.frame), MinY(titleL.frame), ScaleWidth6(140), ScaleWidth6(22))];
            numberL.textColor =[Tools colorWithHexString:@"#999999"];
            numberL.font =[UIFont systemFontOfSize:ScaleWidth6(22)];
            numberL.text =@"派车单编号：";
            [informationV addSubview:numberL];
            _CarNumberL =[[UILabel alloc] initWithFrame:CGRectMake(MaxX(numberL.frame), MinY(numberL.frame), ScaleWidth6(160), ScaleWidth6(22))];
            _CarNumberL.textColor =grayWordColor;
            _CarNumberL.font =[UIFont systemFontOfSize:ScaleWidth6(22)];
            _CarNumberL.text =@"12312e2123";
            [informationV addSubview:_CarNumberL];
        }else if (i ==1){
            _CarRouteL =[[UILabel alloc] initWithFrame:CGRectMake(MaxX(titleL.frame), MinY(titleL.frame), ScaleWidth6(500), ScaleWidth6(22))];
            _CarRouteL.textColor =grayWordColor;
            _CarRouteL.font =[UIFont systemFontOfSize:ScaleWidth6(22)];
            _CarRouteL.text =@"吉林——沈阳——大连——青岛";
            _CarRouteL.userInteractionEnabled =YES;
            UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick)];
            [_CarRouteL addGestureRecognizer:tap];
            [informationV addSubview:_CarRouteL];
        }else if (i ==2){
            _CarExpectTimeL =[[UILabel alloc] initWithFrame:CGRectMake(MaxX(titleL.frame), MinY(titleL.frame), ScaleWidth6(500), ScaleWidth6(22))];
            _CarExpectTimeL.textColor =grayWordColor;
            _CarExpectTimeL.font =[UIFont systemFontOfSize:ScaleWidth6(22)];
            _CarExpectTimeL.text =@"2018年10月29日";
            [informationV addSubview:_CarExpectTimeL];
        }else if (i ==3){
            _CarfactTimeL =[[UILabel alloc] initWithFrame:CGRectMake(MaxX(titleL.frame), MinY(titleL.frame), ScaleWidth6(500), ScaleWidth6(22))];
            _CarfactTimeL.textColor =grayWordColor;
            _CarfactTimeL.font =[UIFont systemFontOfSize:ScaleWidth6(22)];
            _CarfactTimeL.text =@"2018年10月29日";
            [informationV addSubview:_CarfactTimeL];
        }else if (i ==4){
            _ExpectArriveTimeL =[[UILabel alloc] initWithFrame:CGRectMake(MaxX(titleL.frame), MinY(titleL.frame), ScaleWidth6(500), ScaleWidth6(22))];
            _ExpectArriveTimeL.textColor =grayWordColor;
            _ExpectArriveTimeL.font =[UIFont systemFontOfSize:ScaleWidth6(22)];
            _ExpectArriveTimeL.text =@"2018年10月29日";
            [informationV addSubview:_ExpectArriveTimeL];
        }else if (i ==5){
            _factArriveTimeL =[[UILabel alloc] initWithFrame:CGRectMake(MaxX(titleL.frame), MinY(titleL.frame), ScaleWidth6(500), ScaleWidth6(22))];
            _factArriveTimeL.textColor =grayWordColor;
            _factArriveTimeL.font =[UIFont systemFontOfSize:ScaleWidth6(22)];
            _factArriveTimeL.text =@"2018年10月29日";
            [informationV addSubview:_factArriveTimeL];
        }else if (i ==6){
            _LoadingL =[[UILabel alloc] initWithFrame:CGRectMake(MaxX(titleL.frame), MinY(titleL.frame), ScaleWidth6(325), ScaleWidth6(22))];
            _LoadingL.textColor =[Tools colorWithHexString:@"#999999"];
            _LoadingL.font =[UIFont systemFontOfSize:ScaleWidth6(22)];
            _LoadingL.text =@"请点击后面加号进行上传.";
            [informationV addSubview:_LoadingL];
            
            
        }else if (i ==7){
            _UnloadL =[[UILabel alloc] initWithFrame:CGRectMake(MaxX(titleL.frame), MinY(titleL.frame), ScaleWidth6(325), ScaleWidth6(22))];
            _UnloadL.textColor =[Tools colorWithHexString:@"#999999"];
            _UnloadL.font =[UIFont systemFontOfSize:ScaleWidth6(22)];
            _UnloadL.text =@"请点击后面加号进行上传.";
            [informationV addSubview:_UnloadL];
            
        }else{
            _OrNeedL =[[UILabel alloc] initWithFrame:CGRectMake(MaxX(titleL.frame), MinY(titleL.frame), ScaleWidth6(500), ScaleWidth6(22))];
            _OrNeedL.textColor =grayWordColor;
            _OrNeedL.font =[UIFont systemFontOfSize:ScaleWidth6(22)];
            _OrNeedL.text =@"需要/不需要";
            [informationV addSubview:_OrNeedL];
        }
        
        
        UIView *lineV =[[UIView alloc] initWithFrame:CGRectMake(MinX(imageV.frame), MaxY(imageV.frame) +ScaleHeight6(18), ScaleWidth6(670), ScaleHeight6(1))];
        lineV.backgroundColor =grayWordColor;
        [informationV addSubview:lineV];
        if (i ==8) {
            lineV.hidden =YES;
        }
    }
    
}
-(void)tapClick{
    
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
