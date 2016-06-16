//
//  ViewController.m
//  MMActionConfirmation-Demo
//
//  Created by Michael Mavris on 13/06/16.
//  Copyright © 2016 Miksoft. All rights reserved.
//

#import "ViewController.h"
#import "Enum.h"

@interface ViewController ()

@end

@implementation ViewController{
    MMActionConfirmationView *mmAC ;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)opnFacebookAction:(id)sender {
    
    mmAC = [[MMActionConfirmationView alloc]initWithConfirmationMode:facebookConfirmation Value:@"https://www.facebook.com/pages/Apple-Inc/105596369475033" andDelegate:self];
    [mmAC show];
}

- (IBAction)callAction:(id)sender {
    mmAC = [[MMActionConfirmationView alloc]initWithConfirmationMode:telephoneConfirmation Value:@"0018008002775" andDelegate:self];
    [mmAC show];
}
- (IBAction)mailAction:(id)sender {
    mmAC = [[MMActionConfirmationView alloc]initWithConfirmationMode:emailConfirmation Value:@"info@apple.com" andDelegate:self];
    [mmAC show];
}

- (IBAction)websiteAction:(id)sender {
    mmAC = [[MMActionConfirmationView alloc]initWithConfirmationMode:websiteConfirmation Value:@"https://www.apple.com" andDelegate:self];
    [mmAC show];
}

-(void)MMActionConfirmationCantOpenURLDelegateForMode:(NSInteger)mode{

    switch (mode) {
            
        case facebookConfirmation:
            NSLog(@"Can't open facebook app");
            break;
        case telephoneConfirmation:
            NSLog(@"Can't make a phone call");
            break;
        case emailConfirmation:
            NSLog(@"Can't open mail app");
            break;
        case websiteConfirmation:
            NSLog(@"Can't open the website");
            break;
        default:
            break;
    }
}

@end
