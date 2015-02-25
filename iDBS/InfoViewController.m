//
//  InfoViewController.m
//  iDBS
//
//  Created by Daan Filippini on 9-02-15.
//  Copyright (c) 2015 Daan Filippini. All rights reserved.
//

#import "InfoViewController.h"


@interface InfoViewController () {}

@end

@implementation InfoViewController

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 4;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        
        return 2;
    }
    
    else if (section == 1){
        
        return 1;
    }
    
    else if (section == 2){
        
        return 2;
    }
    
    else {
        
        return 3;
    }
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *MyIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];

    if (indexPath.section == 0) {
        
        if (indexPath.row == 0){
            
            cell.textLabel.text = @"Percentage";
            cell.detailTextLabel.text = @"99%";
        }
        
        if (indexPath.row == 1){
            
            cell.textLabel.text = @"Resterende duur";
            cell.detailTextLabel.text = @"1,5 jaar";
        }
    }
    
    if (indexPath.section == 1) {
        
        if (indexPath.row == 0){
            
            cell.textLabel.text = @"Klik hier voor de lijst";
            cell.detailTextLabel.text = @"";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.selectionStyle = UITableViewCellSelectionStyleGray;
        }
    }
    
    if (indexPath.section == 2) {
        
        if (indexPath.row == 0){
            
            cell.textLabel.text = @"Modelnaam";
            cell.detailTextLabel.text = @"Activa® PC";
            
        }
        
        if (indexPath.row == 1){
            
            cell.textLabel.text = @"Modelnummer";
            cell.detailTextLabel.text = @"37601";
        }
    }
    
    if (indexPath.section == 3) {
        
        if (indexPath.row == 0){
            
            cell.textLabel.text = @"Ziekenhuis/organisatie";
            cell.detailTextLabel.text = @"Naam";
            
        }
        
        if (indexPath.row == 1){
            
            cell.textLabel.text = @"Arts/Clinicus";
            cell.detailTextLabel.text = @"Naam";
        }
        
        if (indexPath.row == 2){
            
            cell.textLabel.text = @"E-mail";
            cell.detailTextLabel.text = @"E-Mail";
        }

    }


    if (cell == nil) { cell = [[UITableViewCell alloc] init];}
    
        return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        
        return @"Batterijinformatie";
    
    }
    else if (section == 1){
        
        return @"EMI Gevareninformatie";
        
    }
    else if (section == 2){
        
        return @"Apparaatinformatie";
    }
    
    else {
        
        return @"Contactinformatie";
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    
    if (section == 0) {
        
        return nil;
        
    }
    else if (section == 1){
        
        return @"Een lijst met apparaten en procedures die EMI kunnen veroorzaken.";
        
    }
    else {
        
        return nil;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
        
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   
    if (indexPath.section == 1) {
        
        return indexPath;
    }
    
    else {
        
        return nil;
    }
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
