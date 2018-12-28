//
//  AllTruckingViewController.m
//  JiuTian01
//
//  Created by Limy on 2018/12/25.
//  Copyright © 2018年 Limy. All rights reserved.
//

#import "AllTruckingViewController.h"
#import "RHFiltrateView.h"
#import "AllTruckingTableViewCell.h"
#import "PCDXQViewController.h"
#import "yymodel.h"
@interface AllTruckingViewController ()<UITableViewDelegate,UITableViewDataSource,RHFiltrateViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong) UIButton *TotalsortBtn;
@property (nonatomic,strong) UIImageView *TotalsortV;
@property (nonatomic,strong) UIButton *mouthSortBtn;
@property (nonatomic,strong) UIImageView *mouthSortV;
@property (nonatomic,strong) UIButton *yearSortBtn;
@property (nonatomic,strong) UIImageView *yearSortV;
@property (nonatomic,strong) UIView *markView;
@property (nonatomic,strong) RHFiltrateView * filtrate;
@property (nonatomic,strong) RHFiltrateView * filtrate1;
@property (nonatomic,strong) RHFiltrateView * filtrate2;
@property (nonatomic,strong) yymodel *dispatchLists;
@property(nonatomic,strong)  NSMutableArray *str;
@property(nonatomic,strong)  NSMutableArray *muary;
@property(nonatomic,strong)  NSMutableArray *muarray;
@property(nonatomic,strong)  NSMutableArray *dispatch;
@end

@implementation AllTruckingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self AFN];
}

-(void)AFN{
    NSString *URL =[NSString stringWithFormat:@"%@%@",CH_MainUrl,CH_Url_personalDispatchList];
    NSDictionary *param =@{@"deviceId":getUserDefault(@"deviceId"),@"token":getUserDefault(@"token")};
    [NetWorkingTools PostWithURL:URL params:param success:^(id json) {
        NSLog(@"%@",json);
        self.dispatchLists = [yymodel yy_modelWithDictionary:json];
        NSLog(@"%@",self.dispatchLists);
        self.str =[NSMutableArray new];
        self.muary = [NSMutableArray new];
        self.muarray=[NSMutableArray new];
        self.dispatch = [NSMutableArray new];
        for (YYmonth *model in self.dispatchLists.month) {
            NSString *strr = [model valueForKey:@"name"];
            [self.str addObject:strr];
        }
        for (YYparticularYear *model in self.dispatchLists.particularYear) {
            NSString *strr = [model valueForKey:@"name"];
            [self.muary addObject:strr];
        }
        for (YYcomprehensive *model in self.dispatchLists.comprehensive) {
            NSString *strr = [model valueForKey:@"name"];
            [self.muarray addObject:strr];
        }

        [self createView];
    } failure:^(NSError *error) {
        
    }];
}

