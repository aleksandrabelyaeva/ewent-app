//
//  ApiClient.m
//  eWent
//
//  Created by Aleksandra on 4/30/17.
//  Copyright © 2017 Aleksandra. All rights reserved.
//

#import "ApiClient.h"
#import "Event.h"

#import <AFNetworking/AFNetworking.h>

@interface ApiClient()

@property (nonatomic, strong) NSArray *arrayOfEvents;

@end

@implementation ApiClient

- (NSArray *)loadEventsWithParams:(NSDictionary *)params {
    
    [self fetchDataWithParams:@{@"city" : @"dnepr"}];
//    [self fetchDataWithParams:params];
    
    NSLog(@"array of events in api client %@",self.arrayOfEvents);
    return self.arrayOfEvents;
    
}


- (void)fetchDataWithParams:(NSDictionary *)params {
    
    NSURLSessionConfiguration *baseConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFHTTPSessionManager *managerGET = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:baseConfiguration];
    
    managerGET.requestSerializer = [AFJSONRequestSerializer serializer];
    managerGET.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [managerGET.requestSerializer setValue:@"text/json" forHTTPHeaderField:@"Content-Type"];
    
    [managerGET GET:@"http://46.98.117.46:8080/getewent2"
         parameters:params
           progress:^(NSProgress * _Nonnull downloadProgress) {}
            success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSLog(@"Success!");
                [self deserializationResponse:responseObject];
            }
            failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                NSLog(@"Error: %@", error);
            }
     ];
}

- (void)deserializationResponse:(id)responseData {
    
    NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];
    
    NSArray *responseArrayOfEvents = [responseDictionary valueForKey:@"ewents"];
    
    NSMutableArray *arrayOfEvents = [NSMutableArray new];
    
    for (NSDictionary *responseEvent in responseArrayOfEvents) {
        Event *event = [Event new];
        event.name = [responseEvent objectForKey:@"name"];
        event.coverURL = [responseEvent objectForKey:@"cover"];
        event.date = [responseEvent objectForKey:@"startDate"];
        event.place = [responseEvent objectForKey:@"placeName"];
//        event.link = [responseEvent objectForKey:@"name"];
        event.summary = [responseEvent objectForKey:@"description"];
       
        [arrayOfEvents addObject:event];
    }

    
//??? 1 array or 2
    
    self.arrayOfEvents = [arrayOfEvents copy];
   // [[NSNotificationCenter defaultCenter] postNotificationName:@"hip" object:nil];
    NSLog(@"%@",self.arrayOfEvents);
}
@end
