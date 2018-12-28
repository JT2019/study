//
//  DetailsCollectionViewCell.h
//  JiuTian01
//
//  Created by Limy on 2018/12/25.
//  Copyright © 2018年 Limy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailsCollectionViewCell : UICollectionViewCell
@property (nonatomic,strong) UILabel *titleL;
@property (nonatomic,strong) UILabel *timeL;
@property (nonatomic,strong) UIImageView *tipV;
@property (nonatomic,strong) UIImageView *backGroundV;
-(void)configCellWithData:(NSString*)dic;
@end

NS_ASSUME_NONNULL_END
