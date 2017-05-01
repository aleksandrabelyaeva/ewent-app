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

@end

@implementation ApiClient

- (void)loadEventsWithParams:(NSDictionary *)params {
    
    [self fetchDataWithParams:@{@"city" : @"dnepr"}];
//    [self fetchDataWithParams:params];
    
    NSLog(@"array of events in api client %@",self.arrayOfEvents);
    
}


- (void)fetchDataWithParams:(NSDictionary *)params {
    
    NSURLSessionConfiguration *baseConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFHTTPSessionManager *managerGET = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:baseConfiguration];
    
    managerGET.requestSerializer = [AFJSONRequestSerializer serializer];
  //  managerGET.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [managerGET.requestSerializer setValue:@"text/json" forHTTPHeaderField:@"Content-Type"];
    
    //TODO: removethis
    NSDictionary *paramsPixabay = @{ @"key"      : @"4718252-fc5e38b94cdda2074623ccba7",
                                     @"q"        : @"blue",
                                     @"per_page" : @"7"
                                   };
    ////
    
    
//    [managerGET GET:@"http://46.98.117.46:8080/getewent2"
    [managerGET GET:@"https://pixabay.com/api/"
         parameters:paramsPixabay
           progress:^(NSProgress * _Nonnull downloadProgress) {}
            success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSLog(@"Success!");
//                NSLog(@"responeObject %@",responseObject);
                [self deserializationResponse:responseObject];
                
                //отправляется нотификация
                [[NSNotificationCenter defaultCenter] postNotificationName:@"uploadInfo" object:nil];
            }
            failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                NSLog(@"Error: %@", error);
            }
     ];
}

- (void)deserializationResponse:(id)responseData {
    
//    NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];
//    
//    NSArray *responseArrayOfEvents = [responseDictionary valueForKey:@"ewents"];
//    
//    NSMutableArray *arrayOfEvents = [NSMutableArray new];
//    
//    for (NSDictionary *responseEvent in responseArrayOfEvents) {
//        Event *event = [Event new];
//        event.name = [responseEvent objectForKey:@"name"];
//        event.coverURL = [responseEvent objectForKey:@"cover"];
//        event.date = [responseEvent objectForKey:@"startDate"];
//        event.place = [responseEvent objectForKey:@"placeName"];
////        event.link = [responseEvent objectForKey:@"name"];
//        event.summary = [responseEvent objectForKey:@"description"];
    
//        [arrayOfEvents addObject:event];
//    }

    
//??? 1 array or 2
    NSArray *arrayOfEvents = [responseData objectForKey:@"hits"];
    
    self.arrayOfEvents = [arrayOfEvents copy];
    
    NSLog(@"api client self.arrayOfEvents = %@",self.arrayOfEvents);
}
@end
