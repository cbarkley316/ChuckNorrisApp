//
//  ViewController.m
//  ChuckNorrisApp
//
//  Created by Catherine Kreamer on 3/5/18.
//  Copyright © 2018 Camden Barkley. All rights reserved.
//

#import "ViewController.h"
#import "SpaceCell.h"
#import "NetworkManager.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize jokes, table, networkManager;


- (void)viewDidLoad {
    [super viewDidLoad];
    networkManager = [[NetworkManager alloc] init];
    [networkManager setHolder:self];
    [networkManager downloadDataFromURL];
    table.rowHeight = UITableViewAutomaticDimension;
    table.estimatedRowHeight = 44.0;
}

- (void)jokeReceiver:(NSMutableArray *)jokeArray{
    SEL reloadSelector = NSSelectorFromString(@"reloadData");
    jokes = jokeArray;
    NSLog(@"Joke receiver: %@", jokes);
    [table performSelectorOnMainThread:reloadSelector
                            withObject:nil
                         waitUntilDone:YES];
}

- (IBAction)moreJokes {
    NSLog(@"More Jokes!");
    [networkManager downloadDataFromURL];
}


#pragma mark - table view stuff

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return jokes.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SpaceCell *cell = [tableView dequeueReusableCellWithIdentifier:@"spaceCell"
                                                      forIndexPath:indexPath];
    [cell updateCellWithJoke:[jokes objectAtIndex:indexPath.row]];
    if( [indexPath row] % 2)
        [cell setBackgroundColor:[UIColor whiteColor]];
    else
        [cell setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:.1]];
    return cell;
}


@end
