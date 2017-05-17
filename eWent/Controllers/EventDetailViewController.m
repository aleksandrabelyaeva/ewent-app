//
//  EventDetailViewController.m
//  eWent
//
//  Created by Aleksandra on 4/24/17.
//  Copyright © 2017 Aleksandra. All rights reserved.
//

#import "EventDetailViewController.h"
#import "Event.h"

@interface EventDetailViewController ()

@end

@implementation EventDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Managing the detail item

- (void)setDetailItem:(Event *)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
    }
}

- (void)configureView {
    
    if (self.detailItem) {
        
        self.eventNameLabel.text = self.detailItem.name;
        self.eventDateLabel.text = self.detailItem.date;
        self.eventPlaceLabel.text = self.detailItem.place;
        self.eventLinkLabel.text = self.detailItem.link;
        self.eventDescriptionTextView.text = self.detailItem.summary;
        
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.detailItem.coverURL]];
        self.eventCoverImageView.image = [UIImage imageWithData:imageData];
        
//        self.eventNameLabel.text = @"name";
//        self.eventDateLabel.text = @"date";
//        self.eventPlaceLabel.text = @"place";
//        self.eventLinkLabel.text = @"link";
//        self.eventDescriptionTextView.text = @"summary";
        
        
    }
}


@end
