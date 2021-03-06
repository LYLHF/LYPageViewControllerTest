//
//  LYPageViewController.m
//  LYPageViewControllerTest
//
//  Created by li_yong on 16/9/13.
//  Copyright © 2016年 li_yong. All rights reserved.
//

#import "LYPageViewController.h"

#import "LYPageView.h"
#import "LYStyleOneColModelHeaderView.h"
#import "LYStyleOneColModelFooterView.h"
#import "LYStyleOneTableSectionHeaderView.h"
#import "LYStyleOneTableSectionFooterView.h"
#import "LYStyleOneTableViewCell.h"

NSString * const kLYPCVCModelPageSectionHeaderReUseId = @"kLYPCVCModelPageSectionHeaderReUseId";
NSString * const kLYPCVCModelPageSectionFooterReUseId = @"kLYPCVCModelPageSectionFooterReUseId";
NSString * const kLYPCVCListTableSectionHeaderReUseId = @"kLYPCVCListTableSectionHeaderReUseId";
NSString * const kLYPCVCListTableSectionFooterReUseId = @"kLYPCVCListTableSectionFooterReUseId";
NSString * const kLYPCVCListTableViewCellReUseId = @"kLYPCVCListTableViewCellReUseId";

@interface LYPageViewController ()<LYPageViewDataSource, LYPageViewDelegate>

@property (strong, nonatomic) NSMutableArray *dataSourceArray;

@end

@implementation LYPageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self buildData];
    [self buildView];
}

/**
 *  @author liyong
 *
 *  构建数据源
 */
- (void)buildData
{
    NSArray *testArray = @[
                           //第一区模块
                           @[
                               //第一区第一模块
                               @[
                                   //第一区第一模块的列表第一区
                                   @[
                                       @"1",
                                       @"12",
                                       @"123",
                                       @"1234",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123"
                                    ]
                                ],
                               //第一区第二模块
                               @[
                                   //第一区第二模块的列表的第一区
                                   @[
                                       @"1",
                                       @"12",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123"
                                    ],
                                   //第一区第二模块的列表的第二区数
                                   @[
                                       @"1",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123"
                                    ]
                                ]
                            ],
                           //第二区模块
                           @[
                               //第二区第一模块
                               @[
                                   //第二区第一模块的列表第一区
                                   @[
                                       @"1",
                                       @"12",
                                       @"123",
                                       @"1234",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123"
                                    ]
                                ]
                            ],
                           @[
                               @[
                                   @[
                                       @"1",
                                       @"12",
                                       @"123",
                                       @"1234",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123"
                                       ]
                                   ]
                               ],
                           @[
                               @[
                                   @[
                                       @"1",
                                       @"12",
                                       @"123",
                                       @"1234",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123"
                                       ]
                                   ]
                               ],
                           @[
                               @[
                                   @[
                                       @"1",
                                       @"12",
                                       @"123",
                                       @"1234",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123",
                                       @"123"
                                       ]
                                   ]
                               ]
                           ];
    
    self.dataSourceArray = [NSMutableArray arrayWithArray:testArray];
//    for (int index = 0; index < 10; index++)
//    {
//        NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
//        for (int index1 = 0; index1 < 3; index1++)
//        {
//            LYStyleOneModel *model = [[LYStyleOneModel alloc] init];
//            model.serviceTitle = @"服务标题";
//            model.serviceInfo = @"服务简介服务简介服务简介服务简介服务简介服务简介服务简介";
//            model.price = 131.4;
//            model.servicePrice = 0.52;
//            model.address = @"江苏省南京市雨花台区大数据基地";
//            model.collectionCount = 1314;
//            [array addObject:model];
//        }
//        [self.dataSourceArray addObject:array];
//    }
}

/**
 *  @author liyong
 *
 *  搭建界面
 */
- (void)buildView
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    //分页视图
    LYPageView *pageView = [[LYPageView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64)];
    pageView.dataSource = self;
    pageView.delegate = self;
    //注册模块分区头视图
//    LYListViewReUseObject *modelPageHeaderReUseObj = [[LYListViewReUseObject alloc] init];
//    modelPageHeaderReUseObj.listViewReuseIdentifier = kLYPCVCModelPageSectionHeaderReUseId;
//    modelPageHeaderReUseObj.listViewReUseNib = [UINib nibWithNibName:NSStringFromClass([LYStyleOneColModelHeaderView class])
//                                                              bundle:[NSBundle mainBundle]];
//    [pageView registerObj:modelPageHeaderReUseObj forModelPageSuppleMentaryViewOfKind:UICollectionElementKindSectionHeader];
    //注册模块分区尾视图
