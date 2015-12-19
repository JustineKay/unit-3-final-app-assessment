//
//  C4QCatFactDetailViewController.m
//  unit-3-final-app-assessment
//
//  Created by Michael Kavouras on 12/18/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "C4QCatFactsDetailViewController.h"

#define CAT_GIF_URL @"http://api.giphy.com/v1/gifs/search?q=funny+cat&api_key=dc6zaTOxFJmzC"

@interface C4QCatFactsDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *catFactLabel;
@property (weak, nonatomic) IBOutlet UIImageView *giphyImageView;

@property (nonatomic) NSMutableArray *giphyImages;

@end

@implementation C4QCatFactsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.giphyImages = [[NSMutableArray alloc] init];
    
    [self fetchGiphyImages];
    
    self.catFactLabel.text = self.catFact;
    
}

- (void) setBackgroundImage: (NSString *)urlStr {
    
    NSURL *imageURL = [NSURL URLWithString:urlStr];
    
    [self.giphyImageView sd_setImageWithURL:imageURL completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.giphyImageView.image = image;
    }];
}

- (NSString *)randomGiphyImage{
    
    id randomObject = [self.giphyImages objectAtIndex:arc4random()%[self.giphyImages count]];
    
    NSString *randomImage = randomObject;
    
    return randomImage;
}

- (void) fetchGiphyImages {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:CAT_GIF_URL
      parameters:nil
        progress:nil
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             
             NSArray *results = responseObject[@"data"];
             
             for (NSDictionary *result in results) {
                 
                 NSString *imageURLStr = result[@"images"][@"original_still"][@"url"];
                 
                 [self.giphyImages addObject:imageURLStr];
                 
             }
             
             [self setBackgroundImage:[self randomGiphyImage]];
        
         }
     
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             
             NSLog( @"%@", error.userInfo);
        
         }];
}

@end
