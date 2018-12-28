//
//  DetailsCollectionViewCell.m
//  JiuTian01
//
//  Created by Limy on 2018/12/25.
//  Copyright © 2018年 Limy. All rights reserved.
//

#import "DetailsCollectionViewCell.h"
#import "yymodel.h"
@implementation DetailsCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        [self createView];
    }
    return self;
}

-(void)createView{
    _backGroundV =[[UIImageView alloc]initWithFrame:CGRectMake(0,0, ScaleWidth6(320), ScaleHeight6(150))];
    [self.contentView addSubview:_backGroundV];
    UIImageView *head = [[UIImageView alloc]initWithFrame:CGRectMake(ScaleHeight6(20), ScaleHeight6(20), ScaleWidth6(102), ScaleHeight6(70))];
    head.image = [UIImage imageNamed:@"证件图标"];
    [_backGroundV addSubview:head];
    _titleL = [[UILabel alloc]initWithFrame:CGRectMake(MaxX(head.frame)+ScaleWidth6(12), ScaleHeight6(20), ScaleWidth6(150), ScaleHeight6(24))];
    _titleL.textColor = whriteColor;
    _titleL.font = [UIFont systemFontOfSize:ScaleWidth6(24)];
    [_backGroundV addSubview:_titleL];
    _tipV = [[UIImageView alloc]initWithFrame:CGRectMake(_backGroundV.bounds.size.width-ScaleWidth6(50), ScaleHeight6(10), ScaleWidth6(40), ScaleHeight6(40))];
    [_backGroundV addSubview:_tipV];
    _timeL = [[UILabel alloc]initWithFrame:CGRectMake(ScaleWidth6(20), MaxY(head.frame)+ScaleHeight6(20), ScaleWidth6(275), ScaleHeight6(20))];
    _timeL.textColor=[Tools colorWithHexString:@"#fffff"];
    _timeL.font =[UIFont systemFontOfSize:ScaleWidth6(20)];
    [_backGroundV addSubview:_timeL];
}
-(void)configCellWithData:(NSString *)dic{
    _titleL.text =dic;
}
@end
