//
//  Event1+CoreDataProperties.h
//  eWent
//
//  Created by Aleksandra on 4/26/17.
//  Copyright © 2017 Aleksandra. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Event1+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Event1 (CoreDataProperties)

+ (NSFetchRequest<Event1 *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSDate *date;

@end

NS_ASSUME_NONNULL_END
