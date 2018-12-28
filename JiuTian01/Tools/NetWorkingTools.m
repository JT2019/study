//
//  NetWokringTools.m
//  自定义封装AFNetworking
//
//  Created by SerastoLiu on 16/8/29.
//  Copyright © 2016年 hibotech. All rights reserved.
//

#import "NetWorkingTools.h"
#import "AFNetworking.h"
#import "MBProgressHUD.h"
#import "MBProgressHUD+MJ.h"

@implementation NetWorkingTools

+ (AFSecurityPolicy *)customSecurityPolicy { //先导入证书，找到证书的路径
    NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"myserver" ofType:@"cer"];
    NSData *certData = [NSData dataWithContentsOfFile:cerPath];
    //AFSSLPinningModeCertificate 使用证书验证模式AFSSLPinningModeCertificate、AFSSLPinningModeNone
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    //allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO //如果是需要验证自建证书，需要设置为YES
    securityPolicy.allowInvalidCertificates = YES;
    //validatesDomainName 是否需要验证域名，默认为YES； //假如证书的域名与你请求的域名不一致，需把该项设置为NO；如设成NO的话，即服务器使用其他可信任机构颁发的证书，也可以建立连接，这个非常危险，建议打开。
    //置为NO，主要用于这种情况：客户端请求的是子域名，而证书上的是另外一个域名。因为SSL证书上的域名是独立的，假如证书上注册的域名是www.google.com，那么mail.google.com是无法验证通过的；当然，有钱可以注册通配符的域名*.google.com，但这个还是比较贵的。 //如置为NO，建议自己添加对应域名的校验逻辑。
    securityPolicy.validatesDomainName = NO;
    NSSet *set = [[NSSet alloc] initWithObjects:certData, nil];
    securityPolicy.pinnedCertificates = set;
    return securityPolicy;
}

+ (void)PATCHWithURL:(NSString *)url
              params:(NSDictionary *)params
             success:(void (^)(id))success
             failure:(void (^)(NSError *))failure{
    AFHTTPSessionManager * manger = [AFHTTPSessionManager manager];
    //json解析所有格式
    [self addParameterWithDictionary:params ] ;
    manger.responseSerializer = [AFJSONResponseSerializer
                                 serializerWithReadingOptions:NSJSONReadingAllowFragments];
    [manger PATCH:url parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)GetWithURL:(NSString *)url
            params:(NSDictionary *)params
           success:(void (^)(id))success
           failure:(void (^)(NSError *))failure{
    AFHTTPSessionManager * manger = [AFHTTPSessionManager manager];
    [self addParameterWithDictionary:params ] ;
    //json解析所有格式
    manger.responseSerializer = [AFJSONResponseSerializer
                                 serializerWithReadingOptions:NSJSONReadingAllowFragments];
    manger.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html", nil];
    manger.requestSerializer = [AFJSONRequestSerializer serializer] ;
    
    [manger GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)PostWithURL:(NSString *)url
             params:(NSDictionary *)params
            success:(void (^)(id))success
            failure:(void (^)(NSError *))failure{
    AFHTTPSessionManager * manger = [AFHTTPSessionManager manager];
    //json解析所有格式
    manger.requestSerializer = [AFHTTPRequestSerializer serializer] ;
//    manger.responseSerializer = [AFHTTPResponseSerializer serializer];
    [self addParameterWithDictionary:params] ;
    manger.responseSerializer = [AFJSONResponseSerializer
                                 serializerWithReadingOptions:NSJSONReadingAllowFragments];
    manger.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html", nil];
    //HTTPS SSL的验证，在此处调用上面的代码，给这个证书验证；
    [manger setSecurityPolicy:[NetWorkingTools customSecurityPolicy]];
    
    [manger POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
    
}

+ (void)PostWithURL:(NSString *)url
             params:(NSDictionary *)params
constructingBodyWithBlock:(void (^)(id))block
            success:(void (^)(id))success
            failure:(void (^)(NSError *))failure{
    AFHTTPSessionManager * manger = [AFHTTPSessionManager manager];
    [self addParameterWithDictionary:params ]  ;
    //json解析所有格式
    manger.responseSerializer = [AFJSONResponseSerializer
                                 serializerWithReadingOptions:NSJSONReadingAllowFragments];
    //HTTPS SSL的验证，在此处调用上面的代码，给这个证书验证；
    [manger setSecurityPolicy:[NetWorkingTools customSecurityPolicy]];
    
    [manger POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        if (formData) {
            block(formData); 
        }
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];

}

+(void)DeleteWithURL:(NSString *)url
              params:(NSDictionary *)params
             success:(void (^)(id))success
             failure:(void (^)(NSError *))failure{
    AFHTTPSessionManager * manger = [AFHTTPSessionManager manager];
    //json解析所有格式
    manger.responseSerializer = [AFJSONResponseSerializer
                                 serializerWithReadingOptions:NSJSONReadingAllowFragments];
    
    [manger DELETE:url parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}
+ (void)searchnet{
    //检测网络
    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];
    [mgr setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        // 当网络状态发生改变的时候调用这个block
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"WIFI");
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"自带网络");
                break;
                
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"没有网络");
                // [MBProgressHUD dismiss];
                [MBProgressHUD showError:@"请检查网络设置！"];
                break;
                
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"未知网络");
                break;
            default:
                break;
        }
    }];
    // 开始监控
    [mgr startMonitoring];
}

