//
//  ViewController.h
//  ChuckNorrisApp
//
//  Created by Catherine Kreamer on 3/5/18.
//  Copyright © 2018 Camden Barkley. All rights reserved.
//

#import <UIKit/UIKit.h>

//Any class that follows this protocol can be ViewController's delegate
@protocol getStrings <NSObject>
@required

- (void)downloadSomeStrings;
- (void)setHolder:(id)sender;

@end

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
}
@property (strong) id <getStrings>delegate;
@property (strong, nonatomic) IBOutlet UITableView *table;
@property (strong, nonatomic) NSMutableArray *jokes;


@end

