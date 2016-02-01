//
//  ProductDetailRequest.m
//  mStore
//
//  Created by Cihangir Sungur on 1/30/16.
//  Copyright © 2016 Cihangir Sungur. All rights reserved.
//

#import "ProductDetailRequest.h"

@implementation ProductDetailRequest

- (id)initWithProductId:(int)productId
{
    self = [super init];
    
    if (nil != self)
    {
        self.requestURL = [NSString stringWithFormat:@"https://demo3033169.mockable.io/products/%d", productId];
        self.baseResponse = [[ProductDetailResponse alloc] init];
    }
    
    return self;
}

@end
