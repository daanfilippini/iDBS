//
//  GevarenViewController.m
//  iDBS
//
//  Created by Daan Filippini on 9-02-15.
//  Copyright (c) 2015 Daan Filippini. All rights reserved.
//

#import "GevarenViewController.h"

@interface GevarenViewController ()

@end

@implementation GevarenViewController

@synthesize emiList = _emiList;

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    
    if ([searchResult count] == 0) {
        
        emiTable.allowsSelection = NO;
        emiTable.scrollEnabled = NO;
    }
    
    isSearchOn = YES;
    
    self.navigationItem.rightBarButtonItem =      [[UIBarButtonItem alloc]
                                                   initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                   target:self
                                                   action:@selector(doneSearching:)];
}

- (NSArray *)emiList {
    
    if (!_emiList) {
        
        _emiList = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"emiList" ofType:@"plist"]];
    }
    
    return _emiList;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    searchBar.delegate = self;
    searchResult = [[NSMutableArray alloc] init];
    isSearchOn = NO;
    emiTable.allowsSelection = YES;
    
    emiTable.frame = self.view.bounds;
    [self.view addSubview:emiTable];

}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

- (void) doneSearching:(id)sender {
    
    isSearchOn = NO;
    self.navigationItem.rightBarButtonItem = nil;
    
    searchBar.text = @"";
    emiTable.allowsSelection = YES;
    emiTable.scrollEnabled = YES;
    
    [searchBar resignFirstResponder];
    [emiTable reloadData];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    
    [searchResult removeAllObjects];
    
    if ([searchText length] > 0) {
        
        isSearchOn = YES;
        emiTable.allowsSelection = YES;
        emiTable.scrollEnabled = YES;
        [self searchTableView];
    }
    
    else {
        
        isSearchOn = YES;
        emiTable.scrollEnabled = NO;
        emiTable.allowsSelection = NO;
        [self searchTableView];
    }
    
    [emiTable reloadData];
}

- (void) searchTableView {
    
    NSArray *arrayValues = [[[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"emiList" ofType:@"plist"]] valueForKey:@"Apparaat/Procedure"];
    
    [searchResult removeAllObjects];
    
    for (NSString *str in arrayValues) {
        
        NSRange titleResultsRange =
        [str rangeOfString:searchBar.text options:NSCaseInsensitiveSearch];
        
        if (titleResultsRange.length > 0)
            
            [searchResult addObject:str];
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    [self searchTableView];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (isSearchOn) {
        
        return [searchResult count];
        
    } else {
        
        return [self.emiList count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (isSearchOn) {
        
        cell.textLabel.text = [searchResult objectAtIndex:indexPath.row];
    }
    
    if (!(isSearchOn)) {
        
        cell.textLabel.text = [[self.emiList objectAtIndex:indexPath.row] valueForKey:@"Apparaat/Procedure"];
        cell.detailTextLabel.text = [[self.emiList objectAtIndex:indexPath.row] valueForKey:@"EMI"];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 50;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [emiTable deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *titel = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:titel message:@"\nHier kan aanvullende informatie komen\n\nVoor meer informatie, raadpleeg pagina XX in de handleiding." delegate:self cancelButtonTitle:@"Oké" otherButtonTitles:nil];
    
    [alert show];
    
}

@end
