//
//  BaseRequest.h
//  mStore
//
//  Created by Cihangir Sungur on 1/30/16.
//  Copyright © 2016 Cihangir Sungur. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseResponse.h"

@interface BaseRequest : NSObject

@property (nonatomic) NSString *requestURL;
@property (nonatomic) BaseResponse *baseResponse;

- (void)makeRequestWithData:(NSData *)data withMethod:(NSString *)string withCompletionHandler:(void(^)(BaseResponse *response))handler;

@end
