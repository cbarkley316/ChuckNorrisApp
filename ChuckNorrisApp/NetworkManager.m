//
//  NetworkManager.m
//  ChuckNorrisApp
//
//  Created by Catherine Kreamer on 3/20/18.
//  Copyright © 2018 Camden Barkley. All rights reserved.
//

#import "NetworkManager.h"
#import "ViewController.h"

@interface NetworkManager ()

@end

@implementation NetworkManager

@synthesize holderObject;

//here's how NM knows where to send it's info
-(void)setHolder:(id)sender{
    holderObject = sender;
}

//All the network related stuff
- (void)downloadSomeStrings{
    NSURL *url = [NSURL URLWithString:@"http://api.icndb.com/jokes/random/10"];//create an NSURL
    NSURLSession *session = [NSURLSession sharedSession];//Create an instance of NSURLSession
    //create a download task and when it has it's info run the code in the attatched block
    NSURLSessionDataTask *downloadJsonTask = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                //run this code when it downloads
                                //convert the downloaded json file into a dictionary
                                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                                                                     options:0
                                                                                       error:nil];
                                NSMutableArray *_jokes = [NSMutableArray array];
                                //isolate the 'value' key of the dictionary
                                NSDictionary *jValue = [json valueForKey:@"value"];
                                //for each item in the dictionary, pull out the 'joke' part
                                for (id item in jValue)[
                                    _jokes addObject:[NSMutableString stringWithFormat:@"%@", item[@"joke"]]
                                ];
                                //tell the holder what the jokes are
                                holderObject.jokes = _jokes;
                                //tell the holder's tableview to reloadData on the main thread
                                SEL reloadSelector = NSSelectorFromString(@"reloadData");
                                [holderObject.table performSelectorOnMainThread:reloadSelector
                                                               withObject:nil
                                                            waitUntilDone:YES];
                                                    }];
    //start the download task
    [downloadJsonTask resume];
}

@end
