//
//  EventsTableViewCell.h
//  eWent
//
//  Created by Aleksandra on 4/21/17.
//  Copyright © 2017 Aleksandra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"

@interface EventsTableViewCell : UITableViewCell

- (void) configureCellWithEvent:(Event *)event;

@end