//    LYListViewReUseObject *modelPageFooterReUseObj = [[LYListViewReUseObject alloc] init];
//    modelPageFooterReUseObj.listViewReuseIdentifier = kLYPCVCModelPageSectionFooterReUseId;
//    modelPageFooterReUseObj.listViewReUseNib = [UINib nibWithNibName:NSStringFromClass([LYStyleOneColModelFooterView class])
//                                                              bundle:[NSBundle mainBundle]];
//    [pageView registerObj:modelPageFooterReUseObj forModelPageSuppleMentaryViewOfKind:UICollectionElementKindSectionFooter];
    //注册列表区头
    LYListViewReUseObject *listHeaderReUseObj = [[LYListViewReUseObject alloc] init];
    listHeaderReUseObj.listViewReuseIdentifier = kLYPCVCListTableSectionHeaderReUseId;
    listHeaderReUseObj.listViewReUseNib = [UINib nibWithNibName:NSStringFromClass([LYStyleOneTableSectionHeaderView class])
                                                         bundle:[NSBundle mainBundle]];
    [pageView registerObj:listHeaderReUseObj ForPageViewListSupplementaryViewOfKind:UITableViewSectionHeader];
    //注册列表区尾
    LYListViewReUseObject *listFooterReUseObj = [[LYListViewReUseObject alloc] init];
    listFooterReUseObj.listViewReuseIdentifier = kLYPCVCListTableSectionFooterReUseId;
    listFooterReUseObj.listViewReUseNib = [UINib nibWithNibName:NSStringFromClass([LYStyleOneTableSectionFooterView class])
                                                         bundle:[NSBundle mainBundle]];
    [pageView registerObj:listFooterReUseObj ForPageViewListSupplementaryViewOfKind:UITableViewSectionFooter];
    //注册列表单元格
    LYListViewReUseObject *listCellReUseObj = [[LYListViewReUseObject alloc] init];
    listCellReUseObj.listViewReuseIdentifier = kLYPCVCListTableViewCellReUseId;
    listCellReUseObj.listViewReUseClass = [UITableViewCell class];
//    listCellReUseObj.listViewReUseNib = [UINib nibWithNibName:NSStringFromClass([LYStyleOneTableViewCell class])
//                                                       bundle:[NSBundle mainBundle]];
    [pageView registerListViewCellWith:listCellReUseObj];
    [self.view addSubview:pageView];
    
    //分页视图的横向滚动视图的头视图
//    UIView *collectionViewHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, pageView.frame.size.height)];
//    collectionViewHeaderView.backgroundColor = [UIColor redColor];
//    [pageView customModelPageHeaderWith:collectionViewHeaderView];
}

#pragma mark - LYPageViewDataSource

- (NSInteger)numberOfModelSectionInPageView:(nonnull LYPageView *)pageView
{
    return [self.dataSourceArray count];
}

- (NSInteger)pageView:(nonnull LYPageView *)pageView numberOfListViewSectionInIndexPath:(nonnull LYIndexPath *)indexPath
{
    if (indexPath.modelIndexPath.section < [self.dataSourceArray count])
    {
        NSArray *modelDataSource = [self.dataSourceArray objectAtIndex:indexPath.modelIndexPath.section];
        
        if (indexPath.modelIndexPath.row < [modelDataSource count])
        {
            NSArray *listSectionViewDataSource = [modelDataSource objectAtIndex:indexPath.modelIndexPath.row];
            
            return [listSectionViewDataSource count];
        }
    }
    
    return 0;
}

- (NSInteger)pageView:(nonnull LYPageView *)pageView numberOfModelInSection:(nonnull LYIndexPath *)indexPath
{
    if (indexPath.modelIndexPath.section < [self.dataSourceArray count])
    {
        NSArray *modelDataSource = [self.dataSourceArray objectAtIndex:indexPath.modelIndexPath.section];
        
        return [modelDataSource count];
    }
    
    return 0;
}

- (NSInteger)pageView:(nonnull LYPageView *)pageView numberOfListViewRowsInSection:(nonnull LYIndexPath *)indexPath
{
    if (indexPath.modelIndexPath.section < [self.dataSourceArray count])
    {
        NSArray *modelDataSource = [self.dataSourceArray objectAtIndex:indexPath.modelIndexPath.section];
        
        if (indexPath.modelIndexPath.row < [modelDataSource count])
        {
            NSArray *listSectionViewDataSource = [modelDataSource objectAtIndex:indexPath.modelIndexPath.row];
            
            if (indexPath.listIndexPath.section < [listSectionViewDataSource count])
            {
                NSArray *listDataSource = [listSectionViewDataSource objectAtIndex:indexPath.listIndexPath.section];
                
                return [listDataSource count];
            }
        }
    }
    
    return 0;
}

