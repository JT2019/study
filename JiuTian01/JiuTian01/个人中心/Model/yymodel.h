//
//  yymodel.h
//  JiuTian01
//
//  Created by Limy on 2018/12/25.
//  Copyright © 2018年 Limy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YYcomprehensive : NSObject
@property(nonatomic,copy)NSString *labelId;
@property(nonatomic,copy)NSString *name;
@end
@interface YYmonth : NSObject
@property(nonatomic,copy)NSString *labelId;
@property(nonatomic,copy)NSString *name;
@end
@interface YYdispatchList : NSObject
@property(nonatomic,copy)NSString *dispatchId;
@property(nonatomic,copy)NSString *dispatchTime;
@property(nonatomic,copy)NSString *singleCarNumber;
@property(nonatomic,copy)NSString *commodityInformation;
@property(nonatomic,copy)NSString *mileage;
@property(nonatomic,copy)NSString *useTime;
@property(nonatomic,copy)NSString *tonnageOfUnloading;
@property(nonatomic,copy)NSString *day;
@property(nonatomic,copy)NSString *month;
@property(nonatomic,copy)NSString *origin;
@property(nonatomic,copy)NSString *destination;
@end
@interface YYparticularYear : NSObject
@property(nonatomic,copy)NSString *labelId;
@property(nonatomic,copy)NSString *name;
@end
@interface yymodel : NSObject <YYModel>
@property(nonatomic,copy)NSString *loginStatc;
@property(nonatomic,copy)NSString *returnState;
@property(nonatomic,copy)NSString *returnStr;
@property(nonatomic,strong)NSArray  <YYcomprehensive *>*comprehensive;
@property(nonatomic,strong)NSArray  <YYmonth *>*month;
@property(nonatomic,strong)NSArray  <YYparticularYear *>*particularYear;
@property(nonatomic,strong)NSArray  <YYdispatchList *>*dispatchList;
@end

NS_ASSUME_NONNULL_END
