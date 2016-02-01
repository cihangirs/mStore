//
//  ProductResponse.h
//  mStore
//
//  Created by Cihangir Sungur on 1/30/16.
//  Copyright © 2016 Cihangir Sungur. All rights reserved.
//

#import "BaseResponse.h"
#import "Product.h"

@interface ProductResponse : BaseResponse

@property (nonatomic) NSMutableArray *productArray;

@end
