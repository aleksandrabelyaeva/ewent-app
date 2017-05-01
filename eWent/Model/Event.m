//
//  Event.m
//  eWent
//
//  Created by Aleksandra on 4/22/17.
//  Copyright © 2017 Aleksandra. All rights reserved.
//

#import "Event.h"

@implementation Event

-(instancetype)initWithName:(NSString *)name
         coverURL:(NSString *)coverURL
             date:(NSString *)date
            place:(NSString *)place
             link:(NSString *)link
          summary:(NSString *)summary {
    
    self = [super init];
    
    if (self) {
        _name = name;
        _coverURL = coverURL;
        _date = date;
        _place = place;
        _link = link;
        _summary = summary;
        
        return self;
    }
    
    return nil;
}

@end
