//
//  ApiClient.m
//  eWent
//
//  Created by Aleksandra on 4/30/17.
//  Copyright © 2017 Aleksandra. All rights reserved.
//

#import "ApiClient.h"
#import "Event.h"



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

static NSString *ulrString = @"";
- (void)fetchDataWithParams:(NSDictionary *)params {
    
    NSURL *url = [[NSURL alloc] initWithString:ulrString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPMethod:@"POST"];
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:params options:0 error:nil];
    [request setHTTPBody:postData];
    
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
        NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
    
            if (data) {
                NSLog(@"RESPONSE: %@",response);
                NSDictionary* dictr = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                NSLog(@"DATA: %@",dictr);
                NSLog(@"ERROR: %@",error);
    
            } else {
    
            }
        }];
        [postDataTask resume];
    
    

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
