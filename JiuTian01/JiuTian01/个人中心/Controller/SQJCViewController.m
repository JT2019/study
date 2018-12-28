//
//  JCSQViewController.m
//  JiuTian01
//
//  Created by Limy on 2018/12/24.
//  Copyright © 2018年 Limy. All rights reserved.
//

#import "SQJCViewController.h"
#import "PlaceholderTextView.h"
#import "SQJCTableViewCell.h"
@interface SQJCViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UILabel *userName;
@property(nonatomic,strong)UILabel *carIdZ;
@property(nonatomic,strong)UILabel *carIdG;
@property(nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong) PlaceholderTextView *textView;
@end

@implementation SQJCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createView];
}
-(void)createView{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width - ScaleWidth6(684), ScaleHeight6(32))];
    label.text = @"接车申请";
    label.font = [UIFont boldSystemFontOfSize:ScaleWidth6(32)];
    label.textColor = [UIColor whiteColor];
    [label setTextAlignment:NSTextAlignmentCenter];
    self.navigationItem.titleView = label;
    UILabel *proposer = [[UILabel alloc]initWithFrame:CGRectMake(ScaleWidth6(40), ScaleHeight6(20), ScaleWidth6(180), ScaleHeight6(24))];
    proposer.textColor= [Tools colorWithHexString:@"4a4a4a"];
    proposer.text = @"申请人：";
    proposer.font = [UIFont systemFontOfSize:ScaleWidth6(24)];
    [self.view addSubview:proposer];
    _userName = [[UILabel alloc]initWithFrame:CGRectMake(ScaleWidth6(245), ScaleHeight6(20), ScaleWidth6(120), ScaleHeight6(24))];
    _userName.textColor= [Tools colorWithHexString:@"4a4a4a"];
    _userName.text = @"丁一一";
    _userName.font = [UIFont systemFontOfSize:ScaleWidth6(24)];
    [self.view addSubview:_userName];
    for (int i = 1; i<4; i++) {
        UIView *border = [[UIView alloc]initWithFrame:CGRectMake(0, ScaleHeight6(68)*i, ScreenWidth, ScaleHeight6(1))];
        border.backgroundColor = [Tools colorWithHexString:@"b1b1b1"];
        [self.view addSubview:border];
    }
    UILabel *jcid = [[UILabel alloc]initWithFrame:CGRectMake(ScaleWidth6(40),MaxY(proposer.frame)+ScaleHeight6(45), ScaleWidth6(190), ScaleHeight6(24))];
    jcid.textColor= [Tools colorWithHexString:@"4a4a4a"];
    jcid.text = @"接车车牌号(主)：";
    jcid.font = [UIFont systemFontOfSize:ScaleWidth6(24)];
    [self.view addSubview:jcid];
    _carIdZ = [[UILabel alloc]initWithFrame:CGRectMake(ScaleWidth6(245),MaxY(proposer.frame)+ScaleHeight6(45) , ScaleWidth6(150), ScaleHeight6(24))];
    _carIdZ.textColor= [Tools colorWithHexString:@"4a4a4a"];
    _carIdZ.text = @"吉B 55555";
    _carIdZ.font = [UIFont systemFontOfSize:ScaleWidth6(24)];
    [self.view addSubview:_carIdZ];
    UILabel *jcidg = [[UILabel alloc]initWithFrame:CGRectMake(ScaleWidth6(40),MaxY(jcid.frame)+ScaleHeight6(45), ScaleWidth6(190), ScaleHeight6(24))];
    jcidg.textColor= [Tools colorWithHexString:@"4a4a4a"];
    jcidg.text = @"接车车牌号(挂)：";
    jcidg.font = [UIFont systemFontOfSize:ScaleWidth6(24)];
    [self.view addSubview:jcidg];
    _carIdG = [[UILabel alloc]initWithFrame:CGRectMake(ScaleWidth6(245),MaxY(_carIdZ.frame)+ScaleHeight6(45) , ScaleWidth6(150), ScaleHeight6(24))];
    _carIdG.textColor= [Tools colorWithHexString:@"4a4a4a"];
    _carIdG.text = @"吉B 66666";
    _carIdG.font = [UIFont systemFontOfSize:ScaleWidth6(24)];
    [self.view addSubview:_carIdG];
    
    _textView =[[PlaceholderTextView alloc] initWithFrame:CGRectMake(ScaleWidth6(40),MaxY(_carIdG.frame) +ScaleHeight6(68), ScaleWidth6(670), ScaleHeight6(206))];
    _textView.placeholderLabel.font =[UIFont systemFontOfSize:ScaleWidth6(20)];
    _textView.placeholder = @"接车备注：s缺失工作灯3个、扳手一个";
    _textView.font = [UIFont systemFontOfSize:ScaleHeight6(20)];
    _textView.maxLength = 100;
    _textView.layer.cornerRadius = ScaleWidth6(8);
    _textView.layer.borderColor = [Tools colorWithHexString:@"#999999"].CGColor;
    _textView.layer.borderWidth = ScaleWidth6(1);
    _textView.backgroundColor =[Tools colorWithHexString:@"#f5f3f3"];
    [self.view addSubview:_textView];
    UIView *bor = [[UIView alloc]initWithFrame:CGRectMake(0, MaxY(_textView.frame)+ScaleHeight6(40), ScreenWidth, ScaleHeight6(1))];
    bor.backgroundColor = [Tools colorWithHexString:@"b1b1b1"];
    [self.view addSubview:bor];
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, ScaleHeight6(495), ScreenWidth, ScaleHeight6(545)) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate=self;
    _tableView.backgroundColor = whriteColor;
    _tableView.showsVerticalScrollIndicator =NO;
    _tableView.separatorStyle = UITableViewCellEditingStyleNone;
    [self.view addSubview:_tableView];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SQJCTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    NSArray *img = @[@"随车附件",@"标志标示",@"防护用品"];
    NSArray *commit =@[@"已提交",@"未提交",@"未提交"];
    NSArray *type =@[@"合格",@"不合格",@"不合格"];
    if (!cell) {
        cell=[[SQJCTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle =UITableViewCellSelectionStyleNone;
        cell.img.image=[UIImage imageNamed:img[indexPath.row]];
        cell.textl.text = img[indexPath.row];
        cell.commit.text = commit[indexPath.row];
        cell.typel.text = type[indexPath.row];
    }
    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *FootbackV =[[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScaleHeight6(245))];
    FootbackV.backgroundColor =whriteColor;
    UIButton *Submitbtn =[UIButton buttonWithType:UIButtonTypeCustom];
    Submitbtn.frame =CGRectMake(ScaleWidth6(40), ScaleHeight6(160), ScaleWidth6(670), ScaleHeight6(80));
    [Submitbtn setBackgroundImage:[UIImage imageNamed:@"提交"] forState:BtnNormal];
    [Submitbtn addTarget:self action:@selector(SubmitbtnClick) forControlEvents:BtnTouchUpInside];
    [FootbackV addSubview:Submitbtn];
    return FootbackV;
}
-(void)SubmitbtnClick{
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return ScaleHeight6(100);
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return ScaleHeight6(240);
}
-(void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}
@end
