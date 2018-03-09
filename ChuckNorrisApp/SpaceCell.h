//
//  SpaceCell.h
//  ChuckNorrisApp
//
//  Created by Catherine Kreamer on 3/5/18.
//  Copyright © 2018 Camden Barkley. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpaceCell : UITableViewCell

@property (nonnull, strong) IBOutlet UILabel *jokeLbl;

- (void)updateCellWithJoke:(nonnull NSString *)joke;

@end
