//
//  FiltersViewController.m
//  eWent
//
//  Created by Bodya on 05.05.17.
//  Copyright © 2017 Aleksandra. All rights reserved.
//

#import "FiltersViewController.h"

@interface FiltersViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSMutableArray *filters;
@end

@implementation FiltersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];

    self.tabBarController.tabBar.hidden = YES;
    // Do any additional setup after loading the view.
}

- (void)setupView {
    self.filters = [[[NSUserDefaults standardUserDefaults] objectForKey:@"filters"]mutableCopy];
    
    if (!self.filters) {
        NSNumber *isSelected = [[NSNumber alloc] initWithBool:NO];
        
    self.filters = [[NSMutableArray alloc]initWithArray:@[@{@"category":@"BUSINESS",@"isSelected":isSelected},
                                                        @{@"category":@"DESIGN & ART",@"isSelected":isSelected},
                                                        @{@"category":@"ENGLISH",@"isSelected":isSelected},
                                                        @{@"category":@"IT",@"isSelected":isSelected},
                                                        @{@"category":@"OTHER",@"isSelected":isSelected},
                                                        @{@"category":@"SCIENCE",@"isSelected":isSelected}]];
    }
//    self.filters = [[NSMutableArray alloc]initWithArray:@[@{@"BUSINESS":isSelected},
//                                                          @{@"DESIGN & ART":isSelected},
//                                                          @{@"ENGLISH":isSelected},
//                                                          @{@"IT":isSelected},
//                                                          @{@"OTHER":isSelected},
//                                                          @{@"SCIENCE":isSelected}]];
//                                                                  }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (cell.accessoryType == UITableViewCellAccessoryNone) {
        
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        NSNumber *isSelected = [[NSNumber alloc] initWithBool:YES];
        
        NSMutableDictionary *filter = [[self.filters objectAtIndex:indexPath.row]mutableCopy];
        
        [filter setValue:isSelected forKey:@"isSelected"];
        [self.filters replaceObjectAtIndex:indexPath.row withObject:filter];
    } else {
        
        cell.accessoryType = UITableViewCellAccessoryNone;
        NSNumber *isSelected = [[NSNumber alloc] initWithBool:NO];
        
        NSMutableDictionary *filter = [[self.filters objectAtIndex:indexPath.row]mutableCopy];
        [filter setValue:isSelected forKey:@"isSelected"];
        [self.filters replaceObjectAtIndex:indexPath.row withObject:[filter copy]];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.filters.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"filtersCell" forIndexPath:indexPath];

    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"filtersCell"];
    }
    NSDictionary *filter = [self.filters objectAtIndex:indexPath.row];
    NSString *text = [filter objectForKey:@"category"];
    cell.textLabel.text = text;
    
    if ([[filter objectForKey:@"isSelected"]boolValue] == NO) {
        cell.accessoryType = UITableViewCellAccessoryNone;
    } else {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    return cell;
    return nil;
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[NSUserDefaults standardUserDefaults] setObject:[self.filters copy] forKey:@"filters"];
    
    self.tabBarController.tabBar.hidden = NO;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
