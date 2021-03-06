//
//  ViewController.m
//  DYSlideView
//
//  Created by Dwarven on 16/4/18.
//  Copyright © 2016年 Dwarven. All rights reserved.
//

#import "ViewController.h"
#import "DYSlideView.h"

@interface ViewController () <DYSlideViewDelegate>
{
    DYSlideView *slideView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    slideView = [[DYSlideView alloc] init];
    [slideView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
    [slideView setFrame:self.view.bounds];
    
    slideView.separatorColor = [UIColor yellowColor];
    slideView.slideBarColor = [UIColor lightGrayColor];
    slideView.slideBarHeight = 50;
    
    slideView.sliderColor = [UIColor redColor];
    slideView.sliderHeight = 2;
//    slideView.sliderScale = 0.6;
    
    slideView.scrollViewBounces = YES;
    
    slideView.indexForDefaultItem = @0;
    
    slideView.delegate = self;
    [self.view addSubview:slideView];
}

- (NSInteger)DY_numberOfViewControllersInSlideView {
    return 4;
}

- (NSAttributedString *)DY_attributedtitleForViewControllerAtIndex:(NSInteger)index
{
    return [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"Tab%li",index] attributes:nil];
}

- (UIViewController *)DY_viewControllerAtIndex:(NSInteger)index {
    switch (index) {
        case 0:
        {
            UIViewController *newctl = [self vcWithBackgroundColor:[UIColor whiteColor]];
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setBackgroundColor:[UIColor blueColor]];
            [btn setTitle:@"Go 2" forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(didClickButtonGo2:) forControlEvents:UIControlEventTouchUpInside];
            [btn setFrame:CGRectMake(50, 50, 150, 50)];
            [newctl.view addSubview:btn];
            return newctl;
        }
        case 1:
            return [self vcWithBackgroundColor:[UIColor grayColor]];
            break;
            
        case 2:
            return [self vcWithBackgroundColor:[UIColor darkGrayColor]];
            break;
            
        default:
            return [self vcWithBackgroundColor:[UIColor blackColor]];
            break;
    }
}

- (UIViewController *)vcWithBackgroundColor:(UIColor *)backgroundColor {
    UIViewController * vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = backgroundColor;
    return vc;
}

- (void)DY_didSelectButtonAtIndex:(NSInteger)index {
    NSLog(@"%s %li",__FUNCTION__ ,index);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)didClickButtonGo2:(id)sender
{
    [slideView selectButtonWithIndex:1 withAnimation:YES];
}
@end
