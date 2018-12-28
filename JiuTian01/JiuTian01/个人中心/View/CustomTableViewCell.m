//
//  CustomTableViewCell.m
//  JiuTian01
//
//  Created by Limy on 2018/12/20.
//  Copyright © 2018年 Limy. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self creaeView];
    }
    return self;
}
-(void)creaeView{
    _timg = [[UIImageView alloc]initWithFrame:CGRectMake(ScaleWidth6(40), ScaleHeight6(34), ScaleWidth6(34), ScaleHeight6(32))];
    _timg.backgroundColor=whriteColor;
    [self.contentView addSubview:_timg];
    _text = [[UILabel alloc]initWithFrame:CGRectMake(MaxX(_timg.frame)+ScaleWidth6(31), ScaleHeight6(38), ScaleWidth6(150), ScaleHeight6(24))];
    _text.textColor=grayWordColor;
    _text.font=[UIFont systemFontOfSize:ScaleWidth6(24)];
    [self.contentView addSubview:_text];
    _wimg = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth-ScaleWidth6(40), ScaleHeight6(34), ScaleWidth6(20), ScaleHeight6(32))];
    [_wimg setImage:[UIImage imageNamed:@"方向"]];
    [self.contentView addSubview:_wimg];
    UIView *border = [[UIView alloc]initWithFrame:CGRectMake(0, ScaleHeight6(99), ScreenWidth, ScaleHeight6(1))];
    border.backgroundColor = [Tools colorWithHexString:@"#c5c5c5"];
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
