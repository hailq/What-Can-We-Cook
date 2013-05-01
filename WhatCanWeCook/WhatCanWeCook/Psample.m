//
//  Psample.m
//  New
//
//  Created by uicsi5 on 4/6/13.
//  Copyright (c) 2013 uicsi5. All rights reserved.
//modified this file

#import "Psample.h"
#import "Precipe.h"
#import "ECSlidingViewController.h"
#import "MenuViewController.h"

@implementation Psample {
    NSMutableArray *filterArray;
    NSArray *ingredients;
    NSArray *country;
    NSArray *category;
}

NSString *s1;
UIImage *img1, *img2, *img3;

@synthesize menuBT;

- (void)viewDidLoad
{
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // warning here, but it allows the picture to appear
    self.show1;
    
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

-(IBAction)show1 {
    img1 = [UIImage imageNamed:@"omlette.jpg"];
    [imageview1 setImage:img1];
    
    
    
    img2 = [UIImage imageNamed:@"Giant_Burger_frei.jpg"];
    [imageview2 setImage:img2];
    
    img3 = [UIImage imageNamed:@"sbcrepe.jpg"];
    [imageview3 setImage:img3];
    
    label1.text = @"Omlette";
    
    label2.text = @"Burger";
    
    label3.text = @"Stawberry Crepe";
    
}

-(IBAction)show2 {
    
    img1 = [UIImage imageNamed:@"Giant_Burger_frei.jpg"];
    [imageview1 setImage:img1];
    
    img2 = [UIImage imageNamed:@"sbcrepe.jpg"];
    [imageview2 setImage:img2];
    
    img3 = [UIImage imageNamed:@"omlette.jpg"];
    [imageview3 setImage:img3];
    
    
    
    label3.text = @"Omlette";
    
    label2.text = @"Stawberry Crepe";
    
    label1.text = @"Burger";
    
}
-(IBAction)show3 {
    
    img1 = [UIImage imageNamed:@"sbcrepe.jpg"];
    [imageview1 setImage:img1];
    
    img2 = [UIImage imageNamed:@"omlette.jpg"];
    [imageview2 setImage:img2];
    
    img3 = [UIImage imageNamed:@"Giant_Burger_frei.jpg"];
    [imageview3 setImage:img3];
    
    label2.text = @"Omlette";
    
    label1.text = @"Stawberry Crepe";
    
    label3.text = @"Burger";
}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"push1"]){
        
        
        
        Precipe *p1 = [segue destinationViewController];
        
        p1.img = img1;
        
        s1 = label1.text;
        p1.introString = s1;
    } else if([segue.identifier isEqualToString:@"push2"]){
        
        Precipe *p1 = [segue destinationViewController];
        
        p1.img = img2;
        s1 = label2.text;
        p1.introString = s1;
        
        
    } else if([segue.identifier isEqualToString:@"push3"]){
        
        Precipe *p1 = [segue destinationViewController];
        
        p1.img = img3;
        s1 = label3.text;
        p1.introString = s1;
        
        
    }
    
}

@end
