//
//  TabBarController.m
//  eWent
//
//  Created by Aleksandra on 5/1/17.
//  Copyright © 2017 Aleksandra. All rights reserved.
//

#import "TabBarController.h"
#import "EventsTableViewController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//
//    if ([[segue identifier] isEqualToString:@"showEvents"]) {
//        
//        
//        EventsTableViewController *controller = (EventsTableViewController *)segue.destinationViewController;
//        
//        //покажи ивент
//    }
//    if ([[segue identifier] isEqualToString:@"showFavorites"]) {
//        // отобрази избранные
//    }
    
}


@end
