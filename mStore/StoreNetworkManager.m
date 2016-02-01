//
//  StoreNetworkManager.m
//  mStore
//
//  Created by Cihangir Sungur on 1/28/16.
//  Copyright © 2016 Cihangir Sungur. All rights reserved.
//

#import "StoreNetworkManager.h"

@implementation StoreNetworkManager

+ (instancetype)sharedManager
{
    static StoreNetworkManager *_sharedClient = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedClient = [[StoreNetworkManager alloc] init];
    });
    
    return _sharedClient;
}

- (id)init
{
    self = [super init];
    
    if (nil != self)
    {
        self.orderDataAray = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)fetchProductsWithCallback:(void (^)(ProductResponse *))handler
{
    ProductRequest *productRequest = [[ProductRequest alloc] init];
    
    [productRequest makeRequestWithData:nil withMethod:@"GET" withCompletionHandler:^(BaseResponse *response){
        handler((ProductResponse *)response);
    }];
}

- (void)fetchProductDetailWithId:(int)productId withCallback:(void (^)(ProductDetailResponse *))handler
{
    ProductDetailRequest *productDetailRequest = [[ProductDetailRequest alloc] initWithProductId:productId];
    
    [productDetailRequest makeRequestWithData:nil withMethod:@"GET" withCompletionHandler:^(BaseResponse *response) {
        handler((ProductDetailResponse *)response);
    }];
}

- (void)checkoutOrderWithData:(NSDictionary *)data withCallback:(void (^)(CheckoutOrderResponse *))handler
{
    NSError __autoreleasing *error = nil;
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:data
                                                       options:0
                                                         error:&error];
    
    
    CheckoutOrderRequest *checkoutOrderRequest = [[CheckoutOrderRequest alloc] init];
    
    [checkoutOrderRequest makeRequestWithData:postData withMethod:@"POST" withCompletionHandler:^(BaseResponse *response) {
        handler((CheckoutOrderResponse *)response);
    }];
}

@end
