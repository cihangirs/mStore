//
//  ProductRequest.m
//  mStore
//
//  Created by Cihangir Sungur on 1/30/16.
//  Copyright © 2016 Cihangir Sungur. All rights reserved.
//

#import "ProductRequest.h"

@implementation ProductRequest

- (id)init
{
    self = [super init];
    
    if (nil != self)
    {
        self.requestURL = @"https://demo3033169.mockable.io/products";
        self.baseResponse = [[ProductResponse alloc] init];
    }
    
    return self;
}

@end
