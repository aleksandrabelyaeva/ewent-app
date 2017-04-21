//
//  AppDelegate.h
//  eWent
//
//  Created by Aleksandra on 4/21/17.
//  Copyright © 2017 Aleksandra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

