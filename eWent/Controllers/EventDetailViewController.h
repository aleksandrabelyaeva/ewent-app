//
//  EventDetailViewController.h
//  eWent
//
//  Created by Aleksandra on 4/24/17.
//  Copyright © 2017 Aleksandra. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Event;

@interface EventDetailViewController : UITableViewController

@property (strong, nonatomic) Event *detailItem;


@property (weak, nonatomic) IBOutlet UILabel *eventNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *eventCoverImageView;
@property (weak, nonatomic) IBOutlet UILabel *eventDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *eventPlaceLabel;
@property (weak, nonatomic) IBOutlet UILabel *eventLinkLabel;
@property (weak, nonatomic) IBOutlet UITextView *eventDescriptionTextView;
@end
