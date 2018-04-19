//
//  NetworkManager.m
//  ChuckNorrisApp
//
//  Created by Camden Barkley on 3/20/18.
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

//All the network related stuff:
- (void)downloadSomeStrings{
    NSURL *url = [NSURL URLWithString:@"http://api.icndb.com/jokes/random/7"];//create an NSURL
    NSURLSession *session = [NSURLSession sharedSession];//Create an instance of NSURLSession
    __weak NetworkManager *weakSelf = self; //I use this var to prevent a retain cycle in the block
    //create a download task and when it has it's info call the jsonToJokes method
    NSURLSessionDataTask *downloadJsonTask = [session dataTaskWithURL:url
                                                    completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                        [weakSelf jsonToJokes:data];
                                                    }];
    //start the download task
    [downloadJsonTask resume];
}

//I put this code in this method rather than having it in the block in order to avoid explicitly calling an ivar or property inside a block.
- (void)jsonToJokes:(NSData *)data{
    //convert the downloaded json file into a dictionary
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                                         options:0
                                                           error:nil];
    NSMutableArray *_jokes = [NSMutableArray array];
    NSDictionary *jValue = [json valueForKey:@"value"];//isolate the 'value' key of the dictionary
    for (id item in jValue)[//for each item in the jValue dictionary, pull out the 'joke' part
        _jokes addObject:[NSMutableString stringWithFormat:@"%@", item[@"joke"]]
        ];
    holderObject.jokes = _jokes;//tell the holder what the jokes are
    //tell the holder's tableview to reloadData on the main thread
    SEL reloadSelector = NSSelectorFromString(@"reloadData");
    [holderObject.table performSelectorOnMainThread:reloadSelector
                                         withObject:nil
                                      waitUntilDone:YES];
    holderObject.delegate = nil;//dealocate the NM instance
}

@end