- (nonnull UITableViewCell *)pageView:(nonnull LYPageView *)pageView
                             listView:(nonnull UITableView *)listView
                cellForRowAtIndexPath:(nonnull LYIndexPath *)indexPath
{
//    LYStyleOneTableViewCell *cell;
//    if (indexPath.modelIndexPath.item < [self.dataSourceArray count])
//    {
//        NSMutableArray *array = [self.dataSourceArray objectAtIndex:indexPath.modelIndexPath.item];
//        if (indexPath.listIndexPath.row < [array count])
//        {
//            cell = [listView dequeueReusableCellWithIdentifier:kLYPCVCListTableViewCellReUseId
//                                                  forIndexPath:indexPath.listIndexPath];
//            LYStyleOneModel *model = [array objectAtIndex:indexPath.listIndexPath.row];
//            [cell buildCellWithModel:model];
//        }
//    }
    
    UITableViewCell *cell;
    if (indexPath.modelIndexPath.section < [self.dataSourceArray count])
    {
        NSArray *modelDataSource = [self.dataSourceArray objectAtIndex:indexPath.modelIndexPath.section];
        
        if (indexPath.modelIndexPath.row < [modelDataSource count])
        {
            NSArray *listSectionViewDataSource = [modelDataSource objectAtIndex:indexPath.modelIndexPath.row];
            
            if (indexPath.listIndexPath.section < [listSectionViewDataSource count])
            {
                NSArray *listDataSource = [listSectionViewDataSource objectAtIndex:indexPath.listIndexPath.section];
                
                if (indexPath.listIndexPath.row < [listDataSource count])
                {
                    cell = [listView dequeueReusableCellWithIdentifier:kLYPCVCListTableViewCellReUseId
                                                          forIndexPath:indexPath.listIndexPath];                    
                    cell.textLabel.text = @"123";
                }
            }
        }
    }

    
    return cell;
}

#pragma mark - LYPageViewDelegate

- (void)pageView:(nonnull LYPageView *)pageView didSelectedAtIndexPath:(nonnull LYIndexPath *)indexPath
{
    NSLog(@"didSelectedAtIndexPath");
}

//- (CGSize)pageView:(LYPageView *)pageView
//          layout:(UICollectionViewLayout *)collectionViewLayout
//          referenceSizeForHeaderInSection:(NSInteger)section
//{
//    return CGSizeMake(50, 0);
//}

//- (CGSize)pageView:(nonnull LYPageView *)pageView
//          layout:(nonnull UICollectionViewLayout *)collectionViewLayout
//          referenceSizeForFooterInSection:(NSInteger)section
//{
//    return CGSizeMake(50, 0);
//}

- (CGFloat)pageView:(LYPageView *)pageView heightForListViewRowAtIndexPath:(LYIndexPath *)indexPath
{
    return 50;
}

- (CGFloat)pageView:(nonnull LYPageView *)pageView heightForListViewHeaderAtIndexPath:(nonnull LYIndexPath *)indexPath
{
    return 50;
}

- (CGFloat)pageView:(nonnull LYPageView *)pageView heightForListViewFooterAtIndexPath:(nonnull LYIndexPath *)indexPath
{
    return 30;
}

//- (UICollectionReusableView *)pageView:(LYPageView *)pageView
//                        collectionView:(UICollectionView *)collectionView
//               viewForSupplementOfKind:(NSString *)kind
//                           atIndexPath:(LYIndexPath *)indexPath
//{
//    if ([kind isEqualToString:UICollectionElementKindSectionHeader])
//    {
//        return [collectionView dequeueReusableSupplementaryViewOfKind:kind
//                                                  withReuseIdentifier:kLYPCVCModelPageSectionHeaderReUseId
//                                                         forIndexPath:indexPath.modelIndexPath];
//    }else if ([kind isEqualToString:UICollectionElementKindSectionFooter])
//    {
//        return [collectionView dequeueReusableSupplementaryViewOfKind:kind
//                                                  withReuseIdentifier:kLYPCVCModelPageSectionFooterReUseId
//                                                         forIndexPath:indexPath.modelIndexPath];
//    }
//    
//    return nil;
//}

- (nullable UIView *)pageView:(nonnull LYPageView *)pageView
                     listView:(nonnull UITableView *)listView
                     viewForListViewHeaderAtIndexPath:(nonnull LYIndexPath *)indexPath
{
    UITableViewHeaderFooterView *listHeaderView = [listView dequeueReusableHeaderFooterViewWithIdentifier:kLYPCVCListTableSectionHeaderReUseId];
    
    return listHeaderView;
}

- (nullable UIView *)pageView:(nonnull LYPageView *)pageView
                     listView:(nonnull UITableView *)listView
                     viewForListViewFooterAtIndexPath:(nonnull LYIndexPath *)indexPath
{
    UITableViewHeaderFooterView *listFooterView = [listView dequeueReusableHeaderFooterViewWithIdentifier:kLYPCVCListTableSectionFooterReUseId];
    
    return listFooterView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
