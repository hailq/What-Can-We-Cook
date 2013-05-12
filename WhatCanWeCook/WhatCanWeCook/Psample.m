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

@implementation Psample

@synthesize recipeList = recipeList_;
@synthesize menuBT;

- (void)viewDidLoad
{
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // warning here, but it allows the picture to appear
    
    /* Initialize variables */
    if (recipeList_ == nil) {
        recipeList_ = [[NSMutableArray alloc] init];
    }
    
    /* Sliding Menu */
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
    //End sliding menu
    
    [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(requestDataFromServer) userInfo:nil repeats:NO];
}

- (void)viewWillAppear:(BOOL)animated
{
    // Take top header bar place
    [self.navigationController setNavigationBarHidden:YES];
}

-(void)requestDataFromServer
{
    [self.view setUserInteractionEnabled:NO];
    
    /* Parameters */
//    NSDictionary *params =
    
    NSString *requestString = kBaseUrl;
    NSURL *url = [NSURL URLWithString:requestString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:queue completionHandler:^(NSURLResponse *response,
                            NSData *data,
                            NSError *error){
        if ([data length] > 0 && error == nil) {
            
            NSString *xml = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            
            RecipeParser *parser = [[RecipeParser alloc] init];
            [parser startParser:xml];
        
            if ([[parser recipeArray] count] > 0) {
                [recipeList_ addObjectsFromArray:[parser recipeArray]];
            } else {
                NSLog(@"No recipe");
            }
        }
        else if ([data length] == 0 && error == nil){
            NSLog(@"Nothing was downloaded");
        }
        else if (error != nil)
        {
            NSLog(@"Error happend = %@",error);
        }
        [self finishedLoadingData];
        ;
    }];
}

- (void)finishedLoadingData
{
    [recipeTableView reloadData];
    [recipeTableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    [self.view setUserInteractionEnabled:YES];
    [loadSpinning stopAnimating];
    
}

#pragma mark -
#pragma Button Event Handler

- (IBAction)setChecked:(UIButton *)sender {
    if (!sender.selected) {
        for (UIButton *button in [buttonView subviews]) {
            [button setSelected:NO];
        }
        [sender setSelected:YES];
    } else {
        [sender setSelected:NO];
    }
}

- (IBAction)revealMenu:(id)sender
{
    [self.slidingViewController anchorTopViewTo:ECRight];
}

#pragma mark Table View Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [recipeList_ count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"RecipeCellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [recipeList_[indexPath.row] recipeName];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Rating: %.1f",[recipeList_[indexPath.row] recipeRanking]];
    cell.imageView.image = [UIImage imageWithData:[recipeList_[indexPath.row]recipeImage]];
    return cell;
}

@end
