//
//  SpaceCell.m
//  ChuckNorrisApp
//
//  Created by Camden Barkley on 3/5/18.
//  Copyright © 2018 Camden Barkley. All rights reserved.
//

#import "SpaceCell.h"

@implementation SpaceCell

@synthesize jokeLbl;

- (void)awakeFromNib {
    [super awakeFromNib];
}

//Put the joke where it's supposed to go
-(void)updateCellWithJoke:(NSString *)joke{
    self.jokeLbl.text = joke;
}

@end
