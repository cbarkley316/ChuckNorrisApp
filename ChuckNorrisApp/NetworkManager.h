//
//  NetworkManager.h
//  ChuckNorrisApp
//
//  Created by Catherine Kreamer on 3/20/18.
//  Copyright © 2018 Camden Barkley. All rights reserved.
//

#import "ViewController.h"
@class ViewController;

@interface NetworkManager : UIViewController

@property (strong, nonatomic) ViewController *holder;

-(void)downloadDataFromURL;
-(void)pullFromICNDBJSON:(NSData *)data;

@end
