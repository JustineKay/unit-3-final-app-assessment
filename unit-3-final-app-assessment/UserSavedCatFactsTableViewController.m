//
//  UserSavedCatFactsTableViewController.m
//  unit-3-final-app-assessment
//
//  Created by Justine Gartner on 12/19/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "UserSavedCatFactsTableViewController.h"
#import "UserSavedCatFactTableViewCell.h"

#define SelectedCatFactsKey @"SelectedCatFacts"

@interface UserSavedCatFactsTableViewController ()

@property (nonatomic)NSArray *savedCatFacts;

@end

@implementation UserSavedCatFactsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.savedCatFacts = [[NSUserDefaults standardUserDefaults] objectForKey:SelectedCatFactsKey];
    
    self.navigationItem.leftBarButtonItem.title = @"Done";
    self.navigationItem.title = @"Saved Cat Facts";
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 44;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"UserSavedCatFactTableViewCell" bundle:nil]
         forCellReuseIdentifier:@"SavedCatFactIdentifier"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.savedCatFacts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UserSavedCatFactTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SavedCatFactIdentifier" forIndexPath:indexPath];
    
    cell.savedCatFactLabel.text = self.savedCatFacts[indexPath.row];
    
    return cell;
}

@end
