//
//  BaseRequest.m
//  mStore
//
//  Created by Cihangir Sungur on 1/30/16.
//  Copyright © 2016 Cihangir Sungur. All rights reserved.
//

#import "BaseRequest.h"

@implementation BaseRequest

- (void)makeRequestWithData:(NSData *)data withMethod:(NSString *)string withCompletionHandler:(void(^)(BaseResponse *response))handler
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:_requestURL]];
    
    [request setHTTPMethod:string];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[data length]] forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:data];
    
    __block NSArray *json;
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               
                               if (data != nil && connectionError == nil)
                               {
                                   json = [NSJSONSerialization JSONObjectWithData:data
                                                                          options:0
                                                                            error:nil];
                                   
                                   if ([json isKindOfClass:[NSMutableArray class]])
                                   {
                                       [_baseResponse parseJSONArray:json];
                                   }
                                   
                                   else if ([json isKindOfClass:[NSMutableDictionary class]])
                                   {
                                       [_baseResponse parseJSONDictionary:(NSDictionary *)json];
                                   }
                                   
                                   handler(_baseResponse);
                                   
                               }
                               
                           }];
}

@end
