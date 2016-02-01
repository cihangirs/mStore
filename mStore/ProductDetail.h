//
//  ProductDetail.h
//  mStore
//
//  Created by Cihangir Sungur on 1/28/16.
//  Copyright © 2016 Cihangir Sungur. All rights reserved.
//

#import "Product.h"

@interface ProductDetail : Product

@property (nonatomic) double star;
@property (nonatomic) int reviews;
@property (nonatomic) NSURL *imageURL;
@property (nonatomic) NSString *detail;
@property (nonatomic) BOOL inStock;
@property (nonatomic) NSMutableArray *specs;
@property (nonatomic) NSMutableArray *bundles;

@end
