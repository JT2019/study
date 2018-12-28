//
//  Tools.h
//  吉林科技馆
//
//  Created by 常玉坤 on 2017/4/21.
//  Copyright © 2017年 常玉坤. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Tools : NSObject

//字符串转颜色
+ (UIColor *) colorWithHexString: (NSString *) stringToConvert;
//判断字符串是否为空
+ (BOOL)isEmpty:(NSString *)src;

+ (UIImage *)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize;

+ (UIImage *)imageWithTheColor:(UIColor *)color;

+ (BOOL)inputShouldLetterOrNum:(NSString *)inputString;
//判断身份证
+ (BOOL)judgeIdentityStringValid:(NSString *)identityString;
//判断手机号
+(BOOL)isMobilePhone:(NSString *)phoneNum;

//记录用户打开应用的次数
+ (void)recordUserOpenAppTimes;

//是否是第一次打开应用
+ (BOOL)isFirstOpen;

/** * 改变行间距 */
+ (void)changeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space;
/** * 改变字间距 */
+ (void)changeWordSpaceForLabel:(UILabel *)label WithSpace:(float)space;
/** * 改变行间距和字间距 */
+ (void)changeSpaceForLabel:(UILabel *)label withLineSpace:(float)lineSpace WordSpace:(float)wordSpace;
//获取视频封面，本地视频，网络视频都可以用
+(UIImage*) thumbnailImageForVideo:(NSURL *)videoURL;
+ (UIImage *)firstFrameWithVideoURL:(NSURL *)url size:(CGSize)size;
//根据宽度求高度  content 计算的内容  width 计算的宽度 font字体大小
+ (CGFloat)getLabelHeightWithText:(NSString *)text width:(CGFloat)width font: (CGFloat)font;
//有身份证返回性别
+ (NSString *)sexStrFromIdentityCard:(NSString *)numberStr;

@end
