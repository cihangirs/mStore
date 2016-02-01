//
//  OrderCell.m
//  mStore
//
//  Created by Cihangir Sungur on 1/29/16.
//  Copyright © 2016 Cihangir Sungur. All rights reserved.
//

#import "OrderCell.h"

@implementation OrderCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setOrderModel:(Order *)order
{
    self.orderCount.text = [NSString stringWithFormat:@"%d", order.count];
    self.orderName.text = order.product.productName;
}

@end
