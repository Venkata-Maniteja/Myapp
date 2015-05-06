//
//  HomeButton.m
//  Myapp
//
//  Created by Venkata Maniteja on 2015-03-04.
//  Copyright (c) 2015 Venkata Maniteja. All rights reserved.
//

#import "HomeButton.h"

@implementation HomeButton


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    NSString *button_Label;
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* gradientColor = [UIColor colorWithRed: 0 green: 0.641 blue: 1 alpha: 1];
    UIColor* gradientColor2 = [UIColor colorWithRed: 0.08 green: 0.799 blue: 0.66 alpha: 1];
    
    //// Gradient Declarations
    CGFloat gradientLocations[] = {0, 0.99, 0.99};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)@[(id)gradientColor.CGColor, (id)[gradientColor blendedColorWithFraction: 0.5 ofColor: gradientColor2].CGColor, (id)gradientColor2.CGColor], gradientLocations);
    
    //// Oval Drawing
    CGRect ovalRect = CGRectMake(0, 0, 154, 154);
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: ovalRect];
    CGContextSaveGState(context);
    [ovalPath addClip];
    CGContextDrawLinearGradient(context, gradient, CGPointMake(77, -0), CGPointMake(77, 154), 0);
    CGContextRestoreGState(context);
    UIFont* ovalFont = [UIFont fontWithName: @"Beirut" size: 19];
    [UIColor.blackColor setFill];
    CGFloat ovalTextHeight = [button_Label sizeWithFont: ovalFont constrainedToSize: CGSizeMake(CGRectGetWidth(ovalRect), INFINITY) lineBreakMode: NSLineBreakByWordWrapping].height;
    CGContextSaveGState(context);
    CGContextClipToRect(context, ovalRect);
    [button_Label drawInRect: CGRectMake(CGRectGetMinX(ovalRect), CGRectGetMinY(ovalRect) + (CGRectGetHeight(ovalRect) - ovalTextHeight) / 2, CGRectGetWidth(ovalRect), ovalTextHeight) withFont: ovalFont lineBreakMode: NSLineBreakByWordWrapping alignment: NSTextAlignmentCenter];
    
   
       
    CGContextRestoreGState(context);
    
    
    //// Cleanup
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    
}


@end


@implementation UIColor (PaintCodeAdditions)


- (UIColor*)blendedColorWithFraction: (CGFloat)fraction ofColor: (UIColor*)color2
{
    UIColor* color1 = self;
    
    CGFloat r1 = 0, g1 = 0, b1 = 0, a1 = 0;
    CGFloat r2 = 0, g2 = 0, b2 = 0, a2 = 0;
    
    
    [color1 getRed: &r1 green: &g1 blue: &b1 alpha: &a1];
    [color2 getRed: &r2 green: &g2 blue: &b2 alpha: &a2];
    
    CGFloat r = r1 * (1 - fraction) + r2 * fraction;
    CGFloat g = g1 * (1 - fraction) + g2 * fraction;
    CGFloat b = b1 * (1 - fraction) + b2 * fraction;
    CGFloat a = a1 * (1 - fraction) + a2 * fraction;
    
    return [UIColor colorWithRed: r green: g blue: b alpha: a];
}

@end