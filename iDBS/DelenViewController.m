//
//  DelenViewController.m
//  iDBS
//
//  Created by BaviDaan on 18-02-15.
//  Copyright (c) 2015 BV-D Software. All rights reserved.
//

#import "DelenViewController.h"

@interface DelenViewController ()

@end

@implementation DelenViewController

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        
        return 3;
    }
    
    else {
        
        return 2;
    }
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *MyIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (indexPath.section == 0) {
        
        if (indexPath.row == 0){
            
            cell.textLabel.text = @"Stuur gegevens naar uw arts/clinicus";
        }
        
        if (indexPath.row == 1){
            
            cell.textLabel.text = @"Stel een vraag aan uw arts/clinicus";
        }
        
        if (indexPath.row == 2){
            
            cell.textLabel.text = @"Bel uw arts/clinicus";
        }
    }
    
    if (indexPath.section == 1) {
        
        if (indexPath.row == 0){
            
            cell.textLabel.text = @"Zie uw gegevens in";
        }
        
        if (indexPath.row == 1){
            
            cell.textLabel.text = @"Print uw gegevens";
        }
    }
    
    
    
    if (cell == nil) { cell = [[UITableViewCell alloc] init];}
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        
        return @"Arts/clinicus";
        
    }
    else {
        
        return @"Inzage";
        
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    
    return nil;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0) {
        
        if (indexPath.row == 0) {
            
            if ([MFMailComposeViewController canSendMail]) {
                
                MFMailComposeViewController *mailViewController = [[MFMailComposeViewController alloc] init];
                mailViewController.mailComposeDelegate = self;
                [mailViewController setSubject:@"Gegevens van Jan Janssen"];
                [mailViewController setMessageBody:@"Zie de bijlage voor mijn gegevensraport van de afgelopen periode" isHTML:NO];
                [mailViewController setToRecipients:[NSArray arrayWithObject:@"arts@ziekenhuis.nl"]];
                
                [self presentViewController:mailViewController animated:YES completion:NULL];
            }
            
            else {
                
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Mail app niet geïnstalleerd" message:@"\nInstalleer de app op een fysiek apparaat om te kunnen mailen." delegate:self cancelButtonTitle:@"Oké" otherButtonTitles:nil];
                
                [alert show];

            }
        }
        
        if (indexPath.row == 1) {
            
            if ([MFMailComposeViewController canSendMail]) {
                
                MFMailComposeViewController *mailViewController = [[MFMailComposeViewController alloc] init];
                mailViewController.mailComposeDelegate = self;
                [mailViewController setSubject:@"Vraag van Jan Janssen"];
                [mailViewController setMessageBody:@"" isHTML:NO];
                [mailViewController setToRecipients:[NSArray arrayWithObject:@"arts@ziekenhuis.nl"]];
                
                [self presentViewController:mailViewController animated:YES completion:NULL];
            }
            
            else {
                
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Mail app niet geïnstalleerd" message:@"\nInstalleer de app op een fysiek apparaat om te kunnen mailen." delegate:self cancelButtonTitle:@"Oké" otherButtonTitles:nil];
                
                [alert show];
                
            }
        }
        
        if (indexPath.row == 2) {
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:0620780355"]];
        }
        
    }
    
    if (indexPath.section == 1) {
        
        if (indexPath.row == 0) {
            
            
            
        }
    }

}

-(void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
    
    [self dismissViewControllerAnimated:YES completion:NULL];
    
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return indexPath;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    NSString *googleString = @"http://www.google.com";
    NSURL *googleURL = [NSURL URLWithString:googleString];
    
    NSError* error = nil;
    NSString *data = [NSString stringWithContentsOfURL:googleURL encoding:NSASCIIStringEncoding error:&error];
    
    //NSLog(data);
    
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
