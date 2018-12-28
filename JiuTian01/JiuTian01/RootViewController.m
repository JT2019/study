//
//  RootViewController.m
//  JiuTian01
//
//  Created by Limy on 2018/12/14.
//  Copyright © 2018年 Limy. All rights reserved.
//

#import "RootViewController.h"
#import "MBProgressHUD+MJ.h"
//#import "BaseClass/TabBarViewController.h"
#import "TabBarViewController.h"
#import "AppDelegate.h"
@interface RootViewController ()<UITextFieldDelegate>
@property(nonatomic,strong)UITextField *Id;
@property(nonatomic,strong)UITextField *Password;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if ([Tools isEmpty:getUserDefault(@"token")]) {
        [self loadView];
        [self loginView];
    }else{
        [self next];
    }
}

-(void)loginView{
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *head = [[UIImageView alloc]initWithFrame:CGRectMake(ScaleWidth6(256), ScaleHeight6(200), ScaleWidth6(240), ScaleHeight6(244))];
    head.image = [UIImage imageNamed:@"头像"];
    [self.view addSubview:head];
    UIView *login= [[UIView alloc]initWithFrame:CGRectMake(ScaleWidth6(65), CGRectGetMaxY(head.frame)+ScaleHeight6(100), ScaleWidth6(620), ScaleHeight6(220))];
    login.layer.borderColor = RGBA(211,211,211,1.0).CGColor;
    login.layer.borderWidth = ScaleWidth6(1);
    login.layer.cornerRadius = ScaleWidth6(25);
    [self.view addSubview:login];
    UIImageView *idimg = [[UIImageView alloc]initWithFrame:CGRectMake(ScaleWidth6(34), ScaleHeight6(34), ScaleWidth6(40), ScaleHeight6(40))];
    idimg.image = [UIImage imageNamed:@"icon_用户名"];
    [login addSubview:idimg];
    _Id = [[UITextField alloc]initWithFrame:CGRectMake(ScaleWidth6(108), 0, ScaleWidth6(490), ScaleHeight6(108))];
    _Id.placeholder = @"请输入用户账号";
    _Id.delegate = self;
    _Id.font = [UIFont systemFontOfSize:ScaleWidth6(26)];
    UIButton *clearButton = [_Id valueForKey:@"_clearButton"];
    [clearButton setImage:[UIImage imageNamed:@"全部删除"] forState:UIControlStateNormal];
    _Id.clearButtonMode =UITextFieldViewModeWhileEditing;
    [login addSubview:_Id];
    UIView *border = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_Id.frame), ScaleWidth6(620), ScaleHeight6(1))];
    border.backgroundColor =RGBA(211,211,211,1.0);
    [login addSubview:border];
    
    UIImageView *pwimg = [[UIImageView alloc]initWithFrame:CGRectMake(ScaleWidth6(34), CGRectGetMaxY(border.frame)+ScaleHeight6(34), ScaleWidth6(40), ScaleHeight6(40))];
    pwimg.image = [UIImage imageNamed:@"icon_密码"];
    [login addSubview:pwimg];
    
    _Password = [[UITextField alloc]initWithFrame:CGRectMake(ScaleWidth6(108), ScaleHeight6(108), ScaleWidth6(490), ScaleHeight6(108))];
    _Password.placeholder = @"请输入用户密码";
    _Password.secureTextEntry = YES;
    _Password.font = [UIFont systemFontOfSize:ScaleWidth6(26)];
    UIButton *clearButton1 = [_Password valueForKey:@"_clearButton"];
    [clearButton1 setImage:[UIImage imageNamed:@"全部删除"] forState:UIControlStateNormal];
    _Password.clearButtonMode = UITextFieldViewModeWhileEditing;
    [login addSubview:_Password];
    
    UIButton *lgbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    lgbtn.frame = CGRectMake(ScaleWidth6(65), CGRectGetMaxY(login.frame)+ScaleHeight6(100),ScaleWidth6(620), ScaleHeight6(100));
    [lgbtn setImage:[UIImage imageNamed:@"登录"] forState:UIControlStateNormal];
    [lgbtn addTarget:self action:@selector(nextAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:lgbtn];
    UILabel *lb = [[UILabel alloc]initWithFrame:CGRectMake(ScaleWidth6(240),CGRectGetMaxY(lgbtn.frame)+ScaleHeight6(170), [UIScreen mainScreen].bounds.size.width - ScaleWidth6(480), ScaleHeight6(25))];
    lb.text = @"吉林市九天储运有限公司";
    lb.font = [UIFont systemFontOfSize:ScaleWidth6(24)];
    lb.textColor = RGBColor(74, 74, 74);
    [self.view addSubview:lb];
}
//url
-(void)loadWithAFN{
    NSString *URL =[NSString stringWithFormat:@"%@%@",CH_MainUrl,CH_Url_Login];
    NSDictionary *param =@{@"staffCode":_Id.text,@"password":_Password.text,@"deviceId":getUserDefault(@"deviceId")};
    [NetWorkingTools PostWithURL:URL params:param success:^(id json) {
        NSLog(@"%@",json);
        if ([json[@"returnState"] isEqualToString:@"1"]) {
            [self next];
            setUserDefault(json[@"token"], @"token");//将返回的token存入沙盒
            [MBProgressHUD showSuccess:@"登陆成功"];
        }else if([json[@"returnState"] isEqualToString:@"2"]){
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"登录失败" preferredStyle:UIAlertControllerStyleAlert];
                    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
 // 弹出对话框
                    [self presentViewController:alert animated:true completion:nil];
        }else if([json[@"returnState"] isEqualToString:@"3"]){
            
        }

    } failure:^(NSError *error) {
        
    }];
}

-(void)nextAction:(UIButton*)sender{
    [self loadWithAFN];
//    if ([self isSafePassword:_Id.text]||[_Password.text isEqualToString:@"123456"]) {
//        [self next];
//        [MBProgressHUD showSuccess:@"登陆成功"];
//    }else{
//        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"登录失败" preferredStyle:UIAlertControllerStyleAlert];
//        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
//        // 弹出对话框
//        [self presentViewController:alert animated:true completion:nil];
//    }
    
}
-(void)next{
    TabBarViewController *tabbar =[[TabBarViewController alloc] init];
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    appDelegate.window.rootViewController = tabbar;
}
//- (BOOL) isSafePassword:(NSString *)strPwd{
//    NSString *passWordRegex = @"^((?![0-9]+$)(?![a-zA-Z]+$)(?![~!@#$^&|*-_+=.?,]+$))[0-9A-Za-z~!@#$^&|*-_+=.?,]{6,20}$";   // 数字，字符或符号至少两种
//    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", passWordRegex];
//    if ([regextestcm evaluateWithObject:strPwd] == YES)
//    {
//        return YES;
//    }
//    else
//    {
//        return NO;
//    }
//}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.view endEditing:YES];
    return YES;
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
