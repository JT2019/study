//
//  RHFiltrateCell.m
//  MCSchool
//
//  Created by 郭人豪 on 2016/12/24.
//  Copyright © 2016年 Abner_G. All rights reserved.
//

#import "RHFiltrateCell.h"

@interface RHFiltrateCell ()

@property (nonatomic, strong) UILabel * lab_title;
@end
@implementation RHFiltrateCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.lab_title];
    }
    return self;
}

#pragma mark - layout subviews

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _lab_title.frame = self.bounds;
}

#pragma mark - config cell

- (void)configCellWithData:(NSDictionary *)dic {
    
    _lab_title.text = dic[@"title"];
    if ([dic[@"isSelected"] boolValue]) {
        
        _lab_title.layer.borderWidth = 1.0;
        _lab_title.backgroundColor = Color_White;
        _lab_title.textColor = [Tools colorWithHexString:@"#ff6600"];
    } else {
        
        _lab_title.layer.borderWidth = 0.0;
        _lab_title.backgroundColor = Color_BG;
        _lab_title.textColor = [Tools colorWithHexString:@"#666666"];
    }
}

#pragma mark - setter and getter

- (UILabel *)lab_title {
    
    if (!_lab_title) {
        _lab_title = [[UILabel alloc] init];
        _lab_title.layer.borderColor = [Tools colorWithHexString:@"#ff6600"].CGColor;
        _lab_title.layer.cornerRadius = ScaleHeight6(42)/2;
        _lab_title.layer.masksToBounds = YES;
        _lab_title.textAlignment = NSTextAlignmentCenter;
        _lab_title.font =[UIFont systemFontOfSize:ScaleHeight6(20)] ;
    }
    return _lab_title;
}




@end
