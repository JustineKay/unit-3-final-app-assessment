//
//  ViewController.m
//  unit-3-final-assessment
//
//  Created by Michael Kavouras on 11/30/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "C4QViewController.h"
#import "C4QColorPickerViewController.h"

@interface C4QViewController ()<ColorPickerDelegate>
@property (strong, nonatomic) IBOutlet UIView *backgroundView;

@end

@implementation C4QViewController

-(void)didSelectColor:(UIColor *)selectedColor {
    
    self.backgroundView.backgroundColor = selectedColor;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.destinationViewController isKindOfClass:[C4QColorPickerViewController class]]) {
        
        C4QColorPickerViewController *vc = segue.destinationViewController;
        
        vc.delegate = self;

    }
    
}

@end
