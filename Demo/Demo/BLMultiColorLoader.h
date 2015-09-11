//
//  BLMultiColorLoader.h
//  Demo
//
//  Created by Poonia on 12/09/15.
//  Copyright (c) 2015 Babulal Poonia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BLMultiColorLoader : UIView

/**
 * Array of UIColor
 */
@property (nonatomic, strong) NSArray *colorArray;

/**
 * lineWidth of the stroke
 */
@property (nonatomic) CGFloat lineWidth;

- (void)startAnimation;
- (void)stopAnimation;
- (BOOL)isAnimating;

@end
