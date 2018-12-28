//
//  JCSQTableViewCell.m
//  JiuTian01
//
//  Created by Limy on 2018/12/24.
//  Copyright © 2018年 Limy. All rights reserved.
//

#import "JCSQTableViewCell.h"

@implementation JCSQTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self creaeView];
    }
    return self;
}
-(void)creaeView{
    _img = [[UIImageView alloc]initWithFrame:CGRectMake(ScaleWidth6(40), ScaleHeight6(25), ScaleWidth6(50), ScaleHeight6(50))];
    [self.contentView addSubview:_img];
    _textl = [[UILabel alloc]initWithFrame:CGRectMake(MaxX(_img.frame)+ScaleWidth6(50), ScaleHeight6(40), ScaleWidth6(100), ScaleHeight6(24))];
    _textl.textColor = grayWordColor;
    _textl.font=[UIFont systemFontOfSize:ScaleWidth6(24)];
    [self.contentView addSubview:_textl];
    _commit = [[UILabel alloc]initWithFrame:CGRectMake(MaxX(_textl.frame)+ScaleWidth6(122), ScaleHeight6(40), ScaleWidth6(75), ScaleHeight6(24))];
    _commit.textColor = grayWordColor;
    _commit.font=[UIFont systemFontOfSize:ScaleWidth6(24)];
    [self.contentView addSubview:_commit];
    _typel = [[UILabel alloc]initWithFrame:CGRectMake(MaxX(_commit.frame)+ScaleWidth6(130), ScaleHeight6(40), ScaleWidth6(75), ScaleHeight6(24))];
    _typel.textColor = grayWordColor;
    _typel.font=[UIFont systemFontOfSize:ScaleWidth6(24)];
    _typel.textAlignment=NSTextAlignmentRight;
    [self.contentView addSubview:_typel];
    UIImageView *fx= [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth-ScaleWidth6(54), ScaleHeight6(41), ScaleWidth6(14), ScaleHeight6(22))];
    fx.image = [UIImage imageNamed:@"方向"];
    [self.contentView addSubview:fx];
    UIView *border = [[UIView alloc]initWithFrame:CGRectMake(0, ScaleHeight6(99), ScreenWidth, ScaleHeight6(1))];
    border.backgroundColor = [Tools colorWithHexString:@"b1b1b1"];
    [self.contentView addSubview:border];
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