-(void)createView{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width - ScaleWidth6(684), ScaleHeight6(32))];
    label.text = @"全部派车单";
    label.font = [UIFont boldSystemFontOfSize:ScaleWidth6(32)];
    label.textColor = [UIColor whiteColor];
    [label setTextAlignment:NSTextAlignmentCenter];
    self.navigationItem.titleView = label;
    
    UIView *topV =[[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScaleHeight6(72))];
    topV.backgroundColor =whriteColor;
    [self.view addSubview:topV];
    
    _TotalsortBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    _TotalsortBtn.frame =CGRectMake(ScaleWidth6(40), ScaleHeight6(25), ScaleWidth6(90), ScaleWidth6(22));
    _TotalsortBtn.titleLabel.font =[UIFont systemFontOfSize:ScaleWidth6(22)];
    [_TotalsortBtn setTitle:@"综合排序" forState:BtnNormal];
    [_TotalsortBtn setTitleColor:ThemeColor forState:BtnStateSelected];
    [_TotalsortBtn setTitleColor:grayWordColor forState:BtnNormal];
    [_TotalsortBtn addTarget:self action:@selector(TotalsortBtnClick:) forControlEvents:BtnTouchUpInside];
    [topV addSubview:_TotalsortBtn];
    
    _TotalsortV =[[UIImageView alloc] initWithFrame:CGRectMake(MaxX(_TotalsortBtn.frame) +ScaleWidth6(5), MinY(_TotalsortBtn.frame) +ScaleHeight6(6), ScaleWidth6(16), ScaleHeight6(10))];
    _TotalsortV.image =[UIImage imageNamed:@"xia"];
    [topV addSubview:_TotalsortV];
    
    _mouthSortBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    _mouthSortBtn.frame =CGRectMake(MaxX(_TotalsortBtn.frame) +ScaleWidth6(165), MinY(_TotalsortBtn.frame), ScaleWidth6(90), ScaleWidth6(22));
    _mouthSortBtn.titleLabel.font =[UIFont systemFontOfSize:ScaleWidth6(22)];
    [_mouthSortBtn setTitle:@"月份排序" forState:BtnNormal];
    [_mouthSortBtn setTitleColor:ThemeColor forState:BtnStateSelected];
    [_mouthSortBtn setTitleColor:grayWordColor forState:BtnNormal];
    [_mouthSortBtn addTarget:self action:@selector(mouthSortBtnClick:) forControlEvents:BtnTouchUpInside];
    [topV addSubview:_mouthSortBtn];
    
    _mouthSortV =[[UIImageView alloc] initWithFrame:CGRectMake(MaxX(_mouthSortBtn.frame) +ScaleWidth6(5), MinY(_mouthSortBtn.frame) +ScaleHeight6(6), ScaleWidth6(16), ScaleHeight6(10))];
    _mouthSortV.image =[UIImage imageNamed:@"xia"];
    [topV addSubview:_mouthSortV];
    
    _yearSortBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    _yearSortBtn.frame =CGRectMake(MaxX(_mouthSortBtn.frame) +ScaleWidth6(165), MinY(_TotalsortBtn.frame), ScaleWidth6(90), ScaleWidth6(22));
    _yearSortBtn.titleLabel.font =[UIFont systemFontOfSize:ScaleWidth6(22)];
    [_yearSortBtn setTitle:@"年份排序" forState:BtnNormal];
    [_yearSortBtn setTitleColor:ThemeColor forState:BtnStateSelected];
    [_yearSortBtn setTitleColor:grayWordColor forState:BtnNormal];
    [_yearSortBtn addTarget:self action:@selector(yearSortBtnClick:) forControlEvents:BtnTouchUpInside];
    [topV addSubview:_yearSortBtn];
    
    _yearSortV =[[UIImageView alloc] initWithFrame:CGRectMake(MaxX(_yearSortBtn.frame) +ScaleWidth6(5), MinY(_yearSortBtn.frame) +ScaleHeight6(6), ScaleWidth6(16), ScaleHeight6(10))];
    _yearSortV.image =[UIImage imageNamed:@"xia"];
    [topV addSubview:_yearSortV];
    
    UIView *lineV =[[UIView alloc] initWithFrame:CGRectMake(0, MaxY(_TotalsortBtn.frame) +ScaleHeight6(24), ScreenWidth, ScaleHeight6(1))];
    lineV.backgroundColor =[Tools colorWithHexString:@"b1b1b1"];
    [topV addSubview:lineV];
    
    _tableView =[[UITableView alloc] initWithFrame:CGRectMake(0, MaxY(topV.frame), ScreenWidth, ScreenHeight -ScaleHeight6(97) -ScaleHeight6(44) -ScaleHeight6(72)) style:UITableViewStylePlain];
    _tableView.delegate =self;
    _tableView.dataSource =self;
    _tableView.separatorStyle =UITableViewCellSeparatorStyleNone;
    _tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_tableView];
    
    
    _markView =[[UIView alloc] initWithFrame:CGRectMake(0, MaxY(topV.frame), ScreenWidth, ScreenHeight)];
    _markView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    _markView.userInteractionEnabled =YES;
    _markView.hidden =YES;
    [self.view addSubview:_markView];
    
    _filtrate = [[RHFiltrateView alloc] initWithTitles:@[@""] items:@[self.muarray]];
    _filtrate.frame = CGRectMake(0, 0, ScreenWidth, ScaleHeight6(210));
    _filtrate.delegate = self;
    _filtrate.hidden =YES;
    [_markView addSubview:_filtrate];
    
    _filtrate1 = [[RHFiltrateView alloc] initWithTitles:@[@""] items:@[self.str]];
    _filtrate1.frame = CGRectMake(0, 0, ScreenWidth, ScaleHeight6(300));
    _filtrate1.delegate = self;
    _filtrate1.hidden =YES;
    [_markView addSubview:_filtrate1];
    
    _filtrate2 = [[RHFiltrateView alloc] initWithTitles:@[@""] items:@[self.muary]];
    _filtrate2.frame = CGRectMake(0, 0, ScreenWidth, ScaleHeight6(210));
    _filtrate2.delegate = self;
    _filtrate2.hidden =YES;
    [_markView addSubview:_filtrate2];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dispatchLists.dispatchList.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AllTruckingTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell =[[AllTruckingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    YYdispatchList *dic = self.dispatchLists.dispatchList[indexPath.row];
    NSString *str = [NSString stringWithFormat:@"里程：%@公里 用时：%@ 商品：%@ 单位：%@",dic.mileage,dic.useTime,dic.commodityInformation,dic.tonnageOfUnloading];
    cell.message.text =str;
    cell.day.text = dic.day;
    cell.month.text = dic.month;
    cell.year.text = @"2018年";
    cell.carId.text = dic.singleCarNumber;
    cell.initial.text = dic.origin;
    cell.terminus.text = dic.destination;
    
    cell.selectionStyle =UITableViewCellSelectionStyleNone;
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    PCDXQViewController *vc = [[PCDXQViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return ScaleHeight6(245);
}
-(void)TotalsortBtnClick:(UIButton*)btn{
    btn.selected = !btn.selected;
    if (btn.selected ==YES) {
        _TotalsortV.image =[UIImage imageNamed:@"shang"];
        _mouthSortV.image =[UIImage imageNamed:@"xia"];
        _yearSortV.image =[UIImage imageNamed:@"xia"];
        _mouthSortBtn.selected =NO;
        _yearSortBtn.selected =NO;
        _markView.hidden =NO;
        _filtrate.hidden =NO;
        _filtrate1.hidden =YES;
        _filtrate2.hidden =YES;
    }else{
        _TotalsortV.image =[UIImage imageNamed:@"xia"];
        _markView.hidden =YES;
        _filtrate.hidden =YES;
        _filtrate1.hidden =YES;
        _filtrate2.hidden =YES;
    }
}
-(void)mouthSortBtnClick:(UIButton*)btn{
    btn.selected = !btn.selected;
    if (btn.selected ==YES) {
        _TotalsortV.image =[UIImage imageNamed:@"xia"];
        _mouthSortV.image =[UIImage imageNamed:@"shang"];
        _yearSortV.image =[UIImage imageNamed:@"xia"];
        _TotalsortBtn.selected =NO;
        _yearSortBtn.selected =NO;
        _markView.hidden =NO;
        _filtrate.hidden =YES;
        _filtrate1.hidden =NO;
        _filtrate2.hidden =YES;
    }else{
        _mouthSortV.image =[UIImage imageNamed:@"xia"];
        _markView.hidden =YES;
        _filtrate.hidden =YES;
        _filtrate1.hidden =YES;
        _filtrate2.hidden =YES;
    }
}
-(void)yearSortBtnClick:(UIButton*)btn{
    btn.selected = !btn.selected;
    if (btn.selected ==YES) {
        _TotalsortV.image =[UIImage imageNamed:@"xia"];
        _mouthSortV.image =[UIImage imageNamed:@"xia"];
        _yearSortV.image =[UIImage imageNamed:@"shang"];
        _mouthSortBtn.selected =NO;
        _TotalsortBtn.selected =NO;
        _markView.hidden =NO;
        _filtrate.hidden =YES;
        _filtrate1.hidden =YES;
        _filtrate2.hidden =NO;
    }else{
        _yearSortV.image =[UIImage imageNamed:@"xia"];
        _markView.hidden =YES;
        _filtrate.hidden =YES;
        _filtrate1.hidden =YES;
        _filtrate2.hidden =YES;
    }
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
