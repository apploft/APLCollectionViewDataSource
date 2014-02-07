//
// Created by Tobias Conradi on 07.02.14.
// Copyright (c) 2014 apploft GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol APLCollectionViewDataSourceDelegate;


@interface APLCollectionViewDataSource : NSObject <UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet id<APLCollectionViewDataSourceDelegate> delegate;
@property (strong, nonatomic) NSArray *objects;
/**
 *  Identifier for collection view cells if only one cell type is used.
 */
@property (strong, nonatomic) NSString *cellIdentifier;

@property (strong, nonatomic) NSString *supplementaryViewReuseIdentifier;

/**
* Convenience method for subclasses.
* Returns either the property or asks the delegate for the cell identifier.
*/
- (NSString *)cellIdentifierForCellAtIndexPath:(NSIndexPath *)indexPath;
@end

@protocol APLCollectionViewDataSourceDelegate <NSObject>
@required
/**
 *  Configure the cell with item at the given index path.
 *
 *  @param cell      cell to configure
 *  @param item      model object
 *  @param indexPath indexPath of the cell
 */
- (void)configureCollectionViewCell:(UICollectionViewCell*)cell forItem:(id)item atIndexPath:(NSIndexPath*)indexPath;


@optional

/**
 *  Return the cell identifier for the given indexPath.
 *  Default implementation returns self.cellIdentifier for all indexPaths
 *
 *  @param indexPath indexPath
 *
 *  @return cell identifier
 */
- (NSString*)cellIdentifierForCellAtIndexPath:(NSIndexPath*)indexPath;

/**
 *  Configure the supplementary view of kind at index path.
 *
 *  @param view      view to configure
 *  @param kind      kind of the view
 *  @param indexPath index path of the view
 */
- (void) configureSupplementaryView:(UICollectionReusableView*)view ofKind:(NSString*)kind atIndexPath:(NSIndexPath*)indexPath;


@end