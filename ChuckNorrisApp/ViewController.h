//
//  ViewController.h
//  ChuckNorrisApp
//
//  Created by Catherine Kreamer on 3/5/18.
//  Copyright © 2018 Camden Barkley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpaceCell.h"
#import "NetworkManager.h"
@class NetworkManager;

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
}
@property (strong, nonatomic) IBOutlet UITableView *table;
@property (strong, nonatomic) NSMutableArray *jokes;
@property (strong, nonatomic) NetworkManager *networkManager;

- (void)jokeReceiver:(NSMutableArray *)jokeArray;

@end

