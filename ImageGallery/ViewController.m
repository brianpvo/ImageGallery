//
//  ViewController.m
//  ImageGallery
//
//  Created by Brian Vo on 2018-04-23.
//  Copyright © 2018 Brian Vo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic, readonly) NSArray <UIImage *> *images;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImageView *firstImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-in-Field"]];
    [self.scrollView addSubview:firstImageView];
    UIImageView *secondImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-night"]];
    [self.scrollView addSubview:secondImageView];
    UIImageView *thirdImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-zoomed"]];
    [self.scrollView addSubview:thirdImageView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
