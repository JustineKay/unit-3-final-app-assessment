//
//  C4QCatFactTableViewCell.m
//  unit-3-final-app-assessment
//
//  Created by Justine Gartner on 12/19/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "C4QCatFactTableViewCell.h"
#import "C4QCatFactsTableViewController.h"

#define SelectedCatFactsKey @"SelectedCatFacts"

@implementation C4QCatFactTableViewCell

- (IBAction)detailButtonTapped:(UIButton *)sender {
    
    NSString *selectedCatFact = self.catFactLabel.text;
    
    if (![[NSUserDefaults standardUserDefaults] objectForKey:SelectedCatFactsKey]) {
        
        NSArray *savedCatFacts = @[selectedCatFact];
        
        [[NSUserDefaults standardUserDefaults] setObject:savedCatFacts forKey:SelectedCatFactsKey];
    }else {
        
        NSArray *previouslySavedCatFacts = [[NSUserDefaults standardUserDefaults] objectForKey:SelectedCatFactsKey];
        
        NSMutableArray *newSavedCatFacts = previouslySavedCatFacts.mutableCopy;
        [newSavedCatFacts addObject:selectedCatFact];
        
        NSArray *savedCatFacts = newSavedCatFacts;
        
        //store the dictionary in NSUserDefaults
        [[NSUserDefaults standardUserDefaults] setObject:savedCatFacts forKey:SelectedCatFactsKey];
        
        [self showAlert];
    }
}

- (void)showAlert {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Saved" message:@"Added that amazing fact to your 'Saved' list!" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    
    [alert addAction:ok];
    
    [self.window.rootViewController presentViewController:alert animated:YES completion:nil];
    
}

@end
