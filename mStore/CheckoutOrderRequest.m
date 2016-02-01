//
//  CheckoutOrderRequest.m
//  mStore
//
//  Created by Cihangir Sungur on 1/31/16.
//  Copyright © 2016 Cihangir Sungur. All rights reserved.
//

#import "CheckoutOrderRequest.h"

@implementation CheckoutOrderRequest

- (id)init
{
    self = [super init];
    
    if (nil != self)
    {
        self.requestURL = @"https://demo3033169.mockable.io/orders";
        self.baseResponse = [[CheckoutOrderResponse alloc] init];
    }
    
    return self;
}

@end
