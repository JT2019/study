//
//  yymodel.m
//  JiuTian01
//
//  Created by Limy on 2018/12/25.
//  Copyright © 2018年 Limy. All rights reserved.
//

#import "yymodel.h"

@implementation YYdispatchList


@end

@implementation yymodel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ids":@"id"};
}
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"dispatchList":[YYdispatchList class]};
}
@end
