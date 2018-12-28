//
//  CLAJTableViewCell.m
//  JiuTian01
//
//  Created by Limy on 2018/12/20.
//  Copyright © 2018年 Limy. All rights reserved.
//

#import "CLAJTableViewCell.h"

@implementation CLAJTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self creaeView];
    }
    return self;
}
-(void)creaeView{
    _timg = [[UIImageView alloc]initWithFrame:CGRectMake(ScaleWidth6(40), ScaleHeight6(25), ScaleWidth6(50), ScaleHeight6(50))];
    [self.contentView addSubview:_timg];
    _state = [[UILabel alloc]initWithFrame:CGRectMake(MaxX(_timg.frame)+ScaleWidth6(50), ScaleHeight6(38), ScaleWidth6(100), ScaleHeight6(24))];
    _state.textColor = [Tools colorWithHexString:@"#4a4a4a"];
    _state.font = [UIFont systemFontOfSize:ScaleWidth6(24)];
    [self.contentView addSubview:_state];
    _comit = [[UILabel alloc]initWithFrame:CGRectMake(MaxX(_state.frame)+ScaleWidth6(122), ScaleHeight6(38), ScaleWidth6(75), ScaleHeight6(24))];
    _comit.textColor= [Tools colorWithHexString:@"#4a4a4a"];
    _comit.font = [UIFont systemFontOfSize:ScaleWidth6(24)];
    [self.contentView addSubview:_comit];
    _qualified =[[UILabel alloc]initWithFrame:CGRectMake(MaxX(_comit.frame)+ScaleWidth6(130), ScaleHeight6(38), ScaleWidth6(75), ScaleHeight6(24))];
    _qualified.font=[UIFont systemFontOfSize:ScaleWidth6(24)];
    _qualified.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:_qualified];
    UIImageView *right = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth-ScaleWidth6(54), ScaleHeight6(39), ScaleWidth6(14), ScaleHeight6(22))];
    right.image = [UIImage imageNamed:@"方向"];
    [self.contentView addSubview:right];
    UIView *border = [[UIView alloc]initWithFrame:CGRectMake(0, ScaleHeight6(99), ScreenWidth, ScaleHeight6(1))];
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
