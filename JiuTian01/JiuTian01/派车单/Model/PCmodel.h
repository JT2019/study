//
//  PCmodel.h
//  JiuTian01
//
//  Created by Limy on 2018/12/26.
//  Copyright © 2018年 Limy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PCdispatchListInfo: NSObject
@property(nonatomic,copy)NSString*dispatchId;
@property(nonatomic,copy)NSString*commodityInformation;
@property(nonatomic,copy)NSString*singleCarNumber;
@property(nonatomic,copy)NSString*routeInformation;
@property(nonatomic,copy)NSString*estimatedTimeOfDeparture;
@property(nonatomic,copy)NSString*actualDepartureTime;
@property(nonatomic,copy)NSString*astimatedTimeOfArrival;
@property(nonatomic,copy)NSString*actualArrivalTime;
@property(nonatomic,copy)NSString*tonnageOfLoading;
@property(nonatomic,copy)NSString*tonnageOfUnloading;
@property(nonatomic,copy)NSString*steamingTank;
@end
@interface PCmodel : NSObject<YYModel>
    @property(nonatomic,copy)NSString *photosOfPeople;
    @property(nonatomic,copy)NSString*driverName;
    @property(nonatomic,copy)NSString*supercargoName;
    @property(nonatomic,copy)NSString*company;
    @property(nonatomic,copy)NSString*fuelType;
    @property(nonatomic,copy)NSString*monthMileage;
    @property(nonatomic,copy)NSString*totalMileage;
     @property(nonatomic,copy)NSString*emptyCruising;
     @property(nonatomic,copy)NSString*heavyDriving;
     @property(nonatomic,copy)NSString*spareDold;
     @property(nonatomic,copy)NSString*reimbursement;
     @property(nonatomic,copy)NSString*newwId;
     @property(nonatomic,strong)NSArray<PCdispatchListInfo*>*dispatchListInfo;
@end

NS_ASSUME_NONNULL_END
