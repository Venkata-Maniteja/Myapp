//
//  HomeButton.h
//  Myapp
//
//  Created by Venkata Maniteja on 2015-03-04.
//  Copyright (c) 2015 Venkata Maniteja. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeButton : UIButton

@end


@interface UIColor (PaintCodeAdditions)

- (UIColor*)blendedColorWithFraction: (CGFloat)fraction ofColor: (UIColor*)color;

@end