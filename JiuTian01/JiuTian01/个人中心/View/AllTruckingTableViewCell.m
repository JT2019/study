//
//  AllTruckingTableViewCell.m
//  JiuTian01
//
//  Created by Limy on 2018/12/25.
//  Copyright © 2018年 Limy. All rights reserved.
//

#import "AllTruckingTableViewCell.h"
#import "yymodel.h"
@implementation AllTruckingTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createView];
    }
    return self;
}

-(void)createView{
    UIImageView *head = [[UIImageView alloc]initWithFrame:CGRectMake(ScaleWidth6(40), ScaleHeight6(20), ScreenWidth-ScaleWidth6(80), ScaleHeight6(220))];
    head.image = [UIImage imageNamed:@"底"];
    [self.contentView addSubview:head];
    _day = [[UILabel alloc]initWithFrame:CGRectMake(ScaleWidth6(42), ScaleHeight6(56), ScaleWidth6(60), ScaleHeight6(50))];
    _day.textColor=whriteColor;
    _day.font =[UIFont systemFontOfSize:ScaleHeight6(50)];
    [head addSubview:_day];
    UIView *borl = [[UIView alloc]initWithFrame:CGRectMake(ScaleWidth6(42), MaxY(_day.frame)+ScaleHeight6(16), ScaleWidth6(58), ScaleHeight6(1))];
    borl.backgroundColor = whriteColor;
    [head addSubview:borl];
    _month = [[UILabel alloc]initWithFrame:CGRectMake(ScaleHeight6(44), MaxY(borl.frame)+ScaleHeight6(16), ScaleWidth6(55), ScaleHeight6(26))];
    _month.textColor=whriteColor;
    _month.font = [UIFont systemFontOfSize:ScaleHeight6(26)];
    [head addSubview:_month];
    _year = [[UILabel alloc]initWithFrame:CGRectMake(ScaleWidth6(38), MaxY(_month.frame)+ScaleHeight6(40), ScaleWidth6(70), ScaleHeight6(18))];
    _year.textColor=whriteColor;
    _year.font=[UIFont systemFontOfSize:ScaleHeight6(18)];
    [head addSubview:_year];
    _carId = [[UILabel alloc]initWithFrame:CGRectMake(ScaleWidth6(152), ScaleHeight6(14), ScaleWidth6(230), ScaleHeight6(18))];
    _carId.textColor=whriteColor;
    _carId.font = [UIFont systemFontOfSize:ScaleHeight6(18)];
    [head addSubview:_carId];
    UIView *borderT=[[UIView alloc]initWithFrame:CGRectMake(ScaleWidth6(152), MaxY(_carId.frame)+ScaleHeight6(16), ScaleWidth6(505), ScaleHeight6(1))];
    borderT.backgroundColor=whriteColor;
    [head addSubview:borderT];
    _initial =[[UILabel alloc]initWithFrame:CGRectMake(ScaleWidth6(222), MaxY(borderT.frame)+ScaleHeight6(48), ScaleWidth6(100), ScaleHeight6(32))];
    _initial.textColor = whriteColor;
    _initial.font = [UIFont systemFontOfSize:ScaleHeight6(32)];
    [head addSubview:_initial];
    UIView *bord = [[UIView alloc]initWithFrame:CGRectMake(ScaleWidth6(360), MaxY(borderT.frame)+ScaleHeight6(62), ScaleWidth6(87), ScaleHeight6(1))];
    bord.backgroundColor = whriteColor;
    [head addSubview:bord];
    _terminus = [[UILabel alloc]initWithFrame:CGRectMake(MaxX(bord.frame)+ScaleWidth6(44), MaxY(borderT.frame)+ScaleHeight6(48), ScaleWidth6(100), ScaleHeight6(32))];
    _terminus.textColor=whriteColor;
    _terminus.font = [UIFont systemFontOfSize:ScaleHeight6(32)];
    [head addSubview:_terminus];
    UIView *borderB = [[UIView alloc]initWithFrame:CGRectMake(ScaleWidth6(152), MaxY(_initial.frame)+ScaleHeight6(46), ScaleWidth6(505), ScaleHeight6(1))];
    borderB.backgroundColor = whriteColor;
    [head addSubview:borderB];
    _message = [[UILabel alloc]initWithFrame:CGRectMake(ScaleWidth6(152), MaxY(borderB.frame)+ScaleHeight6(12), ScaleWidth6(465), ScaleHeight6(18))];
    _message.textColor=whriteColor;
    _message.font=[UIFont systemFontOfSize:ScaleHeight6(18)];
    [head addSubview:_message];
  
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
