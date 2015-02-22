//
//  ProgrammaViewController.m
//  iDBS
//
//  Created by BaviDaan on 13-02-15.
//  Copyright (c) 2015 BV-D Software. All rights reserved.
//

#import "ProgrammaViewController.h"

@interface ProgrammaViewController ()

@end

@implementation ProgrammaViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    lblLeft.text = [NSString stringWithFormat:@"%g", stpLeft.value];
    lblRight.text = [NSString stringWithFormat:@"%g", stpRight.value];

    
}

-(void)viewWillAppear:(BOOL)animated {
    
    [tblView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *MyIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (indexPath.section == 0) {

        cell.textLabel.text = @"Groep";
        [[NSUserDefaults standardUserDefaults] synchronize];
        cell.detailTextLabel.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"Groep"];;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    if (indexPath.section == 1) {
        
        cell.textLabel.text = @"";
        cell.detailTextLabel.text = @"";
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
     
    if (cell == nil) { cell = [[UITableViewCell alloc] init];}
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        
        return @"Programmagroep";
    }
    else {
        
        return @"Variabelen";
    }
    
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
        
    return indexPath;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
        
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 1) {
        
        return 132;
    }
    else {
        
        return 44;
    }
}

- (IBAction)valueChanged:(UIStepper *)sender {
    
    if (sender.tag == 1) {
        
        [lblLeft setText:[NSString stringWithFormat:@"%g", sender.value]];
    }
    
    if (sender.tag == 2) {
        
        [lblRight setText:[NSString stringWithFormat:@"%g", sender.value]];
    }
    
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
