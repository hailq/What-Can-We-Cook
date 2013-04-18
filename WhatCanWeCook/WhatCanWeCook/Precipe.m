//
//  Precipe.m
//  New
//
//  Created by uicsi5 on 4/9/13.
//  Copyright (c) 2013 uicsi5. All rights reserved.
//

#import "Precipe.h"

@implementation Precipe

@synthesize img, imageview, label, introString;

- (void)viewDidLoad
{
    [label setText:introString];
    [imageview setImage:img];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor blackColor];
}

@end
