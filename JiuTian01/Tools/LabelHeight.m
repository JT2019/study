//
//  LabelHeight.m
//  BeautyVideos
//
//  Created by mac on 15/12/3.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "LabelHeight.h"
#import <UIKit/UIKit.h>

@implementation LabelHeight
+ (float) heightForString:(NSString *)value fontSize:(float)fontSize andWidth:(float)width
{
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]};
    CGSize size = [value boundingRectWithSize:CGSizeMake(width, 0) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    return size.height;
}

+ (float) sizeWithText:(NSString *)text fontSize:(float)fontSize
{
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]};
    CGSize maxSize = CGSizeMake(MAXFLOAT, fontSize);
    CGSize size = [text boundingRectWithSize:maxSize options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin  attributes:attribute context:nil].size;
    
    return size.width;
    
}
@end
