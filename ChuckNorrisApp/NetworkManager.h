//
//  NetworkManager.h
//  ChuckNorrisApp
//
//  Created by Catherine Kreamer on 3/20/18.
//  Copyright © 2018 Camden Barkley. All rights reserved.
//

#import "ViewController.h"

@interface NetworkManager : UIViewController

@property (strong, nonatomic) NSData *downloadedJSON;


-(void)downloadDataFromURL;
-(void)pullFromICNDBJSON:(NSData *)data;

@end
