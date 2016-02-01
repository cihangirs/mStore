//
//  ProductResponse.m
//  mStore
//
//  Created by Cihangir Sungur on 1/30/16.
//  Copyright © 2016 Cihangir Sungur. All rights reserved.
//

#import "ProductResponse.h"

@implementation ProductResponse

- (void)parseJSONArray:(NSArray *)json
{
    self.productArray = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dict in json)
    {
        Product *product = [[Product alloc] init];
        product.productId = [[dict objectForKey:@"id"] intValue];
        product.productName = [dict objectForKey:@"name"];
        product.productPrice = [dict objectForKey:@"price"];
        
        [self.productArray addObject:product];
    }
}

- (void)parseJSONDictionary:(NSDictionary *)json
{

    
}

@end
