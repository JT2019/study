//
//  Index1TableViewCell.m
//  JiuTian01
//
//  Created by Limy on 2018/12/19.
//  Copyright © 2018年 Limy. All rights reserved.
//

#import "Index1TableViewCell.h"

@implementation Index1TableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self creaeView];
    }
    return self;
}
-(void)creaeView{
    _limg = [[UIImageView alloc]initWithFrame:CGRectMake(ScaleWidth6(20), ScaleHeight6(62)-ScaleHeight6(44), ScaleWidth6(44), ScaleHeight6(44))];
    UILabel *spxx = [[UILabel alloc]initWithFrame:CGRectMake(MaxX(_limg.frame)+ScaleWidth6(20), ScaleHeight6(30), ScaleWidth6(115), ScaleHeight6(22))];
     [self.contentView addSubview:_limg];
    spxx.textColor=[Tools colorWithHexString:@"#999999"];
    spxx.text=@"商品信息：";
    spxx.font = [UIFont systemFontOfSize:ScaleWidth6(22)];
    [self.contentView addSubview:spxx];
    
    _merchandise = [[UILabel alloc]initWithFrame:CGRectMake(MaxX(spxx.frame), MinY(spxx.frame), ScaleWidth6(46), ScaleHeight6(22))];
    _merchandise.textColor=grayWordColor;
    _merchandise.font = [UIFont systemFontOfSize:ScaleWidth6(22)];
    [self.contentView addSubview:_merchandise];
    UILabel *pcid = [[UILabel alloc]initWithFrame:CGRectMake(MaxX(_merchandise.frame)+ScaleWidth6(170), MinY(_merchandise.frame), ScaleWidth6(135), ScaleHeight6(22))];
    pcid.text=@"派车单编号：";
    pcid.textColor =[Tools colorWithHexString:@"#999999"];
    pcid.font = [UIFont systemFontOfSize:ScaleWidth6(22)];
    [self.contentView addSubview:pcid];
    _pdId = [[UILabel alloc]initWithFrame:CGRectMake(MaxX(pcid.frame), MinY(pcid.frame), ScaleWidth6(135), ScaleWidth6(22))];
    _pdId.textColor=grayWordColor;
    _pdId.font = [UIFont systemFontOfSize:ScaleWidth6(22)];
    [self.contentView addSubview:_pdId];
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
