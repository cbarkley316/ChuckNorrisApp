//
//  ViewController.m
//  ChuckNorrisApp
//
//  Created by Catherine Kreamer on 3/5/18.
//  Copyright © 2018 Camden Barkley. All rights reserved.
//


////PLAN TO USE PROTOCOLS & DELEGATES
/*
 1) ViewController will define a protocol named "getStrings"
 2) VC will declare that "any object that adheres to the 'getString' protocol can be assigned as VC's delegate.
 3) NetoworkManager will adhere to the "getStrings" protocol
 4) ViewController will define NM as its delegate.
 5) VC tells its delegate, (NM), to perform the 'giveMeStrings' method and give me what it returns.
 6) NM performs the 'giveMeStrings' method which returns an array of strings.
 7) VC uses the strings in the way it is already.
 
 */
/////END PLAN
#import "ViewController.h"
#import "SpaceCell.h"
#import "NetworkManager.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize delegate, jokes, table;


- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadJokes];
}

- (void)loadJokes{
    NetworkManager *nm = [[NetworkManager alloc] init]; //create an instance of NetworkManager
    delegate = nm;//set it to be VC's delegate
    [delegate setHolder:self];//make sure the delegate holds on to this instanct of VC
    [delegate downloadSomeStrings];
}

//button for more jokes
- (IBAction)moreJokes {
    NSLog(@"More Jokes!");
    [self loadJokes];
}


#pragma mark - table view stuff

//tells the tableview how many rows to have
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return jokes.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //set up auto-sizing cells based on content
    table.rowHeight = UITableViewAutomaticDimension;
    table.estimatedRowHeight = 44.0;
    //for each row create a SpaceCell
    SpaceCell *cell = [tableView dequeueReusableCellWithIdentifier:@"spaceCell"
                                                      forIndexPath:indexPath];
    [cell updateCellWithJoke:[jokes objectAtIndex:indexPath.row]];
    //Color the rows
    if( [indexPath row] % 2)
        [cell setBackgroundColor:[UIColor whiteColor]];
    else
        [cell setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:.1]];
    return cell;
}


@end
