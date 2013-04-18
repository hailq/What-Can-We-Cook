//
//  Psample.h
//  New
//
//  Created by uicsi5 on 4/6/13.
//  Copyright (c) 2013 uicsi5. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Psample : UITableViewController
{

    IBOutlet UIImageView *imageview1;
    IBOutlet UIImageView *imageview2;
    IBOutlet UIImageView *imageview3;

    
    __weak IBOutlet UILabel *label1;
    
    __weak IBOutlet UILabel *label2;
    
    __weak IBOutlet UILabel *label3;

    //__weak IBOutlet UITextView *text1;
}

-(IBAction)show1;
-(IBAction)show2;
-(IBAction)show3;
@end
