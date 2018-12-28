//
//  HeadTableViewCell.m
//  JiuTian01
//
//  Created by Limy on 2018/12/19.
//  Copyright © 2018年 Limy. All rights reserved.
//

#import "HeadTableViewCell.h"

@implementation HeadTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self creaeView];
    }
    return self;
}
-(void)creaeView{
    _headImg = [[UIImageView alloc]initWithFrame:CGRectMake(ScaleWidth6(20), ScaleHeight6(26), ScaleWidth6(160), ScaleHeight6(218))];
    [self.contentView addSubview:_headImg];
    UILabel *user = [[UILabel alloc]initWithFrame:CGRectMake(MaxX(_headImg.frame)+ScaleWidth6(18), ScaleHeight6(28), ScaleWidth6(90), ScaleHeight6(22))];
    user.textColor=grayWordColor;
    user.text=@"驾驶员：";
    user.font=[UIFont systemFontOfSize:ScaleWidth6(22)];
    [self.contentView addSubview:user];
     _userName =[[UILabel alloc] initWithFrame:CGRectMake(MaxX(user.frame), MinY(user.frame), ScaleWidth6(90), ScaleWidth6(22))];
     _userName.textColor =grayWordColor;
     _userName.font =[UIFont systemFontOfSize:ScaleWidth6(22)];
    [self.contentView addSubview:_userName];
    UILabel *yname = [[UILabel alloc]initWithFrame:CGRectMake(MaxX(_userName.frame), MinY(user.frame), ScaleWidth6(90), ScaleHeight6(22))];
    yname.textColor = grayWordColor;
    yname.text = @"押运员：";
    yname.font = [UIFont systemFontOfSize:ScaleWidth6(22)];
    [self.contentView addSubview:yname];
    _usName = [[UILabel alloc]initWithFrame:CGRectMake(MaxX(yname.frame), MinY(yname.frame), ScaleWidth6(90), ScaleHeight6(22))];
    _usName.textColor=grayWordColor;
    _usName.font = [UIFont systemFontOfSize:ScaleWidth6(22)];
    [self.contentView addSubview:_usName];
    UILabel *bsc = [[UILabel alloc]initWithFrame:CGRectMake(MaxX(_headImg.frame)+ScaleWidth6(20),MaxY(yname.frame)+ScaleHeight6(18), ScaleWidth6(90), ScaleHeight6(22))];
    bsc.textColor = grayWordColor;
    bsc.text = @"办事处：";
    bsc.font = [UIFont systemFontOfSize:ScaleWidth6(22)];
    [self.contentView addSubview:bsc];
    _location= [[UILabel alloc]initWithFrame:CGRectMake(MaxX(bsc.frame), MinY(bsc.frame), ScaleWidth6(90), ScaleHeight6(22))];
    _location.textColor = grayWordColor;
    _location.font = [UIFont systemFontOfSize:ScaleWidth6(22)];
    [self.contentView addSubview:_location];
    UILabel *rytype = [[UILabel alloc]initWithFrame:CGRectMake(MaxX(_location.frame), MinY(bsc.frame), ScaleWidth6(115), ScaleHeight6(22))];
    rytype.textColor = grayWordColor;
    rytype.text = @"燃料类型：";
    rytype.font = [UIFont systemFontOfSize:ScaleWidth6(22)];
    [self.contentView addSubview:rytype];
    _type = [[UILabel alloc]initWithFrame:CGRectMake(MaxX(rytype.frame), MinY(rytype.frame),ScaleWidth6(70), ScaleHeight6(22))];
    _type.textColor = grayWordColor;
    _type.font = [UIFont systemFontOfSize:ScaleWidth6(22)];
    [self.contentView addSubview:_type];
    UILabel *dylc = [[UILabel alloc]initWithFrame:CGRectMake(MinX(bsc.frame), MaxY(bsc.frame)+ScaleHeight6(18), ScaleWidth6(115), ScaleHeight6(22))];
    dylc.textColor =grayWordColor;
    dylc.text = @"当月里程：";
    dylc.font = [UIFont systemFontOfSize:ScaleWidth6(22)];
    [self.contentView addSubview:dylc];
    _theMonth = [[UILabel alloc]initWithFrame:CGRectMake(MaxX(dylc.frame), MinY(dylc.frame), ScaleWidth6(193), ScaleHeight6(22))];
    _theMonth.textColor=grayWordColor;
    _theMonth.font = [UIFont systemFontOfSize:ScaleWidth6(22)];
    [self.contentView addSubview:_theMonth];
    UILabel *zjlc = [[UILabel alloc]initWithFrame:CGRectMake(MinX(dylc.frame), MaxY(dylc.frame)+ScaleHeight6(18), ScaleWidth6(115), ScaleHeight6(22))];
    zjlc.textColor = grayWordColor;
    zjlc.text = @"总计里程：";
    zjlc.font = [UIFont systemFontOfSize:ScaleWidth6(22)];
    [self.contentView addSubview:zjlc];
    _All = [[UILabel alloc]initWithFrame:CGRectMake(MaxX(zjlc.frame), MaxY(dylc.frame)+ScaleHeight6(18), ScaleWidth6(130), ScaleHeight6(22))];
    _All.textColor = grayWordColor;
    _All.font = [UIFont systemFontOfSize:ScaleWidth6(22)];
    [self.contentView addSubview:_All];
    
   _single = [[UILabel alloc]initWithFrame:CGRectMake(MinX(zjlc.frame), MaxY(zjlc.frame) +ScaleHeight6(18), ScaleWidth6(328), ScaleWidth6(22))];
    _single.textColor = grayWordColor;
    _single.font = [UIFont systemFontOfSize:ScaleWidth6(22)];
    [self.contentView addSubview:_single];
    _repetition = [[UILabel alloc]initWithFrame:CGRectMake(MinX(_single.frame), MaxY(_single.frame) +ScaleHeight6(18), ScaleWidth6(328), ScaleWidth6(22))];
    _repetition.textColor = grayWordColor;
    _repetition.font = [UIFont systemFontOfSize:ScaleWidth6(22)];
    [self.contentView addSubview:_repetition];
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
