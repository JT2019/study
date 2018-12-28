//
//  Index3TableViewCell.m
//  JiuTian01
//
//  Created by Limy on 2018/12/19.
//  Copyright © 2018年 Limy. All rights reserved.
//

#import "Index3TableViewCell.h"

@implementation Index3TableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self creaeView];
    }
    return self;
}
-(void)creaeView{
    _timg = [[UIImageView alloc]initWithFrame:CGRectMake(ScaleWidth6(20), ScaleHeight6(62)-ScaleHeight6(44), ScaleWidth6(44), ScaleHeight6(44))];
    [self.contentView addSubview:_timg];
    _date=[[UILabel alloc]initWithFrame:CGRectMake(MaxX(_timg.frame)+ScaleWidth6(20), ScaleHeight6(30), ScaleWidth6(160), ScaleHeight6(22))];
    _date.textColor=[Tools colorWithHexString:@"#999999"];
    _date.font = [UIFont systemFontOfSize:ScaleWidth6(22)];
    [self.contentView addSubview:_date];
    _dateValue = [[UILabel alloc]initWithFrame:CGRectMake(MaxX(_date.frame), MinY(_date.frame), ScaleWidth6(450), ScaleHeight6(22))];
    _dateValue.textColor=grayWordColor;
    _dateValue.font = [UIFont systemFontOfSize:ScaleWidth6(22)];
    [self.contentView addSubview:_dateValue];
    UIView *border=[[UIView alloc]initWithFrame:CGRectMake(ScaleWidth6(20), ScaleHeight6(79), ScaleWidth6(670), ScaleHeight6(1))];
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
