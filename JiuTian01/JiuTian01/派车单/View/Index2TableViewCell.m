//
//  Index2TableViewCell.m
//  JiuTian01
//
//  Created by Limy on 2018/12/19.
//  Copyright © 2018年 Limy. All rights reserved.
//

#import "Index2TableViewCell.h"

@implementation Index2TableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self creaeView];
    }
    return self;
}
-(void)creaeView{
    _timg = [[UIImageView alloc]initWithFrame:CGRectMake(ScaleWidth6(20), ScaleHeight6(62)-ScaleHeight6(44), ScaleWidth6(44), ScaleHeight6(44))];
    [self.contentView addSubview:_timg];
    _Route=[[UILabel alloc]initWithFrame:CGRectMake(MaxX(_timg.frame)+ScaleWidth6(20), ScaleHeight6(30), ScaleWidth6(115), ScaleHeight6(22))];
    _Route.textColor=[Tools colorWithHexString:@"#999999"];
    _Route.font = [UIFont systemFontOfSize:ScaleWidth6(22)];
    [self.contentView addSubview:_Route];
    _Path = [[UILabel alloc]initWithFrame:CGRectMake(MaxX(_Route.frame), MinY(_Route.frame), ScaleWidth6(450), ScaleHeight6(22))];
    _Path.textColor=grayWordColor;
    _Path.font = [UIFont systemFontOfSize:ScaleWidth6(22)];
    [self.contentView addSubview:_Path];
    _border=[[UIView alloc]initWithFrame:CGRectMake(ScaleWidth6(20), ScaleHeight6(79), ScaleWidth6(670), ScaleHeight6(1))];
    _border.backgroundColor = [Tools colorWithHexString:@"#c5c5c5"];
    [self.contentView addSubview:_border];
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
