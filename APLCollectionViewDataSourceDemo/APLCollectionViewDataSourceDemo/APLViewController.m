//
//  APLViewController.m
//  APLCollectionViewDataSourceDemo
//
//  Created by Tobias Conradi on 07.02.14.
//  Copyright (c) 2014 apploft GmbH. All rights reserved.
//

#import "APLViewController.h"
#import "APLCollectionViewDataSource.h"
#import "APLCollectionViewCell.h"

@interface APLViewController () <APLCollectionViewDataSourceDelegate>
@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;
@property (nonatomic) APLCollectionViewDataSource *dataSource;
@end

@implementation APLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    APLCollectionViewDataSource *dataSource= [APLCollectionViewDataSource new];
    dataSource.collectionView = self.collectionView;
    dataSource.cellIdentifier = @"cell";
    dataSource.delegate = self;
    dataSource.objects = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    self.dataSource = dataSource;
}

- (void)configureCollectionViewCell:(APLCollectionViewCell *)cell forItem:(id)item atIndexPath:(NSIndexPath *)indexPath {
   cell.label.text = item;
}


@end
