//
//  Event.h
//  eWent
//
//  Created by Aleksandra on 4/22/17.
//  Copyright © 2017 Aleksandra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic) NSString *coverURL;
@property (nullable, nonatomic) NSString *date;
@property (nullable, nonatomic) NSString *place;
@property (nullable, nonatomic) NSString *link;
@property (nullable, nonatomic) NSString *summary;

- (instancetype) initWithName:(NSString *)name
           coverURL:(NSString *)coverURL
               date:(NSString *)date
              place:(NSString *)place
               link:(NSString *)link
            summary:(NSString *)summary;

@end
