//
//  C4QCatsTableViewController.m
//  unit-3-final-assessment
//
//  Created by Michael Kavouras on 12/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "C4QCatFactsTableViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "C4QCatFactTableViewCell.h"
#import "C4QCatFactsDetailViewController.h"

#define CAT_API_URL @"http://catfacts-api.appspot.com/api/facts?number=100"

@interface C4QCatFactsTableViewController ()

@property (nonatomic) NSArray *catFacts;

@end

@implementation C4QCatFactsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.catFacts = [[NSArray alloc] init];
    
    [self fetchCatFacts];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 44;
    
    //grab the nib from the main bundle
    //register the nib for the cell identifier
    [self.tableView registerNib:[UINib nibWithNibName:@"C4QCatFactTableViewCell" bundle:nil]
         forCellReuseIdentifier:@"CatFactIdentifier"];
    
}

- (void) fetchCatFacts {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:CAT_API_URL
      parameters:nil
        progress:nil
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             
             NSDictionary *results = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
             self.catFacts = results[@"facts"];
             
             [self.tableView reloadData];
             
         }
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             
             NSLog( @"%@", error.userInfo);
             
         }];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.catFacts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    C4QCatFactTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"CatFactIdentifier" forIndexPath:indexPath];

    cell.catFactLabel.text = self.catFacts[indexPath.row];
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    
    if ([segue.identifier isEqualToString:@"C4QCatFactsDetailViewController"]) {
        
        C4QCatFactsDetailViewController *detailVC = segue.destinationViewController;
        
        detailVC.catFact = self.catFacts[indexPath.row];
    }
    
    
    
    
    
    
    
    
}


@end
