//
//  Psample.h
//  New
//
//  Created by uicsi5 on 4/6/13.
//  Copyright (c) 2013 uicsi5. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Common.h"
#import "RecipeParser.h"
#import "Recipe.h"

@interface Psample : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    
    __weak IBOutlet UIView *buttonView;
    __weak IBOutlet UITableView *recipeTableView;
    __weak IBOutlet UIActivityIndicatorView *loadSpinning;
}

@property (strong, nonatomic) NSMutableArray *recipeList;
@property (strong, nonatomic) UIButton *menuBT;

@end
