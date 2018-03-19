//
//  ViewController.m
//  ChuckNorrisApp
//
//  Created by Catherine Kreamer on 3/5/18.
//  Copyright © 2018 Camden Barkley. All rights reserved.
//


#import "ViewController.h"
#import "SpaceCell.h"
//#define JSON_FILE_URL @"http://api.icndb.com/jokes/random/3"

@interface ViewController ()


@property (strong, nonatomic) NSMutableArray *jokes;
@property (strong, nonatomic) NSMutableArray *wut;
@property (strong, nonatomic) NSURLSession *session;
@property (strong, nonatomic) NSURLSessionDataTask *sessionDataTask;
@property (strong, nonatomic) NSURLSessionTask *sessionTask;
@property (strong, nonatomic) NSString *JSON_FILE_URL; // = @"http://api.icndb.com/jokes/random/10";

@end

@implementation ViewController

@synthesize jokes, session, sessionDataTask, sessionTask, tableObject, wut;

//when it loads, set up my url session with its configuration
- (void)viewDidLoad {
    [super viewDidLoad];
    wut = [[NSMutableArray alloc] initWithObjects:@"hello", @"hi", @"How are ya?",  nil];
    self.title = @"JSONRead";
    _JSON_FILE_URL = @"http://api.icndb.com/jokes/random/3";
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    session = [NSURLSession sessionWithConfiguration:sessionConfiguration
                                            delegate:self
                                       delegateQueue:nil];
    [self downloadDataFromURL:[NSURL URLWithString:_JSON_FILE_URL]];
    //NSLog(@"%@", jokes);
    
}

#pragma mark - NSURLSession using Delegates
-(void)downloadDataFromURL:(NSURL *)url{
    sessionDataTask = [session dataTaskWithRequest:[[NSURLRequest alloc] initWithURL:url]];
    [sessionDataTask resume];
}

//Tells the delegate that the data task received the initial reply (headers) from the server.
-(void)URLSession:(NSURLSession *)session
         dataTask:(NSURLSessionDataTask *)dataTask
didReceiveResponse:(NSURLResponse *)response
completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler{
    //NSLog(@"didReceiveResponse ");
    //NSHTTPURLResponse *respon = (NSHTTPURLResponse *)response;
    //NSLog(@"respon %ld",respon.statusCode);
   // NSLog(@"URL %@",respon.URL);
 // Allow this request to continue
    completionHandler(NSURLSessionResponseAllow);
}

/////////Tells the delegate that the data task has received some of the expected data.
- (void)URLSession:(NSURLSession *)session
          dataTask:(NSURLSessionDataTask *)dataTask
    didReceiveData:(NSData *)data{
/////////Convert NSData to NSJSONSerialization
    NSJSONSerialization *json = [NSJSONSerialization JSONObjectWithData:data
                                                                options:NSJSONReadingMutableContainers
                                                                  error:nil];
    NSDictionary *jValue = [json valueForKey:@"value"];
   //[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil]);
    NSMutableArray *_jokes = [NSMutableArray array];
    for (id item in jValue)[
                            _jokes addObject:[NSMutableString stringWithFormat:@"%@", item[@"joke"]]
                            ];
    self.jokes = _jokes;
    NSLog(@"%@", jokes);
}


//-(void)URLSession:(NSURLSession *)session
//             task:(NSURLSessionTask *)task
//didCompleteWithError:(NSError *)error{
//
//    if (error == nil) {
//        NSLog(@"description %@",task.response.description);
//        NSLog(@"task taskIdentifier %ld" ,[task taskIdentifier]);
//
//        if (task == sessionTask) {
//            NSLog(@"Session Task");
//        }else if(task == sessionDataTask){
//            NSLog(@"sessionDataTask");
//        }else
//            NSLog(@"Error %@",[error userInfo]);
//    }
//}

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


- (IBAction)reloadTableData:(UIButton *)sender {
    [tableObject reloadData];
    [self downloadDataFromURL:[NSURL URLWithString:_JSON_FILE_URL]];
    NSLog(@"Reload!");
}
@end
