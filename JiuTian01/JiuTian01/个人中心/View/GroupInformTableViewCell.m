//
//  GroupInformTableViewCell.m
//  JiuTian01
//
//  Created by Limy on 2018/12/24.
//  Copyright © 2018年 Limy. All rights reserved.
//

#import "GroupInformTableViewCell.h"

@implementation GroupInformTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self creaeView];
    }
    return self;
}
-(void)creaeView{
    
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
