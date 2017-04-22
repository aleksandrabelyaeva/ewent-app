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
@property (nullable, nonatomic) NSURL *coverURL;

@end
