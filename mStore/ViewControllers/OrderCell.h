//
//  OrderCell.h
//  mStore
//
//  Created by Cihangir Sungur on 1/29/16.
//  Copyright © 2016 Cihangir Sungur. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Order.h"

@interface OrderCell : UICollectionViewCell

@property (nonatomic, strong) IBOutlet UILabel *orderCount;
@property (nonatomic, strong) IBOutlet UILabel *orderName;

- (void)setOrderModel:(Order *)order;

@end
