//
//  NetworkManager.h
//  ChuckNorrisApp
//
//  Created by Catherine Kreamer on 3/20/18.
//  Copyright © 2018 Camden Barkley. All rights reserved.
//
#import "ViewController.h"
@class ViewController;//"Hey compiler, here's a warning that I'm going to mention 'ViewController'. Dont freak out".

@interface NetworkManager : UIViewController <getStrings>//follow the 'getStrings' protocol

@property (weak) ViewController *holderObject;

//methods from "getStrings" protocol
- (void)downloadSomeStrings;
- (void)setHolder:(id)sender;

@end
