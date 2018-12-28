//
//  TabBarViewController.m
//  JiuTian01
//
//  Created by Limy on 2018/12/14.
//  Copyright © 2018年 Limy. All rights reserved.
//

#import "TabBarViewController.h"
#import "NavViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController
-(id)init{
    self= [super init];
    if (self) {
        FirstViewController *firstVC = [[FirstViewController alloc]init];
        
        NavViewController *nav1  = [[NavViewController alloc]initWithRootViewController:firstVC];
        [nav1.tabBarItem setImage:[[UIImage imageNamed:@"首页-l"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [nav1.tabBarItem setSelectedImage:[[UIImage imageNamed:@"首页"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        nav1.title = @"首页";
        
        SecondViewController *secondVC = [[SecondViewController alloc]init];
        NavViewController *nav2 = [[NavViewController alloc]initWithRootViewController:secondVC];
        [nav2.tabBarItem setImage:[[UIImage imageNamed:@"派车单-l"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [nav2.tabBarItem setSelectedImage:[[UIImage imageNamed:@"派车单"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        nav2.title = @"派车单";
        
        ThirdViewController *thirdVC = [[ThirdViewController alloc]init];
        NavViewController *nav3 = [[NavViewController alloc]initWithRootViewController:thirdVC];
        [nav3.tabBarItem setImage:[[UIImage imageNamed:@"个人中心-l"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [nav3.tabBarItem setSelectedImage:[[UIImage imageNamed:@"个人中心"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        nav3.title = @"个人中心";
        
        self.viewControllers = @[nav1,nav2,nav3];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self tabbar];
    // Do any additional setup after loading the view.
}
-(void)tabbar{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, kHeight_TabBar)];
    view.backgroundColor = [UIColor whiteColor];
    [self.tabBar insertSubview:view atIndex:0];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
