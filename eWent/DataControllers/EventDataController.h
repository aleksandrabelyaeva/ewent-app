//
//  EventDataController.h
//  eWent
//
//  Created by Aleksandra on 4/24/17.
//  Copyright © 2017 Aleksandra. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Event;

@interface EventDataController : NSObject

@property (nonatomic, strong, readonly) NSArray *eventList;

- (NSInteger)eventCount;

- (Event *)eventAtIndex:(NSInteger)index;

- (void)loadingEvents;

//- (void)addEventWithName:(NSString *)name
//                coverURL:(NSString *)coverURL
//                    date:(NSString *)date
//                    place:(NSString *)place
//                     link:(NSString *)link
//                  summary:(NSString *)summary;
@end
