//
//  ViewController.h
//  ChuckNorrisApp
//
//  Created by Catherine Kreamer on 3/5/18.
//  Copyright © 2018 Camden Barkley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpaceCell.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, NSURLSessionDelegate, NSURLSessionDataDelegate>
{
    
}
@property (strong, nonatomic) IBOutlet UITableView *tableObject;

- (IBAction)reloadTableData:(UIButton *)sender;


@end

