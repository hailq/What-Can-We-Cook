//
//  Precipe.m
//  New
//
//  Created by uicsi5 on 4/9/13.
//  Copyright (c) 2013 uicsi5. All rights reserved.
//

#import "Precipe.h"
#import "ECSlidingViewController.h"
#import "MenuViewController.h"

@implementation Precipe

@synthesize img, imageview, label, introString, menuBT;

- (void)viewDidLoad
{
    [label setText:introString];
    [imageview setImage:img];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.view.layer.shadowOpacity = 0.75f;
    self.view.layer.shadowRadius = 10.0f;
    self.view.layer.shadowColor = [UIColor blackColor].CGColor;
    
    if(![self.slidingViewController.underLeftViewController isKindOfClass:[MenuViewController class]]){
        self.slidingViewController.underLeftViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
    }
    
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
    
    self.menuBT = [UIButton buttonWithType:UIButtonTypeCustom];
    menuBT.frame = CGRectMake(8, 10, 34, 24);
    [menuBT setBackgroundImage:[UIImage imageNamed:@"menuButton.png"] forState:UIControlStateNormal];
    [menuBT addTarget:self action:@selector(revealMenu:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:self.menuBT];
    
}

- (IBAction)revealMenu:(id)sender
{
    [self.slidingViewController anchorTopViewTo:ECRight];
}

@end
