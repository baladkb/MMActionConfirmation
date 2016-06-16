//
//  MMActionConfirmationView.m
//
//  Created by Michael Mavris on 13/06/16.
//  Copyright © 2016 Miksoft. All rights reserved.
//

#import "MMActionConfirmationView.h"
#import "Enum.h"

@interface MMActionConfirmationView()

@property (nonatomic, assign) id <MMActionConfirmationViewDelegate> delegate;

@property (nonatomic, strong) UIWindow *activityWindow;
@property(nonatomic,assign)NSInteger mode;
@property (nonatomic,strong)UIAlertController *alertController;
@property (nonatomic,strong)NSString *value;
@property (nonatomic,strong)NSString *okTitle;
@property (nonatomic,strong)NSString *cancelTitle;
@property (nonatomic,strong)NSString *title;

@end

@implementation MMActionConfirmationView{
    
    UIViewController *blankViewController;
}

-(instancetype)initWithConfirmationMode:(NSInteger)mode Value:(NSString*)stringValue andDelegate:(id<MMActionConfirmationViewDelegate>)del{

    self = [super initWithFrame:[[UIScreen mainScreen] bounds]];
    
    if (self) {
        
        self.mode=mode;
        self.value=stringValue;
        [self setupWindowAndController];
        self.delegate=del;
    }
    
    return self;
}

-(void)setupWindowAndController{
    //We create a new UIViewController and add our view. This UIViewController will be transparent
    blankViewController = [[UIViewController alloc] init];
    [[blankViewController view] setBackgroundColor:[UIColor clearColor]];
    
    //We create a new UIWindow and add our UIViewController. This UIWindow will be transparent
    UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [window setRootViewController:blankViewController];
    [window setBackgroundColor:[UIColor clearColor]];
    [window setWindowLevel:UIWindowLevelAlert];
    
    [blankViewController.view addSubview:self];
    
    [self setActivityWindow:window];
}

-(void)updateConstraints {
    
    [super updateConstraints];
}

-(UIAlertController*)alertController{

    if(_alertController==nil){
    
        NSURL *url;
        
        //The string for the Cancel button
        self.cancelTitle = @"Cancel";
        
        switch (self.mode){
            case telephoneConfirmation:
                self.title=self.value;
                self.okTitle=@"Call";
                url= [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",self.value]];
                break;
            case websiteConfirmation:
                self.title=self.value;
                self.okTitle=@"Visit";
                url= [NSURL URLWithString:self.value];
                break;
            case facebookConfirmation:
                self.title=@"Open Facebook";
                self.okTitle=@"Open";
                url= [NSURL URLWithString:self.value];
                break;
            case emailConfirmation:
                self.title=self.value;
                self.okTitle=@"Email";
                url= [NSURL URLWithString:[NSString stringWithFormat:@"mailto:%@",self.value]];
                break;
            default:
                break;
        }
        
        //Initializign the OK button
        UIAlertAction *okButton = [UIAlertAction actionWithTitle:self.okTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
            
            if ([[UIApplication sharedApplication] canOpenURL:url]) {
                [[UIApplication sharedApplication] openURL:url];
            }
            else {
                //The delegate that informs the controller that the request failed
                [self.delegate MMActionConfirmationCantOpenURLDelegateForMode:self.mode];
            }
            //Hiding the UIViewController after showing the confirmation
            [self hide];
        }];
        
        
        //Initializign the Cancel button
        UIAlertAction *cancelButton = [UIAlertAction actionWithTitle:self.cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
            //Hiding the UIViewController after showing the confirmation
            [self hide];
        }];
        
        //Initializing the controller
        _alertController = [UIAlertController alertControllerWithTitle:self.title message:nil preferredStyle:UIAlertControllerStyleAlert];
        
        if (okButton) {
            [_alertController addAction:okButton];
        }
        
        if (cancelButton) {
            [_alertController addAction:cancelButton];
        }

    }
    
    return _alertController;
}


- (void)show{
    //If blackViewController is initialized
    if(blankViewController){
        
        [self.activityWindow makeKeyAndVisible];
        [blankViewController presentViewController:self.alertController animated:YES completion:^{}];
    }
}

-(void)hide{
  
    [[self activityWindow] setHidden:YES];
    [self setActivityWindow:nil];
}

@end
