//
//  ViewController.m
//  Demo
//
//  Created by Poonia on 12/09/15.
//  Copyright (c) 2015 Babulal Poonia. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _multiColorLoader.lineWidth = 2.0;
    _multiColorLoader.colorArray = [NSArray arrayWithObjects:[UIColor redColor],
                                    [UIColor purpleColor],
                                    [UIColor greenColor],
                                    [UIColor blueColor], nil];
    [_multiColorLoader startAnimation];
    
}

@end
