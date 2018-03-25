//
//  ViewController.m
//  ChuckNorrisApp
//
//  Created by Catherine Kreamer on 3/5/18.
//  Copyright © 2018 Camden Barkley. All rights reserved.
//


/////TO DO: clean up code. Upload to github.
#import "ViewController.h"
#import "SpaceCell.h"
#import "NetworkManager.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize jokes, table, testArray;


- (void)viewDidLoad {
    [super viewDidLoad];
    NetworkManager *networkManager = [[NetworkManager alloc] init];
    [networkManager setHolder:self];
    [networkManager downloadDataFromURL];
//    testArray = [[NSMutableArray alloc] initWithObjects:@"Hi", @"Hello", @"Greetings", nil];
//    [self jokeReceiver:testArray];

}

- (void)jokeReceiver:(NSMutableArray *)jokeArray{
    SEL reloadSelector = NSSelectorFromString(@"reloadData");
    jokes = jokeArray;
    NSLog(@"Joke receiver: %@", jokes);
    [table performSelectorOnMainThread:reloadSelector
                            withObject:nil
                         waitUntilDone:YES];
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
  
    return cell;
}

@end
