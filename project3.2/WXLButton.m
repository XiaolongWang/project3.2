//
//  WXLButton.m
//  project3.2
//
//  Created by wxl on 13-11-20.
//  Copyright (c) 2013年 wxl. All rights reserved.
//

#import "WXLButton.h"
#define FIXED 4
#define THICKNESS 1

@interface WXLButton()
{
    CAShapeLayer *arcLayer;
}

@end

@implementation WXLButton
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)intiUIOfViewWithColor:(UIColor *)color duration:(float)duration
{
    CGRect rect = self.bounds;
    rect.origin.x = rect.origin.x+1.5;
    rect.origin.y = rect.origin.y+1.5;
    rect.size.width = rect.size.width-3;
    rect.size.height = rect.size.height-3;
    
    UIBezierPath *path=[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:8];
    arcLayer=[CAShapeLayer layer];
    arcLayer.path=path.CGPath;
    arcLayer.fillColor=[UIColor colorWithWhite:1 alpha:0.0].CGColor;
    arcLayer.strokeColor=color.CGColor;
    arcLayer.lineWidth=3;
    arcLayer.frame=self.bounds;
    [self.layer addSublayer:arcLayer];
    [self drawLineAnimation:arcLayer duration:duration];
    
    
}

-(void)drawLineAnimation:(CALayer*)layer duration:(float)duration
{
    CABasicAnimation *bas=[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    bas.duration=duration;
    bas.delegate=self;
    bas.fromValue=[NSNumber numberWithInteger:0];
    bas.toValue=[NSNumber numberWithInteger:1];
    [layer addAnimation:bas forKey:@"key"];
}

-(void)clean
{
    [arcLayer removeFromSuperlayer];
}

@end
