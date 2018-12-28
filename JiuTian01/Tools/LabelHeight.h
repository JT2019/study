//
//  LabelHeight.h
//  BeautyVideos
//
//  Created by mac on 15/12/3.
//  Copyright © 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LabelHeight : NSObject
+ (float) heightForString:(NSString *)value fontSize:(float)fontSize andWidth:(float)width;
+ (float) sizeWithText:(NSString *)text fontSize:(float)fontSize;
@end
