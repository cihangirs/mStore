//
//  CheckoutOrderResponse.m
//  mStore
//
//  Created by Cihangir Sungur on 1/31/16.
//  Copyright © 2016 Cihangir Sungur. All rights reserved.
//

#import "CheckoutOrderResponse.h"

@implementation CheckoutOrderResponse

- (void)parseJSONArray:(NSArray *)json
{
    
}

- (void)parseJSONDictionary:(NSDictionary *)json
{
    self.resultString = [json objectForKey:@"status"];
}

@end
