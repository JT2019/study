//
//  PapersDateViewController.m
//  JiuTian01
//
//  Created by Limy on 2018/12/24.
//  Copyright © 2018年 Limy. All rights reserved.
//

#import "PapersDateViewController.h"
#import "DetailsCollectionViewCell.h"
@interface PapersDateViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UILabel *titlel;
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)NSMutableArray *dataArr;
@end

@implementation PapersDateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createView];
}
-(void)createView{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width - ScaleWidth6(684), ScaleHeight6(32))];
    label.text = @"证件到期时间";
    label.font = [UIFont boldSystemFontOfSize:ScaleWidth6(32)];
    label.textColor = [UIColor whiteColor];
    [label setTextAlignment:NSTextAlignmentCenter];
    self.navigationItem.titleView = label;
    
    _titlel =[[UILabel alloc] initWithFrame:CGRectMake(ScaleWidth6(40), ScaleHeight6(24), ScaleWidth6(670), ScaleHeight6(22))];
    _titlel.textColor =[Tools colorWithHexString:@"#777777"];
    _titlel.font =[UIFont systemFontOfSize:ScaleHeight6(22)];
    _titlel.text =@"有2个证件即将到期";
    [self.view addSubview:_titlel];
    
    UIView *lineV =[[UIView alloc] initWithFrame:CGRectMake(0, MaxY(_titlel.frame) +ScaleHeight6(24), ScreenWidth, ScaleHeight6(1))];
    lineV.backgroundColor =[Tools colorWithHexString:@"#b1b1b1"];
    [self.view addSubview:lineV];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(ScaleWidth6(320), ScaleHeight6(150));//设置每个cell的大小
    layout.sectionInset=UIEdgeInsetsMake(0, ScaleWidth6(40), 0, ScaleWidth6(40));//设置组与组之间的间隔
    layout.minimumLineSpacing = ScaleHeight6(14);//设置最小行间距
    layout.minimumInteritemSpacing =ScaleWidth6(30);//最小列间距
    layout.scrollDirection =UICollectionViewScrollDirectionVertical;
    _collectionView =[[UICollectionView alloc]initWithFrame:CGRectMake(0, MaxY(lineV.frame), ScreenWidth,  ScreenHeight -ScaleHeight6(70) -ScaleHeight6(88) -ScaleWidth6(44)) collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource=self;
    _collectionView.backgroundColor = whriteColor;
    _collectionView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_collectionView];
    [_collectionView registerClass:[DetailsCollectionViewCell class] forCellWithReuseIdentifier:@"detailsCell"];
    //注册头视图
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headCell"];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return 3;
    }else{
        return 9;
    }
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DetailsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"detailsCell" forIndexPath:indexPath];
    NSArray *arr1 = @[@"驾驶证",@"危险品驾驶证",@"危险品押运证"];
    NSArray *arr2 = @[@"行驶证",@"运营证",@"罐检证",@"交强险",@"商业保险",@"车船税",@"货物保险",@"GPS系统",@"上岗证"];
    if (indexPath.section ==0) {
        cell.backGroundV.image =[UIImage imageNamed:@"个人证件信息"];
//        cell.titleL.text = arr1[indexPath.row];
        if (indexPath.row==0) {
            cell.tipV.image = [UIImage imageNamed:@"提醒证件"];
        }
        [cell configCellWithData:arr1[indexPath.row]];
    }else{
        cell.backGroundV.image =[UIImage imageNamed:@"车辆证件信息"];
//        cell.titleL.text = arr2[indexPath.row];
        if (indexPath.row==0) {
            cell.tipV.image = [UIImage imageNamed:@"提醒证件"];
        }
        [cell configCellWithData:arr2[indexPath.row]];
    }
    cell.timeL.text=@"到期时间：2019年12月25日";
    return cell;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(ScreenWidth, ScaleHeight6(80));
    
}
//  返回头视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    //如果是头视图
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *header=[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"headCell" forIndexPath:indexPath];
        //添加头视图的内容
        UIView *BGv =[[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScaleHeight6(80))];
        BGv.backgroundColor =whriteColor;
        
        UIImageView *shuV =[[UIImageView alloc] initWithFrame:CGRectMake(ScaleWidth6(40), ScaleHeight6(30), ScaleWidth6(4), ScaleHeight6(30))];
        shuV.image =[UIImage imageNamed:@"标题条"];
        [BGv addSubview:shuV];
        UILabel *titleL =[[UILabel alloc] initWithFrame:CGRectMake(MaxX(shuV.frame) +ScaleWidth6(10), ScaleHeight6(34), ScaleWidth6(300), ScaleHeight6(24))];
        titleL.textColor =grayWordColor;
        titleL.font =[UIFont systemFontOfSize:ScaleHeight6(24)];
        if (indexPath.section ==0) {
            titleL.text =@"个人证件信息";
        }else{
            titleL.text =@"车辆证件信息";
        }
        
        [BGv addSubview:titleL];
        //头视图添加view
        [header addSubview:BGv];
        return header;
    }
    
    return nil;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
