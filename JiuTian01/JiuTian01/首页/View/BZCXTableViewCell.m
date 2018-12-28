//
//  BZCXTableViewCell.m
//  JiuTian01
//
//  Created by Limy on 2018/12/21.
//  Copyright © 2018年 Limy. All rights reserved.
//

#import "BZCXTableViewCell.h"

@implementation BZCXTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self creaeView];
    }
    return self;
}
-(void)creaeView{
    UIView *head = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScaleHeight6(270))];
    head.backgroundColor=whriteColor;
    [self.contentView addSubview:head];
    _text = [[UILabel alloc]initWithFrame:CGRectMake(ScaleWidth6(40), ScaleHeight6(22), ScaleWidth6(90), ScaleHeight6(22))];
    _text.textColor = [Tools colorWithHexString:@"4a4a4a"];
    _text.font = [UIFont systemFontOfSize:ScaleWidth6(22)];
    [head addSubview:_text];
    UIView *border = [[UIView alloc]initWithFrame:CGRectMake(0, MaxY(_text.frame)+ScaleHeight6(22), ScreenWidth, ScaleHeight6(1))];
    border.backgroundColor = [Tools colorWithHexString:@"b1b1b1"];
    [head addSubview:border];
    _img=[[UIImageView alloc]initWithFrame:CGRectMake(ScaleWidth6(40), MaxY(border.frame)+ScaleHeight6(30), ScaleWidth6(150), ScaleHeight6(150))];
    [head addSubview:_img];
    _colorImg = [[UIImageView alloc]initWithFrame:CGRectMake(MaxX(_img.frame)+ScaleWidth6(20), MinY(_img.frame), ScaleHeight6(500), ScaleHeight6(150))];
    [head addSubview:_colorImg];
    _Date = [[UILabel alloc]initWithFrame:CGRectMake(ScaleHeight6(410), ScaleHeight6(22), ScaleWidth6(175), ScaleHeight6(22))];
    _Date.textColor=[Tools colorWithHexString:@"4a4a4a"];
    _Date.font=[UIFont systemFontOfSize:ScaleWidth6(22)];
    [head addSubview:_Date];
    UIView *bor = [[UIView alloc]initWithFrame:CGRectMake(ScreenWidth- ScaleWidth6(138), ScaleHeight6(12), ScaleWidth6(1), ScaleHeight6(40))];
    bor.backgroundColor = [Tools colorWithHexString:@"b1b1b1"];
    [head addSubview:bor];
    _userName=[[UILabel alloc]initWithFrame:CGRectMake(MaxX(_Date.frame)+ScaleWidth6(60), ScaleHeight6(22), ScaleWidth6(100), ScaleHeight6(22))];
    _userName.textColor = [Tools colorWithHexString:@"4a4a4a"];
    _userName.font = [UIFont systemFontOfSize:ScaleWidth6(22)];
    [head addSubview:_userName];
    UIView *borderr = [[UIView alloc]initWithFrame:CGRectMake(0, MaxY(_img.frame)+ScaleHeight6(20), ScreenWidth, ScaleHeight6(1))];
    borderr.backgroundColor = [Tools colorWithHexString:@"b1b1b1"];
    [head addSubview:borderr];
    
    
    
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
