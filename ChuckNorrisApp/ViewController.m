//
//  ViewController.m
//  ChuckNorrisApp
//
//  Created by Camden Barkley on 3/5/18.
//  Copyright © 2018 Camden Barkley. All rights reserved.
//

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
    jokes = [[NSMutableArray alloc] initWithObjects:@"Loading Chuck Norris Jokes...", nil];
}

- (void)loadJokes{
    if (delegate == nil){//If the delegate hasn't been assigned create an instance of NetworkManager...
        NetworkManager *nm = [[NetworkManager alloc] init];
        delegate = nm;//...and set it to be VC's delegate
       }
    [delegate setHolder:self];//make sure the delegate holds on to this instance of VC
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
     [cell setBackgroundColor:([indexPath row] % 2) ? [UIColor whiteColor] : [UIColor colorWithRed:0 green:0 blue:0 alpha:.1]];
    return cell;
}


@end
