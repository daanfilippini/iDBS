//
//  InstellingenViewController.m
//  iDBS
//
//  Created by Daan Filippini on 9-02-15.
//  Copyright (c) 2015 Daan Filippini. All rights reserved.
//

#import "InstellingenViewController.h"

@interface InstellingenViewController ()

@end

@implementation InstellingenViewController

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        
        return 4;
    }
    
    else {
        
        return 1;
    }
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *MyIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (indexPath.section == 0) {
        
        if (indexPath.row == 0){
            
            cell.textLabel.text = @"Instelling 1";
        }
        
        if (indexPath.row == 1){
            
            cell.textLabel.text = @"Instelling 2";
        }
        
        if (indexPath.row == 2){
            
            cell.textLabel.text = @"Instelling 3";
        }
        if (indexPath.row == 3){
            
            cell.textLabel.text = @"Instelling 4";
        }
    }
    
    if (indexPath.section == 1) {
        
        if (indexPath.row == 0){
            
            cell.textLabel.text = @"Disclaimer";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.selectionStyle = UITableViewCellSelectionStyleGray;
        }
    }
    
    
    
    if (cell == nil) { cell = [[UITableViewCell alloc] init];}
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        
        return @"Instellingen";
        
    }
    else {
        
        return @"Disclaimer";
        
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    
    return nil;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 44;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return indexPath;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    /*
     NSString *googleString = @"http://www.google.com";
     NSURL *googleURL = [NSURL URLWithString:googleString];
     
     NSError* error = nil;
     NSString *data = [NSString stringWithContentsOfURL:googleURL encoding:NSASCIIStringEncoding error:&error];
     
     NSLog(data);
     */
}

- (void)viewDidAppear:(BOOL)animated
{
    // Kick off a timer to count it down
    //    m_timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(decrementSpin) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
