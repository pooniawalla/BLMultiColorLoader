//
//  BLMultiColorLoader.m
//  Demo
//
//  Created by Poonia on 12/09/15.
//  Copyright (c) 2015 Babulal Poonia. All rights reserved.
//

#import "BLMultiColorLoader.h"

#define ROUND_TIME 1.5
#define DEFAULT_LINE_WIDTH 2.0
#define DEFAULT_COLOR [UIColor orangeColor]

@interface BLMultiColorLoader ()

@property (nonatomic, strong) CAShapeLayer *circleLayer;
@property (nonatomic, strong) CAAnimationGroup *strokeLineAnimation;
@property (nonatomic, strong) CAAnimation *rotationAnimation;
@property (nonatomic, strong) CAAnimation *strokeColorAnimation;
@property (nonatomic) BOOL animating;

@end

@implementation BLMultiColorLoader

#pragma mark - Life Cycle
- (instancetype)init {
    self = [super init];
    if(self) {
        [self initialSetup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        [self initialSetup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if(self) {
        [self initialSetup];
    }
    return self;
}

#pragma mark - Initial Setup

- (void)initialSetup {
    self.circleLayer = [CAShapeLayer layer];
    [self.layer addSublayer:self.circleLayer];
    
    self.backgroundColor = [UIColor clearColor];
    self.circleLayer.fillColor = nil;
    self.circleLayer.lineWidth = DEFAULT_LINE_WIDTH;
    self.circleLayer.lineCap = kCALineCapRound;
    
    _colorArray = @[DEFAULT_COLOR];
    
    [self updateAnimations];
}

#pragma mark - Layout
- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGPoint center = CGPointMake(self.bounds.size.width / 2.0, self.bounds.size.height / 2.0);
    CGFloat radius = MIN(self.bounds.size.width, self.bounds.size.height)/2.0 - self.circleLayer.lineWidth / 2.0;
    CGFloat startAngle = 0;
    CGFloat endAngle = 2*M_PI;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center
                                                        radius:radius
                                                    startAngle:startAngle
                                                      endAngle:endAngle
                                                     clockwise:YES];
    self.circleLayer.path = path.CGPath;
    self.circleLayer.frame = self.bounds;
}

#pragma mark -

- (void)setColorArray:(NSArray *)colorArray{
    if(colorArray.count>0){
        _colorArray = colorArray;
    }
    [self updateAnimations];
}

- (void)setLineWidth:(CGFloat)lineWidth {
    _lineWidth = lineWidth;
    self.circleLayer.lineWidth = _lineWidth;
}

#pragma mark -

- (void)startAnimation {
    _animating = YES;
    [self.circleLayer addAnimation:self.strokeLineAnimation forKey:@"strokeLineAnimation"];
    [self.circleLayer addAnimation:self.rotationAnimation forKey:@"rotationAnimation"];
    [self.circleLayer addAnimation:self.strokeColorAnimation forKey:@"strokeColorAnimation"];
}

- (void)stopAnimation {
    _animating = NO;
    [self.circleLayer removeAnimationForKey:@"strokeLineAnimation"];
    [self.circleLayer removeAnimationForKey:@"rotationAnimation"];
    [self.circleLayer removeAnimationForKey:@"strokeColorAnimation"];
}

- (void)stopAnimationAfter:(NSTimeInterval)timeInterval
{
    [self performSelector:@selector(stopAnimation) withObject:nil afterDelay:timeInterval];
}

- (BOOL)isAnimating {
    return _animating;
}

#pragma mark -

- (void)updateAnimations {
    // Stroke Head
    CABasicAnimation *headAnimation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    headAnimation.beginTime = ROUND_TIME/3.0;
    headAnimation.fromValue = @0;
    headAnimation.toValue = @1;
    headAnimation.duration = 2*ROUND_TIME/3.0;
    headAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    // Stroke Tail
    CABasicAnimation *tailAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    tailAnimation.fromValue = @0;
    tailAnimation.toValue = @1;
    tailAnimation.duration = 2*ROUND_TIME/3.0;
    tailAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    // Stroke Line Group
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.duration = ROUND_TIME;
    animationGroup.repeatCount = INFINITY;
    animationGroup.animations = @[headAnimation, tailAnimation];
    self.strokeLineAnimation = animationGroup;
    
    // Rotation
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotationAnimation.fromValue = @0;
    rotationAnimation.toValue = @(2*M_PI);
    rotationAnimation.duration = ROUND_TIME;
    rotationAnimation.repeatCount = INFINITY;
    self.rotationAnimation = rotationAnimation;
    
    CAKeyframeAnimation *strokeColorAnimation = [CAKeyframeAnimation animationWithKeyPath:@"strokeColor"];
    strokeColorAnimation.values = [self prepareColorValues];
    strokeColorAnimation.keyTimes = [self prepareKeyTimes];
    strokeColorAnimation.calculationMode = kCAAnimationDiscrete;
    strokeColorAnimation.duration = self.colorArray.count * ROUND_TIME;
    strokeColorAnimation.repeatCount = INFINITY;
    self.strokeColorAnimation = strokeColorAnimation;
}

#pragma mark - Animation Data Preparation

- (NSArray*)prepareColorValues {
    NSMutableArray *cgColorArray = [[NSMutableArray alloc] init];
    for(UIColor *color in self.colorArray){
        [cgColorArray addObject:(id)color.CGColor];
    }
    return cgColorArray;
}

- (NSArray*)prepareKeyTimes {
    NSMutableArray *keyTimesArray = [[NSMutableArray alloc] init];
    for(NSUInteger i=0; i<self.colorArray.count+1; i++){
        [keyTimesArray addObject:[NSNumber numberWithFloat:i*1.0/self.colorArray.count]];
    }
    return keyTimesArray;
}

#pragma mark - Dealloc

- (void)dealloc {
    [self stopAnimation];
    [self.circleLayer removeFromSuperlayer];
    self.circleLayer = nil;
    self.strokeLineAnimation = nil;
    self.rotationAnimation = nil;
    self.strokeColorAnimation = nil;
    self.colorArray = nil;
}

@end
