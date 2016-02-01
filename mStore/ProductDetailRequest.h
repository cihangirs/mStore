//
//  ProductDetailRequest.h
//  mStore
//
//  Created by Cihangir Sungur on 1/30/16.
//  Copyright © 2016 Cihangir Sungur. All rights reserved.
//

#import "BaseRequest.h"
#import "ProductDetailResponse.h"

@interface ProductDetailRequest : BaseRequest

- (id)initWithProductId:(int)productId;

@end
