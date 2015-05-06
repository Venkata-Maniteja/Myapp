//
//  MainCellBackground.m
//  Myapp
//
//  Created by Venkata Maniteja on 2015-04-10.
//  Copyright (c) 2015 Venkata Maniteja. All rights reserved.
//

#import "MainCellBackground.h"

@implementation MainCellBackground


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* color = [UIColor colorWithRed: 0.858 green: 0.995 blue: 0.814 alpha: 1];
    
    //// Shadow Declarations
    UIColor* shadow2 = UIColor.blackColor;
    CGSize shadow2Offset = CGSizeMake(0.1, -0.1);
    CGFloat shadow2BlurRadius = 5;
    UIColor* shadow3 = UIColor.blackColor;
    CGSize shadow3Offset = CGSizeMake(0.1, -0.1);
    CGFloat shadow3BlurRadius = 5;
    
    //// Rectangle Drawing
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(rect), CGRectGetMinY(rect), 288, 57)];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadow2Offset, shadow2BlurRadius, [shadow2 CGColor]);
    [color setFill];
    [rectanglePath fill];
    
    ////// Rectangle Inner Shadow
    CGContextSaveGState(context);
    UIRectClip(rectanglePath.bounds);
    CGContextSetShadowWithColor(context, CGSizeZero, 0, NULL);
    
    CGContextSetAlpha(context, CGColorGetAlpha([shadow3 CGColor]));
    CGContextBeginTransparencyLayer(context, NULL);
    {
        UIColor* opaqueShadow = [shadow3 colorWithAlphaComponent: 1];
        CGContextSetShadowWithColor(context, shadow3Offset, shadow3BlurRadius, [opaqueShadow CGColor]);
        CGContextSetBlendMode(context, kCGBlendModeSourceOut);
        CGContextBeginTransparencyLayer(context, NULL);
        
        [opaqueShadow setFill];
        [rectanglePath fill];
        
        CGContextEndTransparencyLayer(context);
    }
    CGContextEndTransparencyLayer(context);
    CGContextRestoreGState(context);
    
    CGContextRestoreGState(context);
}


@end
