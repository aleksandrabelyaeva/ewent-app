//
//  EventsTableViewCell.m
//  eWent
//
//  Created by Aleksandra on 4/21/17.
//  Copyright © 2017 Aleksandra. All rights reserved.
//

#import "EventsTableViewCell.h"

@interface EventsTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *eventCover;
@property (weak, nonatomic) IBOutlet UILabel *eventNameLabel;

@end

@implementation EventsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) configureCellWithEvent:(Event *)event {
    self.eventNameLabel.text = event.name;
    
    NSData *imageData = [NSData dataWithContentsOfURL:event.coverURL];
    self.eventCover.image = [UIImage imageWithData:imageData];
    //    weakSelf ... scale:1.0];
}

@end
