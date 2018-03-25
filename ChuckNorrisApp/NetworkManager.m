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

@synthesize downloadedJSON, holder;

-(void)downloadDataFromURL{
    NSURL *url = [NSURL URLWithString:@"http://api.icndb.com/jokes/random/10"];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *downloadJsonTask = [session dataTaskWithURL:url
                                                    completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                        [self pullFromICNDBJSON:data];
    }];
    [downloadJsonTask resume];
}

//1)pulls jokes out of JSON, 2)stores them into an array, 3)and sends the array to viewcontroller
-(void)pullFromICNDBJSON:(NSData *)data{
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSMutableArray *_jokes = [NSMutableArray array];
    NSDictionary *jValue = [json valueForKey:@"value"];
    for (id item in jValue)[
                            _jokes addObject:[NSMutableString stringWithFormat:@"%@", item[@"joke"]]
                            ];
    NSLog(@"_jokes array has %d jokes in it.", (short)_jokes.count);
    [holder jokeReceiver:_jokes];    
}

@end
