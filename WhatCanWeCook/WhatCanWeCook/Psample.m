//
//  Psample.m
//  New
//
//  Created by uicsi5 on 4/6/13.
//  Copyright (c) 2013 uicsi5. All rights reserved.
//

#import "Psample.h"
#import "Precipe.h"
@implementation Psample

NSString *s1;
UIImage *img1, *img2, *img3;


- (void)viewDidLoad
{

    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor blackColor];
    self.show1;
    
}

-(IBAction)show1 {
    img1 = [UIImage imageNamed:@"omlette.jpg"];
    [imageview1 setImage:img1];
    
    
    
    img2 = [UIImage imageNamed:@"Giant_Burger_frei.jpg"];
    [imageview2 setImage:img2];
    
    img3 = [UIImage imageNamed:@"sbcrepe.jpg"];
    [imageview3 setImage:img3];
    
    label1.text = @"2 Egg, 2 Tbsp. whole milk, 2 Tbsp clarified butter, Salt and white paper ";
    
    label2.text = @"1 1/2 pounds ground chuck Kosher salt and black pepper, 1 1/2 tablespoons canola oil, 4 slices cheese, 4 hamburger burns, split";
    
    label3.text = @"1 egg, beaten, 1/4 cup skim milk, 1/3 cup water, 1/2 cup semisweet chocolate......   ";
    
}

-(IBAction)show2 {
    
    img1 = [UIImage imageNamed:@"Giant_Burger_frei.jpg"];
    [imageview1 setImage:img1];
    
    img2 = [UIImage imageNamed:@"sbcrepe.jpg"];
    [imageview2 setImage:img2];
    
    img3 = [UIImage imageNamed:@"omlette.jpg"];
    [imageview3 setImage:img3];
    
    
    
    label3.text = @"2 Egg                                      2 Tbsp. whole milk                  2 Tbsp clarified butter           Salt and white paper ";
    
    label2.text = @"1 egg, beaten                         1/4 cup skim milk                  1/3 cup water                        1/2 cup semisweet chocolate......   ";
    
    label1.text = @"1 1/2 pounds ground chuck Kosher salt and black pepper 1 1/2 tablespoons canola oil    4 slices cheese                        4 hamburger burns, split";
    
}
-(IBAction)show3 {
    
    img1 = [UIImage imageNamed:@"sbcrepe.jpg"];
    [imageview1 setImage:img1];
    
    img2 = [UIImage imageNamed:@"omlette.jpg"];
    [imageview2 setImage:img2];
    
    img3 = [UIImage imageNamed:@"Giant_Burger_frei.jpg"];
    [imageview3 setImage:img3];
    
    label2.text = @"2 Egg                                      2 Tbsp. whole milk                  2 Tbsp clarified butter           Salt and white paper ";
    
    label1.text = @"1 egg, beaten                         1/4 cup skim milk                  1/3 cup water                        1/2 cup semisweet chocolate......   ";
    
    label3.text = @"1 1/2 pounds ground chuck Kosher salt and black pepper 1 1/2 tablespoons canola oil    4 slices cheese                        4 hamburger burns, split";
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
