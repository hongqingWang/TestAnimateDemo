//
//  TABCollectionAnimated.h
//  AnimatedDemo
//
//  github: https://github.com/tigerAndBull/TABAnimated
//  jianshu: https://www.jianshu.com/p/6a0ca4995dff
//
//  历史更新文档：https://www.jianshu.com/p/e3e9ea295e8a
//  动画下标说明：https://www.jianshu.com/p/8c361ba5aa18
//  豆瓣效果说明：https://www.jianshu.com/p/1a92158ce83a
//  嵌套视图说明：https://www.jianshu.com/p/cf8e37195c11
//
//  Created by tigerAndBull on 2019/4/27.
//  Copyright © 2019 tigerAndBull. All rights reserved.
//

#import "TABViewAnimated.h"

NS_ASSUME_NONNULL_BEGIN

@interface TABCollectionAnimated : TABViewAnimated

/**
 * 单section的UICollectionView的cellSize
 */
@property (nonatomic,assign) CGSize cellSize;

/**
 * 多section的UICollectionView的cellSize集合
 */
@property (nonatomic,strong) NSArray <NSValue *> *cellSizeArray;

/**
 * 指定section加载动画集合
 * 不设置默认为工程中所有的section
 */
@property (nonatomic,strong) NSArray <NSNumber *> *animatedSectionArray;

/**
 * 当前正在动画中的分区
 */
@property (nonatomic,strong) NSMutableArray <NSNumber *> *runAnimationSectionArray;

/**
 * 设置动画时的分区数量
 */
@property (nonatomic,assign) NSInteger animatedSectionCount;

/**
 * 设置单section动画时row数量，默认填充屏幕为准
 **/
@property (nonatomic,assign) NSInteger animatedCount;

/**
 * 单section表格组件初始化方式，row值以填充contentSize的数量为标准
 * one section init method
 * When using it to init, the count decided by the table's contentSize and the cell's height, animatedCount = the table's contentSize / the cell's height.
 *
 * @param cellClass cell，以填充contentSize的数量为标准
 * @param cellSize  cell的高度
 * @return object
 */
+ (instancetype)animatedWithCellClass:(Class)cellClass
                             cellSize:(CGSize)cellSize;

/**
 * 单section表格组件初始化方式，row值以填充contentSize的数量为标准
 * one section init method, specific animation count
 *
 * @param cellClass 模版cell
 * @param animatedCount 动画时row值
 * @return object
 */
+ (instancetype)animatedWithCellClass:(Class)cellClass
                             cellSize:(CGSize)cellSize
                        animatedCount:(NSInteger)animatedCount;

/**
 * 如果原UICollectionView是多个section，但是只想指定一个section启动动画，使用该初始化方法
 * 动画数量以填充contentSize的数量为标准
 *
 * @param cellClass 注册的cell类型
 * @param cellSize 动画时cell的size
 * @param section 被指定的section
 * @return object
 */
+ (instancetype)animatedWithCellClass:(Class)cellClass
                             cellSize:(CGSize)cellSize
                            toSection:(NSInteger)section;

/**
 * 如果原UICollectionView是多个section，但是只想指定一个section启动动画，使用该初始化方法
 *
 * @param cellClass 注册的cell类型
 * @param cellSize 动画时cell的size
 * @param animatedCount 指定section的动画数量
 * @param section 被指定的section
 * @return object
 */
+ (instancetype)animatedWithCellClass:(Class)cellClass
                             cellSize:(CGSize)cellSize
                        animatedCount:(NSInteger)animatedCount
                            toSection:(NSInteger)section;

/**
 * 多section表格组件初始化方式
 * for sections
 *
 * @param cellClassArray 模版cell数组
 * @param animatedCountArray 动画时row值的集合
 * @return object
 */
+ (instancetype)animatedWithCellClassArray:(NSArray <Class> *)cellClassArray
                             cellSizeArray:(NSArray <NSValue *> *)cellSizeArray
                        animatedCountArray:(NSArray <NSNumber *> *)animatedCountArray;

/**
 * 这个初始化方式为部分section需要动画的UICollectionView提供
 *
 * 上一个初始化方式，section和数组元素依次对应，所有section都会有动画
 * 现在可以根据animatedSectionArray指定section，不指定的section没有动画。
 *
 * 举个例子：
 * 比如 animatedSectionArray = @[@(3),@(4)];
 * 意思是 cellSizeArray,animatedCountArray,cellClassArray数组中的第一个元素，是 section == 3 的动画数据
 *
 * @param cellClassArray 模版cell数组
 * @param cellSizeArray 模版cell对应size
 * @param animatedCountArray 对应section动画数量
 * @param animatedSectionArray animatedSectionArray
 * @return object
 */
+ (instancetype)animatedWithCellClassArray:(NSArray <Class> *)cellClassArray
                             cellSizeArray:(NSArray <NSValue *> *)cellSizeArray
                        animatedCountArray:(NSArray <NSNumber *> *)animatedCountArray
                      animatedSectionArray:(NSArray <NSNumber *> *)animatedSectionArray;

/**
 * 判断指定分区是否在动画中
 *
 * @param collectionView collectionView 目标组件
 * @param section section 目标section
 * @return return value 是否在动画中
 */
- (BOOL)currentSectionIsAnimating:(UICollectionView *)collectionView
                          section:(NSInteger)section;

@end

NS_ASSUME_NONNULL_END
