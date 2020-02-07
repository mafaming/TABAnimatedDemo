//
//  MPSearchPostListLayout.h
//  MojiPop
//
//  Created by mafaming on 2019/12/11.
//  Copyright © 2019 manboker. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class MPSearchPostListLayout;

@protocol MPSearchPostListLayoutDataSource<NSObject>
@required
/**
  * 每个item的高度
  */
- (CGFloat)waterFallLayout:(MPSearchPostListLayout *)waterFallLayout heightForItemAtIndexPath:(NSUInteger)indexPath itemWidth:(CGFloat)itemWidth;

@optional
/**
 * 有多少列
 */
- (NSUInteger)columnCountInWaterFallLayout:(MPSearchPostListLayout *)waterFallLayout;

/**
 * 每列之间的间距
 */
- (CGFloat)columnMarginInWaterFallLayout:(MPSearchPostListLayout *)waterFallLayout;

/**
 * 每行之间的间距
 */
- (CGFloat)rowMarginInWaterFallLayout:(MPSearchPostListLayout *)waterFallLayout;

/**
 * 每个item的内边距
 */
- (UIEdgeInsets)edgeInsetsInWaterFallLayout:(MPSearchPostListLayout *)waterFallLayout;

@end
                    
@interface MPSearchPostListLayout : UICollectionViewLayout

/**
 * 代理
 */
@property (nonatomic, weak) id<MPSearchPostListLayoutDataSource> delegate;

@end

NS_ASSUME_NONNULL_END
