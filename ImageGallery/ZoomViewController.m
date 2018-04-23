//
//  ZoomViewController.m
//  ImageGallery
//
//  Created by Brian Vo on 2018-04-23.
//  Copyright © 2018 Brian Vo. All rights reserved.
//

#import "ZoomViewController.h"

@interface ZoomViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic) UIImageView *imageView;

@end

@implementation ZoomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage *image = [UIImage imageNamed:@"Lighthouse-in-Field"];
    self.imageView = [[UIImageView alloc] initWithImage:image];
    
    [self.scrollView addSubview:self.imageView];
    
    
    [self.imageView.leftAnchor constraintEqualToAnchor:self.scrollView.leftAnchor].active = YES;
    [self.imageView.rightAnchor constraintEqualToAnchor:self.scrollView.rightAnchor].active = YES;
    [self.imageView.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active = YES;
    [self.imageView.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active = YES;
    
    self.scrollView.minimumZoomScale = 0.50;
    self.scrollView.maximumZoomScale = 3.0;
    
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
