//
//  ProgrammaViewController.h
//  iDBS
//
//  Created by Daan Filippini on 9-02-15.
//  Copyright (c) 2015 Daan Filippini. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgrammaViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    
    IBOutlet UITableView *tblView;
    
    IBOutlet UIStepper *stpLeft;
    IBOutlet UILabel *lblLeft;
    IBOutlet UIStepper *stpRight;
    IBOutlet UILabel *lblRight;
}

- (IBAction)valueChanged:(UIStepper *)sender;

@end

