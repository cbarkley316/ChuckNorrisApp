//
//  NetworkManager.h
//  ChuckNorrisApp
//
//  Created by Camden Barkley on 3/20/18.
//  Copyright © 2018 Camden Barkley. All rights reserved.
//
#import "ViewController.h"

@interface NetworkManager : UIViewController <downloadStringsDelegate>//follow the 'downloadStringsDelegate' protocol

@property (weak) ViewController *holderObject;

- (void)jsonToJokes:(NSData *)data;
//methods from "downloadStringsDelegate" protocol
- (void)downloadSomeStrings;
- (void)setHolder:(id)sender;

@end
