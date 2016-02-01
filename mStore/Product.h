//
//  Product.h
//  mStore
//
//  Created by Cihangir Sungur on 1/28/16.
//  Copyright © 2016 Cihangir Sungur. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property (nonatomic) int productId;
@property (nonatomic) NSString *productName;
@property (nonatomic) NSString *productPrice;

@end