+ (void)searchnetWithView:(UIView *)view{
    //检测网络
    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];
    [mgr setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        // 当网络状态发生改变的时候调用这个block
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"WIFI");
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"自带网络");
                break;
                
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"没有网络");
                //  [MBProgressHUD dismiss];
                [MBProgressHUD showError:@"请检查网络设置！"];
                view.userInteractionEnabled = YES;
                break;
                
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"未知网络");
                break;
            default:
                break;
        }
    }];
    // 开始监控
    [mgr startMonitoring];
    
}

+ (void)stopSearch{
    [[AFNetworkReachabilityManager sharedManager] stopMonitoring];
}
+ ( void )addParameterWithDictionary :(NSDictionary *)param
{
    if (param == nil)
    {
        param = [NSDictionary dictionaryWithObject:@"json" forKey:@"dataType"] ;
    
    }
    else
    {
        NSMutableDictionary * dic = [NSMutableDictionary dictionaryWithDictionary:param] ;
        [dic setObject:@"json" forKey:@"dataType"] ;
        param = dic.copy ;
    }
    return  ;
    
}

+ (void) uploadImageURL:(NSString * )url
         WithImageArray:(NSArray <UIImage *>* )array
         withparameters:(NSDictionary *) params
                success:(void(^)(id resposeObject))sucess
                 failed:(void(^)(NSError * error))failed
{
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager] ;
    manager.responseSerializer =  [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments] ;
    manager.requestSerializer = [AFJSONRequestSerializer serializer] ;
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json",  @"text/json", @"text/html", @"text/javascript",nil] ];
    [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSInteger imgcount = 0;
        
        for (UIImage *image1 in array  ) {
            UIImage* newImg = [Tools imageWithImage:image1 scaledToSize:CGSizeMake(270, 360)];

            NSData* data = UIImagePNGRepresentation(newImg);
            NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss:SSS";
           // NSString* filename = [NSString stringWithFormat:@"%@%@.png", [formatter stringFromDate:[NSDate date]], @(imgcount)];
            [formData appendPartWithHeaders:nil body:data ] ;
            
            //[formData appendPartWithFileData:data name:@"files" fileName:filename mimeType:@"image/png"] ;
            imgcount ++;
        }
//        for (NSString * key in params.allKeys) {
//              if([key isEqualToString:@"myPhoto"])
//              {
//                  
//              }
//            else
//            {
//                NSData * data =   [[params valueForKey:key ] dataUsingEncoding:NSUTF8StringEncoding];
//                [formData appendPartWithFormData:data name:key] ;
//            }
//
//        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"%f",1.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        sucess(responseObject) ;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failed(error) ;
    }  ] ;
    

}




@end
