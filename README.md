# APLCollectionViewDataSource

[![Version](http://cocoapod-badges.herokuapp.com/v/APLCollectionViewDataSource/badge.png)](http://cocoadocs.org/docsets/APLCollectionViewDataSource)
[![Platform](http://cocoapod-badges.herokuapp.com/p/APLCollectionViewDataSource/badge.png)](http://cocoadocs.org/docsets/APLCollectionViewDataSource)

APLCollectionViewDataSource is a simple array based datasource for collection views.

It implements all required UICollectionViewDataSource methods so that the view controller
only needs to implement a single delegate-method which configure the cells with an item.

* Supports multiple cell identifiers.
* Currently a single supplementary view is supported.


## Installation

APLCollectionViewDataSource is available through [CocoaPods](http://cocoapods.org), to install
it simply add the following line to your Podfile:

    pod "APLCollectionViewDataSource"

## Usage

Import header file:

    #import "APLCollectionViewDataSource.h"

Declare a dataSource property:

    @property (nonatomic) APLCollectionViewDataSource *dataSource;

Create a APLCollectionViewDataSource instance and configure it:

    APLCollectionViewDataSource *dataSource= [APLCollectionViewDataSource new];
    dataSource.collectionView = self.collectionView; // sets itself as collection view data source   
    dataSource.cellIdentifier = @"cell";
    dataSource.delegate = self; // needs to conform to APLCollectionViewDataSourceDelegate
    dataSource.objects = @[]; // your data arry
    self.dataSource = dataSource;

Declare the protocol method required to configure your cell

    - (void)configureCollectionViewCell:(UICollectionViewCell *)cell forItem:(id)item atIndexPath:(NSIndexPath *)indexPath {
       // configure cell
    }

When you retrieve new data, update your dataSource like this:

    self.dataSource.objects = newObjects;

## TODO
* Multiple sections.
* Multiple supplementary views. 

## Author

apploft GmbH, Tobias Conradi tconradi@apploft.de

## License

APLCollectionViewDataSource is available under the MIT license. See the LICENSE file for more info.

