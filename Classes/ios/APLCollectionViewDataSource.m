//
// Created by Tobias Conradi on 07.02.14.
// Copyright (c) 2014 apploft GmbH. All rights reserved.
//

#import "APLCollectionViewDataSource.h"

@implementation APLCollectionViewDataSource

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.objects count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = [self cellIdentifierForCellAtIndexPath:indexPath];
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    id item = self.objects[indexPath.row];
    [self.delegate configureCollectionViewCell:cell forItem:item atIndexPath:indexPath];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView*reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:self.supplementaryViewReuseIdentifier forIndexPath:indexPath];
    if ([self.delegate respondsToSelector:@selector(configureSupplementaryView:ofKind:atIndexPath:)]) {
        [self.delegate configureSupplementaryView:reusableView ofKind:kind atIndexPath:indexPath];
    }
    return reusableView;
}
#pragma mark - internal helper
- (NSString*) cellIdentifierForCellAtIndexPath:(NSIndexPath*)indexPath {
    if (self.cellIdentifier) {
        return self.cellIdentifier;
    } else if ([self.delegate respondsToSelector:@selector(cellIdentifierForCellAtIndexPath:)]) {
        return [self.delegate cellIdentifierForCellAtIndexPath:indexPath];
    } else {
        [NSException raise:@"SSICollectionViewDataSource misconfigured" format:@"cellIdentifier needs to be set or delegate must implement -cellIdentifierForCellAtIndexPath:"];
        return nil;
    }
}
#pragma mark - properties
- (void)setObjects:(NSArray *)objects {
    _objects = objects;
    [self.collectionView reloadData];
}

- (void)setCollectionView:(UICollectionView *)collectionView {
    _collectionView = collectionView;
    collectionView.dataSource = self;
}

@end