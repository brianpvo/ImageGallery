//
//  ViewController.m
//  ImageGallery
//
//  Created by Brian Vo on 2018-04-23.
//  Copyright © 2018 Brian Vo. All rights reserved.
//

#import "ViewController.h"
#import "ZoomViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic, readonly) NSArray <UIImage *> *images;
@property (nonatomic) UITapGestureRecognizer *tapGesture;
@property (nonatomic) UIImage *currentImage;

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
        self.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTapped:)];
        [imageView addGestureRecognizer:self.tapGesture];
        imageView.userInteractionEnabled = YES;
    }
//    stackView.arrangedSubviews
    self.scrollView.pagingEnabled = YES;
}

-(void)imageTapped:(UITapGestureRecognizer *)sender {
    NSLog(@"image index %f", self.scrollView.contentOffset.x / self.view.frame.size.width);
    NSInteger index = self.scrollView.contentOffset.x / self.view.frame.size.width;
    
    [self performSegueWithIdentifier:@"detailedSegue" sender:self.images[index]];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ZoomViewController *zoomVC = segue.destinationViewController;
    zoomVC.image = sender;
    
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
