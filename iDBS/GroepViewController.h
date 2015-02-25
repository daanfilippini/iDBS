//
//  GroepViewController.h
//  iDBS
//
//  Created by Daan Filippini on 9-02-15.
//  Copyright (c) 2015 Daan Filippini. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GroepViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    
    NSIndexPath *checkedIndexPath;
}

@property (nonatomic, retain) NSIndexPath *checkedIndexPath;

@end
