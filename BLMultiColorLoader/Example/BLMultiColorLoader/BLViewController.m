//
//  BLViewController.m
//  BLMultiColorLoader
//
//  Created by Babulal Poonia on 03/12/2016.
//  Copyright (c) 2016 Babulal Poonia. All rights reserved.
//

#import "BLViewController.h"
@import BLMultiColorLoader;

@interface BLViewController ()

@end

@implementation BLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    BLMultiColorLoader*_multiColorLoader = [[BLMultiColorLoader alloc] initWithFrame:CGRectMake(50, 50, 50,50)];
    _multiColorLoader.lineWidth = 2.0;
    
    // Pass the custom colors array
    _multiColorLoader.colorArray = [NSArray arrayWithObjects:[UIColor redColor],
                                    [UIColor purpleColor],
                                    [UIColor greenColor],
                                    [UIColor blueColor], nil];
    [_multiColorLoader startAnimation];
    [self.view addSubview:_multiColorLoader];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
