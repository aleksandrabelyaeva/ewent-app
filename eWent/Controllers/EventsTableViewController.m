//
//  EventsTableViewController.m
//  eWent
//
//  Created by Aleksandra on 4/21/17.
//  Copyright © 2017 Aleksandra. All rights reserved.
//

#import "EventsTableViewController.h"
#import "EventsTableViewCell.h"

#import "Event.h"
#import "EventDataController.h"
#import "EventDetailViewController.h"

@interface EventsTableViewController ()

@property (nonatomic, strong) EventDataController *eventDataController;

@end

@implementation EventsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //loadingData
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wer) name:@"loadingData" object:nil];
    
    self.eventDataController = [[EventDataController alloc] init];
   
    NSLog(@"init data controller");
    if (self.eventDataController.eventList) {
        NSLog(@"init eventlist");
    }

}

//TODO: rename or do smth with it
-(void)wer {
    [self.tableView reloadData];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
//    self.eventDataController = [[EventDataController alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   
    NSLog(@"counting numberOfRows in table");
    return self.eventDataController.eventList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    EventsTableViewCell *cell = (EventsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"eventCell" forIndexPath:indexPath];
    
    Event *event = [self.eventDataController eventAtIndex:indexPath.row];
    
    [cell configureCellWithEvent:event];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([[segue identifier] isEqualToString:@"showEventDetail"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Event *event = [self.eventDataController eventAtIndex:indexPath.row];
        
        EventDetailViewController *controller = (EventDetailViewController *)segue.destinationViewController;
        [controller setDetailItem:event];
    }
}


@end
