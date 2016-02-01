//
//  ListViewController.h
//  mStore
//
//  Created by Cihangir Sungur on 1/28/16.
//  Copyright © 2016 Cihangir Sungur. All rights reserved.
//

#import "ViewController.h"
#import "ProductCell.h"

@interface ListViewController : ViewController <UICollectionViewDelegate, UICollectionViewDataSource, AddRemoveOrderProtocol, UITextFieldDelegate, UISearchBarDelegate>

@end
