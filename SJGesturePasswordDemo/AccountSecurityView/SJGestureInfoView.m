//
//  SJGestureInfoView.m
//  SJGesturePasswordDemo
//
//  Created by sino on 2019/2/14.
//  Copyright © 2019年 sino. All rights reserved.
//
#import "SJGestureInfoView.h"
#import "SJGestureInfoViewCell.h"

@interface SJGestureInfoView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout> {
    UICollectionView *_collectionView;
}
@end

@implementation SJGestureInfoView

- (instancetype)init {
    if (self = [super init]) {
        [self buildUI];
        [self setDefaultColor];
    }
    return self;
}

- (void)buildUI {
    self.layer.masksToBounds = true;
    //初始化collectionView
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor clearColor];
    [_collectionView registerClass:[SJGestureInfoViewCell class] forCellWithReuseIdentifier:@"SJGestureInfoViewCell"];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [self addSubview:_collectionView];
}

//自动布局
- (void)layoutSubviews {
    [super layoutSubviews];
    _collectionView.frame = self.bounds;
}

//设置默认颜色
- (void)setDefaultColor {
    self.itemBackGoundColor = [UIColor lightGrayColor];
}


#pragma mark -
#pragma mark CollectonViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 9;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return [self itemSpacing];
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return [self itemSpacing];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake([self itemWidth], [self itemWidth]);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake([self itemSpacing], [self itemSpacing], [self itemSpacing], [self itemSpacing]);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* cellId = @"SJGestureInfoViewCell";
    SJGestureInfoViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    cell.gestureSelected = [_passWord containsString:[NSString stringWithFormat:@"%zd",indexPath.row]];
    cell.itemBackGoundColor = self.itemBackGoundColor;
    return cell;
}

#pragma mark -
#pragma mark CollectionView辅助方法
- (CGFloat)itemSpacing {
    return self.bounds.size.width/10.0f;
}

- (CGFloat)itemWidth {
    return (self.bounds.size.width - 4*[self itemSpacing])/3.0f;
}

#pragma mark -
#pragma mark 功能方法
- (void)refresh {
    _passWord = @"";
    [_collectionView reloadData];
}

#pragma mark -
#pragma mark Setter
- (void)setPassWord:(NSString *)passWord {
    _passWord = passWord;
    [_collectionView reloadData];
}

@end
