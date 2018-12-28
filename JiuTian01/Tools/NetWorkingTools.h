//
//  NetWokringTools.h
//  自定义封装AFNetworking
//
//  Created by SerastoLiu on 16/8/29.
//  Copyright © 2016年 hibotech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NetWorkingTools : NSObject

+ (void)PATCHWithURL:(NSString *)url
              params:(NSDictionary *)params
             success:(void(^)(id json))success
             failure:(void(^)(NSError *error))failure;

+ (void)PostWithURL:(NSString *)url
             params:(NSDictionary *)params
            success:(void(^)(id json))success
            failure:(void(^)(NSError *error))failure;

+ (void)PostWithURL:(NSString *)url
             params:(NSDictionary *)params
constructingBodyWithBlock:(void (^)(id formdata))block
            success:(void(^)(id json))success
            failure:(void(^)(NSError *error))failure;

+ (void)GetWithURL:(NSString *)url
            params:(NSDictionary *)params
           success:(void(^)(id json))success
           failure:(void(^)(NSError *error))failure;

+ (void)DeleteWithURL:(NSString *)url
               params:(NSDictionary *)params
              success:(void(^)(id json))success
              failure:(void(^)(NSError *error))failure;

+ (void)searchnet;
+ (void)searchnetWithView:(UIView *)view;

+ (void)stopSearch;
+ (void) uploadImageURL:(NSString * )url
         WithImageArray:(NSArray <UIImage *>* )array
         withparameters:(NSDictionary *) params
                success:(void(^)(id resposeObject))sucess
                 failed:(void(^)(NSError * error))failed ;

@end
