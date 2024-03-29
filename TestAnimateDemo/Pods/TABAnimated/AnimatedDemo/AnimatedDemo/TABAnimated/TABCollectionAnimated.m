//
//  TABCollectionAnimated.m
//  AnimatedDemo
//
//  Created by tigerAndBull on 2019/4/27.
//  Copyright © 2019 tigerAndBull. All rights reserved.
//

#import "TABCollectionAnimated.h"

@implementation TABCollectionAnimated

+ (instancetype)animatedWithCellClass:(Class)cellClass
                             cellSize:(CGSize)cellSize {
    TABCollectionAnimated *obj = [[TABCollectionAnimated alloc] init];
    obj.cellClassArray = @[cellClass];
    obj.cellSize = cellSize;
    obj.animatedCount = ceilf([UIScreen mainScreen].bounds.size.height/cellSize.height*1.0);
    return obj;
}

+ (instancetype)animatedWithCellClass:(Class)cellClass
                             cellSize:(CGSize)cellSize
                        animatedCount:(NSInteger)animatedCount {
    TABCollectionAnimated *obj = [self animatedWithCellClass:cellClass cellSize:cellSize];
    obj.animatedCount = animatedCount;
    return obj;
}

+ (instancetype)animatedWithCellClass:(Class)cellClass
                             cellSize:(CGSize)cellSize
                            toSection:(NSInteger)section {
    TABCollectionAnimated *obj = [self animatedWithCellClass:cellClass cellSize:cellSize];
    obj.animatedCountArray = @[@(ceilf([UIScreen mainScreen].bounds.size.height/cellSize.height*1.0))];
    obj.animatedSectionArray = @[@(section)];
    return obj;
}

+ (instancetype)animatedWithCellClass:(Class)cellClass
                             cellSize:(CGSize)cellSize
                        animatedCount:(NSInteger)animatedCount
                            toSection:(NSInteger)section {
    TABCollectionAnimated *obj = [self animatedWithCellClass:cellClass cellSize:cellSize];
    obj.animatedCountArray = @[@(animatedCount)];
    obj.animatedSectionArray = @[@(section)];
    return obj;
}

+ (instancetype)animatedWithCellClassArray:(NSArray <Class> *)cellClassArray
                             cellSizeArray:(NSArray <NSValue *> *)cellSizeArray
                        animatedCountArray:(NSArray <NSNumber *> *)animatedCountArray {
    TABCollectionAnimated *obj = [[TABCollectionAnimated alloc] init];
    obj.animatedCountArray = animatedCountArray;
    obj.cellSizeArray = cellSizeArray;
    obj.cellClassArray = cellClassArray;
    return obj;
}

+ (instancetype)animatedWithCellClassArray:(NSArray <Class> *)cellClassArray
                             cellSizeArray:(NSArray <NSValue *> *)cellSizeArray
                        animatedCountArray:(NSArray <NSNumber *> *)animatedCountArray
                      animatedSectionArray:(NSArray <NSNumber *> *)animatedSectionArray {
    TABCollectionAnimated *obj = [self animatedWithCellClassArray:cellClassArray
                                                    cellSizeArray:cellSizeArray
                                               animatedCountArray:animatedCountArray];
    obj.animatedSectionArray = animatedSectionArray;
    return obj;
}

- (instancetype)init {
    if (self = [super init]) {
        _runAnimationSectionArray = @[].mutableCopy;
        _animatedSectionCount = 0;
        _animatedCount = 1;
    }
    return self;
}

- (void)setCellSize:(CGSize)cellSize {
    _cellSize = cellSize;
    _cellSizeArray = @[[NSValue valueWithCGSize:cellSize]];
}

- (BOOL)currentSectionIsAnimating:(UICollectionView *)collectionView
                          section:(NSInteger)section {
    
    for (NSNumber *num in self.runAnimationSectionArray) {
        if ([num integerValue] == section) {
            return YES;
        }
    }
    return NO;
}

@end
