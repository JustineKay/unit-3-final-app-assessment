//
//  C4QCatFactTableViewCell.m
//  unit-3-final-app-assessment
//
//  Created by Justine Gartner on 12/19/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "C4QCatFactTableViewCell.h"

#define SelectedCatFactsKey @"SelectedCatFacts"

@implementation C4QCatFactTableViewCell

- (IBAction)detailButtonTapped:(UIButton *)sender {
    
    //Create an array
    //add selected text to the array
    //add array to dictionary
    //save in NSUserDefaults
    
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
    }
}

@end
