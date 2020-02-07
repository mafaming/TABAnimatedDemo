//
//  ViewController.m
//  testDemo
//
//  Created by 马发明 on 2020/2/7.
//  Copyright © 2020 mafaming. All rights reserved.
//

#import "ViewController.h"
#import "MPSearchPostListLayout.h"
#import <TABAnimated/TABAnimated.h>
#import "MPSearchPostCell.h"

@interface ViewController ()<MPSearchPostListLayoutDataSource,UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *postsArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.collectionView];

    [self.collectionView tab_startAnimation];
    [self performSelector:@selector(refreshLoadData) withObject:nil afterDelay:3.0];
}

- (void)refreshLoadData
{
    for (int i=0; i<20; i++) {
        [self.postsArray addObject:@(i)];
    }
    [self.collectionView reloadData];
    [self.collectionView tab_endAnimation];
}

#pragma mark - UICollectionView DataSource
//定义展示的Section的个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//定义展示的UICollectionViewCell的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.postsArray count];
}

//每个UICollectionView展示的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MPSearchPostCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MPSearchPostCell" forIndexPath:indexPath];
    if (indexPath.row%2 == 0) {
        cell.contentView.backgroundColor = [UIColor yellowColor];
    } else {
        cell.contentView.backgroundColor = [UIColor redColor];
    }
    return cell;
}

//返回这个UICollectionView是否可以被选择
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (CGFloat)waterFallLayout:(MPSearchPostListLayout *)waterFallLayout heightForItemAtIndexPath:(NSUInteger)indexPath itemWidth:(CGFloat)itemWidth
{
    return indexPath%2 ? 100.f: 150.f;
}

- (NSUInteger)columnCountInWaterFallLayout:(MPSearchPostListLayout *)waterFallLayout
{
    return 2;
}

#pragma mark - Get
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        MPSearchPostListLayout *flowLayout = [[MPSearchPostListLayout alloc] init];
        flowLayout.delegate = self;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.dataSource = self;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        [_collectionView registerClass:[MPSearchPostCell class] forCellWithReuseIdentifier:@"MPSearchPostCell"];
        CGFloat cellWidth = (self.view.frame.size.width - 4*3)/2;
        CGFloat cellHeight = cellWidth/182.f * 258.f;
        _collectionView.tabAnimated = [TABCollectionAnimated animatedWithCellClass:[MPSearchPostCell class]
                                                                          cellSize:CGSizeMake(cellWidth, cellHeight)];
    }
    return _collectionView;
}

- (NSMutableArray *)postsArray
{
    if (!_postsArray) {
        _postsArray = [[NSMutableArray alloc] init];
    }
    return _postsArray;
}

@end
