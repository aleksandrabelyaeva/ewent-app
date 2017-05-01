//
//  Event1+CoreDataProperties.m
//  eWent
//
//  Created by Aleksandra on 4/26/17.
//  Copyright © 2017 Aleksandra. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Event1+CoreDataProperties.h"

@implementation Event1 (CoreDataProperties)

+ (NSFetchRequest<Event1 *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Event1"];
}

@dynamic name;
@dynamic date;

@end
