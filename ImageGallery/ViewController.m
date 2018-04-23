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
    UIStackView *stackView = [[UIStackView alloc] init];
    [self.scrollView addSubview:stackView];
    
    [stackView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [stackView.leftAnchor constraintEqualToAnchor:self.scrollView.leftAnchor].active = YES;
    [stackView.rightAnchor constraintEqualToAnchor:self.scrollView.rightAnchor].active = YES;
    [stackView.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active = YES;
    [stackView.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active = YES;
    
    [stackView.widthAnchor constraintEqualToAnchor:self.scrollView.widthAnchor multiplier:self.images.count].active = YES;
    [stackView.heightAnchor constraintEqualToAnchor:self.scrollView.heightAnchor multiplier:1.0].active = YES;
    
    stackView.axis = UILayoutConstraintAxisHorizontal;
    stackView.distribution = UIStackViewDistributionFillEqually;
    
    for (UIImage *image in self.images) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        [stackView addArrangedSubview:imageView];
        [imageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    }
    
    self.scrollView.pagingEnabled = YES;
}

-(NSArray <UIImage *> *)images {
    return @[
             [UIImage imageNamed:@"Lighthouse-in-Field"],
             [UIImage imageNamed:@"Lighthouse-night"],
             [UIImage imageNamed:@"Lighthouse-zoomed"]
             ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
