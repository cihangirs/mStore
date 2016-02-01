//
//  ProductDetailResponse.m
//  mStore
//
//  Created by Cihangir Sungur on 1/30/16.
//  Copyright © 2016 Cihangir Sungur. All rights reserved.
//

#import "ProductDetailResponse.h"

@implementation ProductDetailResponse

- (void)parseJSONArray:(NSArray *)json
{

}

- (void)parseJSONDictionary:(NSDictionary *)json
{    
    self.productDetail = [[ProductDetail alloc] init];
    
    self.productDetail.star = [[json objectForKey:@"star"] doubleValue];
    self.productDetail.reviews = [[json objectForKey:@"reviews"] intValue];
    self.productDetail.imageURL = [NSURL URLWithString:[json objectForKey:@"image"]];
    self.productDetail.detail = [json objectForKey:@"detail"];
    self.productDetail.inStock = [[json objectForKey:@"inStock"] boolValue];
    self.productDetail.specs = [json objectForKey:@"specs"];
    self.productDetail.bundles = [json objectForKey:@"bundles"];
}

@end
