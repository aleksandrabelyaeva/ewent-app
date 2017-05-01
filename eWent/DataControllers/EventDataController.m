//
//  EventDataController.m
//  eWent
//
//  Created by Aleksandra on 4/24/17.
//  Copyright © 2017 Aleksandra. All rights reserved.
//

#import "EventDataController.h"
#import "Event.h"

#import "ApiClient.h"

@interface EventDataController()

@property (nonatomic, strong, readwrite) NSArray *eventList;
@property (nonatomic, strong) ApiClient *apiClient;

@end

@implementation EventDataController


- (instancetype)init {
    self = [super init];
    
    if (self) {
        _apiClient = [ApiClient new];
        _eventList = [[NSArray alloc] init];
        [self loadingEvents];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateEvents) name:@"uploadInfo" object:nil];
        NSLog(@"event list in data contr - %@",self.eventList);
        
        return self;
    }
    
    return nil;
}

- (void)updateEvents {
    self.eventList = self.apiClient.arrayOfEvents;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"loadingData" object:nil];
}

- (void)loadingEvents {
    
   // [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadingEvents) name:@"hip" object:nil];
    [self.apiClient loadEventsWithParams:nil];
    NSLog(@"events list - %@",self.eventList);
    NSLog(@"events list count - %lu",(unsigned long)self.eventList.count);
}

-(NSInteger)eventCount {
    return [self.eventList count];
}

-(Event *)eventAtIndex:(NSInteger)index {
    return [self.eventList objectAtIndex:index];
}
@end
