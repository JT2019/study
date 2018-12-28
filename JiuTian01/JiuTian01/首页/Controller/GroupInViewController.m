//
//  GroupInViewController.m
//  JiuTian01
//
//  Created by Limy on 2018/12/24.
//  Copyright © 2018年 Limy. All rights reserved.
//

#import "GroupInViewController.h"

@interface GroupInViewController ()
@property (nonatomic,strong) UIImageView *HeadImage;
@property (nonatomic,strong) UILabel *titleL;
@property (nonatomic,strong) UILabel *content;
@property (nonatomic,strong) UILabel *time;
@property (nonatomic,strong) UILabel *people;
@property (nonatomic,strong) UILabel *eye;
@property (nonatomic,strong) UILabel *zanNum;
@end

@implementation GroupInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createView];
}
-(void)createView{
UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width - ScaleWidth6(684), ScaleHeight6(32))];
label.text = @"集团通知";
label.font = [UIFont boldSystemFontOfSize:ScaleWidth6(32)];
label.textColor = [UIColor whiteColor];
[label setTextAlignment:NSTextAlignmentCenter];
self.navigationItem.titleView = label;
    
    UIScrollView *scrollView =[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    [self.view addSubview:scrollView];
    
    _HeadImage =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScaleHeight6(350))];
    _HeadImage.backgroundColor =ThemeColor;
    [scrollView addSubview:_HeadImage];
    _titleL =[[UILabel alloc] initWithFrame:CGRectMake(0, MaxY(_HeadImage.frame) +ScaleHeight6(30), ScreenWidth, ScaleWidth6(28))];
    _titleL.textColor =grayWordColor;
    _titleL.font =[UIFont systemFontOfSize:ScaleWidth6(28)];
    _titleL.text =@"2018年全员培训大会开始报名";
    _titleL.textAlignment =NSTextAlignmentCenter;
    [scrollView addSubview:_titleL];
    UIView *lineV =[[UIView alloc] initWithFrame:CGRectMake(ScaleWidth6(40), MaxY(_titleL.frame) +ScaleHeight6(40), ScaleWidth6(670), ScaleHeight6(1))];
    lineV.backgroundColor =grayWordColor;
    [scrollView addSubview:lineV];
    NSString *str =@"杀戮空间佛是的覅偶我就饿哦啊实打实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发杀戮空间佛是的覅偶我就饿哦啊实打实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发杀戮空间佛是的覅偶我就饿哦啊实打实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发杀戮空间佛是的覅偶我就饿哦啊实打实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发杀戮空间佛是的覅偶我就饿哦啊实打实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发杀戮空间佛是的覅偶我就饿哦啊实打实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发杀戮空间佛是的覅偶我就饿哦啊实打实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发杀戮空间佛是的覅偶我就饿哦啊实打实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发杀戮空间佛是的覅偶我就饿哦啊实打实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发杀戮空间佛是的覅偶我就饿哦啊实打实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发杀戮空间佛是的覅偶我就饿哦啊实打实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发杀戮空间佛是的覅偶我就饿哦啊实打实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发杀戮空间佛是的覅偶我就饿哦啊实打实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发杀戮空间佛是的覅偶我就饿哦啊实打实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发杀戮空间佛是的覅偶我就饿哦啊实打实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发杀戮空间佛是的覅偶我就饿哦啊实打实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发";
    CGFloat contentLabelHeight = [LabelHeight heightForString:str fontSize:ScaleWidth6(20) andWidth:ScaleWidth6(670)];
    _content =[[UILabel alloc] initWithFrame:CGRectMake(ScaleWidth6(40), MaxY(lineV.frame) +ScaleHeight6(38), ScaleWidth6(670), contentLabelHeight)];
    _content.textColor =grayWordColor;
    _content.numberOfLines =0;
    _content.font =[UIFont systemFontOfSize:ScaleWidth6(20)];
    _content.text =@"杀戮空间佛是的覅偶我就饿哦啊实打实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发杀戮空间佛是的覅偶我就饿哦啊实打实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发杀戮空间佛是的覅偶我就饿哦啊实打实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发杀戮空间佛是的覅偶我就饿哦啊实打实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发杀戮空间佛是的覅偶我就饿哦啊实打实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发杀戮空间佛是的覅偶我就饿哦啊实打实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发杀戮空间佛是的覅偶我就饿哦啊实打实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发杀戮空间佛是的覅偶我就饿哦啊实打实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发杀戮空间佛是的覅偶我就饿哦啊实打实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发杀戮空间佛是的覅偶我就饿哦啊实打实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发杀戮空间佛是的覅偶我就饿哦啊实打实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发杀戮空间佛是的覅偶我就饿哦啊实打实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发杀戮空间佛是的覅偶我就饿哦啊实打实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发杀戮空间佛是的覅偶我就饿哦啊实打实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发杀戮空间佛是的覅偶我就饿哦啊实打实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发杀戮空间佛是的覅偶我就饿哦啊实打实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发杀戮空间佛是的覅偶我就饿哦啊实打实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发杀戮空间佛是的覅偶我就饿哦啊实打实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发杀戮空间佛是的覅偶我就饿哦啊实打实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发杀戮空间佛是的覅偶我就饿哦啊实打实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发杀戮空间佛是的覅偶我就饿哦啊实打实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发杀戮空间佛是的覅偶我就饿哦啊实打实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发杀戮空间佛是的覅偶我就饿哦啊实打实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发杀戮空间佛是的覅偶我就饿哦啊实打实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发杀戮空间佛是的覅偶我就饿哦啊实打实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发杀戮空间佛是的覅偶我就饿哦啊实打实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发杀戮空间佛是的覅偶我就饿哦啊实打实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发杀戮空间佛是的覅偶我就饿哦啊实打实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发杀戮空间佛是的覅偶我就饿哦啊实打实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发杀戮空间佛是的覅偶我就饿哦啊实打实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发杀戮空间佛是的覅偶我就饿哦啊实打实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发杀戮空间佛是的覅偶我就饿哦啊实打实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发杀戮空间佛是的覅偶我就饿哦啊实打实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发杀戮空间佛是的覅偶我就饿哦啊实打实大师的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发";
    [scrollView addSubview:_content];
    _titleL =[[UILabel alloc] initWithFrame:CGRectMake(0, MaxY(_content.frame) +ScaleHeight6(70), ScreenWidth -ScaleWidth6(40), ScaleWidth6(20))];
    _titleL.textColor =grayWordColor;
    _titleL.font =[UIFont systemFontOfSize:ScaleWidth6(20)];
    _titleL.text =@"2018年全员培训大会开始报名";
    _titleL.textAlignment =NSTextAlignmentRight;
    [scrollView addSubview:_titleL];
    _time =[[UILabel alloc] initWithFrame:CGRectMake(0, MaxY(_titleL.frame) +ScaleHeight6(18), ScreenWidth -ScaleWidth6(40), ScaleWidth6(20))];
    _time.textColor =grayWordColor;
    _time.font =[UIFont systemFontOfSize:ScaleWidth6(20)];
    _time.text =@"2018.10.29";
    _time.textAlignment =NSTextAlignmentRight;
    [scrollView addSubview:_time];
    
    UIImageView *eyeV =[[UIImageView alloc] initWithFrame:CGRectMake(ScaleWidth6(40), MaxY(_time.frame) +ScaleHeight6(10), ScaleWidth6(24), ScaleHeight6(18))];
    eyeV.image =[UIImage imageNamed:@"浏览"];
    [scrollView addSubview:eyeV];
    
    _eye =[[UILabel alloc] initWithFrame:CGRectMake(MaxX(eyeV.frame) +ScaleWidth6(6), MinY(eyeV.frame) ,ScaleWidth6(40), ScaleWidth6(18))];
    _eye.textColor =ThemeColor;
    _eye.font =[UIFont systemFontOfSize:ScaleWidth6(18)];
    _eye.text =@"18";
    [scrollView addSubview:_eye];
    
    UIImageView *zanV =[[UIImageView alloc] initWithFrame:CGRectMake(MaxX(_eye.frame) +ScaleWidth6(12), MinY(eyeV.frame) -ScaleHeight6(2), ScaleWidth6(20), ScaleHeight6(20))];
    zanV.image =[UIImage imageNamed:@"点赞"];
    [scrollView addSubview:zanV];
    
    _zanNum =[[UILabel alloc] initWithFrame:CGRectMake(MaxX(zanV.frame) +ScaleWidth6(6), MinY(_eye.frame) ,ScaleWidth6(80), ScaleWidth6(18))];
    _zanNum.textColor =ThemeColor;
    _zanNum.font =[UIFont systemFontOfSize:ScaleWidth6(18)];
    _zanNum.text =@"18";
    [scrollView addSubview:_zanNum];
    
    scrollView.contentSize =CGSizeMake(ScreenWidth, ScaleHeight6(350) +ScaleHeight6(100) +ScaleHeight6(350) +contentLabelHeight);
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
