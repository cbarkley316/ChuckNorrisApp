//
//  ViewController.m
//  ChuckNorrisApp
//
//  Created by Catherine Kreamer on 3/5/18.
//  Copyright © 2018 Camden Barkley. All rights reserved.
//


#import "ViewController.h"
#define JSON_FILE_URL @"http://api.icndb.com/jokes/random/3"

@interface ViewController ()

@property (strong, nonatomic) NSArray *jokes;
@property (strong, nonatomic) NSDictionary *data;



@end

@implementation ViewController

@synthesize jokes, data;


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"JSONRead";
    
    
    // Download JSON
    NSData *JSONData = [NSData dataWithContentsOfURL:[NSURL URLWithString:JSON_FILE_URL]];
    // Parse JSON
    NSDictionary *jsonResult = [NSJSONSerialization JSONObjectWithData:JSONData
                                                               options:kNilOptions
                                                                 error:nil];
    self.data = jsonResult;
    
    //Get jsonResults.value
    NSDictionary *jValue = jsonResult[@"value"];
    //Print just the "value" key
    NSLog(@"%@", jValue);
    
    NSMutableArray *_jokes = [NSMutableArray array];
    for (id item in jValue)[
                            _jokes addObject:[NSMutableString stringWithFormat:@"%@", item[@"joke"]]
                            ];
    //self.jokes = _jokes;
    NSLog(@"%@", _jokes);
    
////////////Trying to replace awkward &quot;
//    for (id __strong item in _jokes){
//        item = [item stringByReplacingOccurrencesOfString:@"&quot;" withString:@"'"];
//    };
    self.jokes = _jokes;
}

#pragma mark - table view stuff

    

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return jokes.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SpaceCell *cell = [tableView dequeueReusableCellWithIdentifier:@"spaceCell" forIndexPath:indexPath];
    [cell updateCellWithJoke:[jokes objectAtIndex:indexPath.row]];
    return cell;
}

@end
