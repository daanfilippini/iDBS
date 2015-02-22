//
//  GevarenViewController.h
//  iDBS
//
//  Created by BaviDaan on 18-02-15.
//  Copyright (c) 2015 BV-D Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GevarenViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate> {
    
    IBOutlet UISearchBar *searchBar;
    IBOutlet UINavigationBar *navBar;
    
    IBOutlet UITableView *emiTable;
    
    BOOL isSearchOn;
    BOOL canSelectRow;
    NSMutableArray *searchResult;
    UITableViewCell *FinalCell;

}

@property (strong, nonatomic) NSArray *emiList;

- (void) doneSearching: (id)sender;
- (void) searchTableView;

@end
