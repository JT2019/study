//
//  Index4TableViewCell.m
//  JiuTian01
//
//  Created by Limy on 2018/12/19.
//  Copyright © 2018年 Limy. All rights reserved.
//

#import "Index4TableViewCell.h"

@implementation Index4TableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self creaeView];
    }
    return self;
}
-(void)creaeView{
    _timg = [[UIImageView alloc]initWithFrame:CGRectMake(ScaleWidth6(20), ScaleHeight6(62)-ScaleHeight6(44), ScaleWidth6(44), ScaleHeight6(44))];
     [self.contentView addSubview:_timg];
     _tunnage = [[UILabel alloc]initWithFrame:CGRectMake(MaxX(_timg.frame)+ScaleWidth6(20), ScaleHeight6(30), ScaleWidth6(115), ScaleHeight6(22))];
    _tunnage.textColor=[Tools colorWithHexString:@"#999999"];
    _tunnage.font = [UIFont systemFontOfSize:ScaleWidth6(22)];
    [self.contentView addSubview:_tunnage];
    UILabel *tj = [[UILabel alloc]initWithFrame:CGRectMake(MaxX(_tunnage.frame)+ScaleWidth6(20), ScaleHeight6(30), ScaleWidth6(270), ScaleHeight6(22))];
    tj.textColor=[Tools colorWithHexString:@"#999999"];
    tj.text=@"请点击后面加号进行上传";
    tj.font=[UIFont systemFontOfSize:ScaleWidth6(22)];
    [self.contentView addSubview:tj];
    
    _btn =[UIButton buttonWithType:UIButtonTypeCustom];
    _btn.frame = CGRectMake(ScaleWidth6(710)-ScaleWidth6(130),ScaleHeight6(18), ScaleWidth6(44), ScaleHeight6(44));
    [_btn setBackgroundImage:[UIImage imageNamed:@"+"] forState:UIControlStateNormal]; 
    [self.contentView addSubview:_btn];
    
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
