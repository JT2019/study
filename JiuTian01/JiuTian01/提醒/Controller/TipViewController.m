//
//  TipViewController.m
//  JiuTian01
//
//  Created by Limy on 2018/12/18.
//  Copyright © 2018年 Limy. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()
@property(nonatomic,strong)UILabel *unread;
@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self creaeView];
}
-(void)creaeView{
UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width - ScaleWidth6(684), ScaleHeight6(32))];
label.text = @"提醒";
label.font = [UIFont boldSystemFontOfSize:ScaleWidth6(32)];
label.textColor = [UIColor whiteColor];
[label setTextAlignment:NSTextAlignmentCenter];
self.navigationItem.titleView = label;
    UIView *head =[[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScaleHeight6(70))];
    head.backgroundColor =whriteColor;
    [self.view addSubview:head];
    _unread =[[UILabel alloc] initWithFrame:CGRectMake(ScaleWidth6(40), ScaleHeight6(24), ScaleWidth6(190), ScaleWidth6(22))];
    _unread.textColor =[Tools colorWithHexString:@"#777777"];
    _unread.font =[UIFont systemFontOfSize:ScaleHeight6(22)];
    _unread.text =@"未读信息12条";
    [head addSubview:_unread];
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
