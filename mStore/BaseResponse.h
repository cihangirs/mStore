//
//  BaseResponse.h
//  mStore
//
//  Created by Cihangir Sungur on 1/30/16.
//  Copyright © 2016 Cihangir Sungur. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseResponse : NSObject

- (void)parseJSONArray:(NSArray *)json;
- (void)parseJSONDictionary:(NSDictionary *)json;

@end
