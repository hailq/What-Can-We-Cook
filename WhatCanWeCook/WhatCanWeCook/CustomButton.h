//
//  CustomButton.h
//  WebView
//
//  Created by uics2 on 4/17/13.
//  Copyright (c) 2013 Jathan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomButton : UIButton

@property (nonatomic, strong, readonly) UIColor *normalColor;
@property (nonatomic, strong, readonly) UIColor *highlightedColor;

- (void)setNormalColor:(UIColor *)normalColor;
- (void)setHighlightedColor:(UIColor *)highlightedColor;

@end
