//
//  StoreNetworkManager.h
//  mStore
//
//  Created by Cihangir Sungur on 1/28/16.
//  Copyright © 2016 Cihangir Sungur. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Order.h"
#import "Product.h"
#import "ProductDetail.h"

#import "ProductRequest.h"
#import "ProductDetailRequest.h"
#import "CheckoutOrderRequest.h"

#import "ProductResponse.h"
#import "ProductDetailResponse.h"
#import "CheckoutOrderResponse.h"

@interface StoreNetworkManager : NSObject

@property (nonatomic) NSString *productURL;
@property (nonatomic) NSString *checkoutURL;

@property (nonatomic) NSMutableArray *productDataArray;
@property (nonatomic) NSMutableArray *orderDataAray;

+ (instancetype)sharedManager;

- (void)fetchProductsWithCallback:(void (^)(ProductResponse *))handler;
- (void)fetchProductDetailWithId:(int)productId withCallback:(void (^)(ProductDetailResponse *))handler;
- (void)checkoutOrderWithData:(NSDictionary *)data withCallback:(void (^)(CheckoutOrderResponse *))handler;

//- (void)checkoutOrderWithData:(NSData *)data withCallback:(void (^)(NSMutableArray *))handler;

@end
