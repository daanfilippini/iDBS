//
//  GroepViewController.m
//  iDBS
//
//  Created by BaviDaan on 20-02-15.
//  Copyright (c) 2015 BV-D Software. All rights reserved.
//

#import "GroepViewController.h"

@interface GroepViewController ()

@end

@implementation GroepViewController

@synthesize checkedIndexPath;

- (void)viewDidLoad {
    
    [super viewDidLoad];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 4;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    NSString *SearchEngine = [[NSUserDefaults standardUserDefaults] objectForKey:@"Groep"];
    
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (nil == cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    
    if (indexPath.row == 0) {
        
        cell.textLabel.text = @"Normaal";
    }
    
    if (indexPath.row == 1) {
        
        cell.textLabel.text = @"Wandelen";
    }
    
    if (indexPath.row == 2) {
        
        cell.textLabel.text = @"Slapen";
    }
    
    if (indexPath.row == 3) {
        
        cell.textLabel.text = @"Hoofdpijn";
    }
    
    if ([SearchEngine isEqualToString:cell.textLabel.text]) {
        
        checkedIndexPath = [NSIndexPath indexPathForRow:indexPath.row inSection:0];
    }
    
    if(checkedIndexPath == indexPath) {
        
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    
    if(!(checkedIndexPath == indexPath)) {
        
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(checkedIndexPath) {
        
        UITableViewCell *uncheckCell = [tableView cellForRowAtIndexPath:checkedIndexPath];
        uncheckCell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    checkedIndexPath = indexPath;
    
    [[NSUserDefaults standardUserDefaults] setObject:[tableView cellForRowAtIndexPath:checkedIndexPath].textLabel.text forKey:@"Groep"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        
        return @"Selecteer een group";
    }
    
    else {
        
        return @"";
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    
    if (section == 0) {
        
        return @"Groepen kunnen worden gemaakt en aangepast door een clinicus/arts.";
    }
    
    else {
        
        return @"";
    }
}

- (void)Background:(NSNotification *) notification {
    
    [self.view.window.rootViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
