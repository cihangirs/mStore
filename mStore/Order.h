//
//  Order.h
//  mStore
//
//  Created by Cihangir Sungur on 1/29/16.
//  Copyright © 2016 Cihangir Sungur. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"

@interface Order : NSObject

@property (nonatomic) int count;
@property (nonatomic) Product *product;

@end
