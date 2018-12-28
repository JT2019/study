//
//  CarStateTableViewCell.m
//  JiuTian01
//
//  Created by Limy on 2018/12/20.
//  Copyright © 2018年 Limy. All rights reserved.
//

#import "CarStateTableViewCell.h"

@implementation CarStateTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self creaeView];
    }
    return self;
}
-(void)creaeView{
    _timg = [[UIImageView alloc]initWithFrame:CGRectMake(ScaleWidth6(40), ScaleHeight6(25), ScaleWidth6(50), ScaleHeight6(50))];
    [self.contentView addSubview:_timg];
    _type = [[UILabel alloc]initWithFrame:CGRectMake(MaxX(_timg.frame)+ScaleWidth6(50), ScaleHeight6(37), ScaleWidth6(100), ScaleHeight6(24))];
    _type.textColor = [Tools colorWithHexString:@"4a4a4a"];
    _type.font = [UIFont systemFontOfSize:ScaleWidth6(24)];
    [self.contentView addSubview:_type];
    _swicth = [UIButton buttonWithType:UIButtonTypeCustom];
    _swicth.frame = CGRectMake(MaxX(_type.frame)+ScaleWidth6(374), ScaleHeight6(25), ScaleWidth6(100), ScaleHeight6(50));
    [self.contentView addSubview:_swicth];
    UIView *border = [[UIView alloc]initWithFrame:CGRectMake(0,ScaleHeight6(99), ScreenWidth, ScaleHeight6(1))];
    border.backgroundColor = [Tools colorWithHexString:@"#b1b1b1"];
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
