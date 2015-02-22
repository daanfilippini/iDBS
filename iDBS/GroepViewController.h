//
//  GroepViewController.h
//  iDBS
//
//  Created by BaviDaan on 20-02-15.
//  Copyright (c) 2015 BV-D Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GroepViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    
    NSIndexPath *checkedIndexPath;
}

@property (nonatomic, retain) NSIndexPath *checkedIndexPath;

@end
