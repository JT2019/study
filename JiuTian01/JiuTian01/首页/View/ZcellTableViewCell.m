//
//  ZcellTableViewCell.m
//  JiuTian01
//
//  Created by Limy on 2018/12/18.
//  Copyright © 2018年 Limy. All rights reserved.
//

#import "ZcellTableViewCell.h"

@implementation ZcellTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self creaeView];
    }
    return self;
}
-(void)creaeView{
    UIImageView *timg = [[UIImageView alloc]initWithFrame:CGRectMake(ScaleWidth6(20), ScaleHeight6(30), ScaleWidth6(124), ScaleHeight6(124))];
    timg.backgroundColor = ThemeColor;
    timg.image = [UIImage imageNamed:@"照片"];
    timg.layer.cornerRadius = ScaleWidth6(10);
    timg.layer.masksToBounds = YES;
    [self.contentView addSubview:timg];
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(MaxX(timg.frame)+ScaleWidth6(24), ScaleHeight6(30), ScaleWidth6(180), ScaleHeight6(24))];
    title.textColor = RGBColor(74, 74, 74);
    title.text=@"2018年全员培训";
    title.font = [UIFont systemFontOfSize:ScaleWidth6(24)];
    [self.contentView addSubview:title];
    UILabel *matter =[[UILabel alloc]initWithFrame:CGRectMake(MinX(title.frame), MaxY(title.frame)+ScaleHeight6(16), ScaleWidth6(565), ScaleHeight6(48))];
    matter.text=@"2018年10月20日，我司全体员工进行消防演习，其中市场部表现的非常出色，演习非常成功。";
    matter.numberOfLines=2;
    matter.textColor = RGBColor(102, 102, 102);
    matter.font = [UIFont systemFontOfSize:ScaleWidth6(20)];
    [self.contentView addSubview:matter];
    UILabel *date = [[UILabel alloc]initWithFrame:CGRectMake(MinX(title.frame), MaxY(matter.frame)+ScaleHeight6(22), ScaleWidth6(130), ScaleHeight6(16))];
    date.textColor = RGBColor(102, 102, 102);
    date.font = [UIFont systemFontOfSize:ScaleWidth6(16)];
    date.text = @"2018年10月26日";
    [self.contentView addSubview:date];
    UIView *border = [[UIView alloc]initWithFrame:CGRectMake(0, ScaleHeight6(184), ScreenWidth, ScaleHeight6(1))];
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
