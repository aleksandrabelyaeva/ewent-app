//
//  ApiClient.h
//  eWent
//
//  Created by Aleksandra on 4/30/17.
//  Copyright © 2017 Aleksandra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ApiClient : NSObject

- (NSArray *)loadEventsWithParams:(NSDictionary *)params;

@end
