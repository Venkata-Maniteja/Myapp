//
//  buttonLabel.m
//  Myapp
//
//  Created by Venkata Maniteja on 2015-02-21.
//  Copyright (c) 2015 Venkata Maniteja. All rights reserved.
//

#import "buttonLabel.h"

@implementation buttonLabel


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)frame {
    // Drawing code
    
    CGContextRef context = UIGraphicsGetCurrentContext();

    //// Color Declarations
    
    //// Color Declarations
    UIColor* color = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
   

    //// Rectangle Drawing
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame), 82, 36) cornerRadius: 11];
    [color setFill];
    [rectanglePath fill];
    [UIColor.darkGrayColor setStroke];
    rectanglePath.lineWidth = 1;
    [rectanglePath stroke];
    
    
    //// Oval Drawing
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(frame) + 67, CGRectGetMinY(frame) + 3, 11, 11)];
    [UIColor.redColor setFill];
    [ovalPath fill];
    
    //// Bezier Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, CGRectGetMinX(frame) + 71.5, CGRectGetMinY(frame) + 8.5);
    
    UIBezierPath* bezierPath = UIBezierPath.bezierPath;
    [bezierPath moveToPoint: CGPointMake(-4, 0)];
    [bezierPath addCurveToPoint: CGPointMake(5, 0) controlPoint1: CGPointMake(5, 0) controlPoint2: CGPointMake(5, 0)];
    [UIColor.whiteColor setStroke];
    bezierPath.lineWidth = 1;
    [bezierPath stroke];
    
    CGContextRestoreGState(context);
    
    [super drawRect:frame];

}


@end
