
MMActionConfirmation
======

A class that ask the user to confirm before leaving the application to open a URL (tel:,mailto: etc)

###Features

+ It's behave like UIAlertView so it can be called from any controller.
+ Using the same flat design as Apple's native controller
+ Customizable
+ Compatbile with all iOS Devices
+ Easy to use

###Configuration

+ Add files in your Xcode project from: File-Add Files to YourProjectName-> Select MMActionConfirmation.m, MMActionConfirmation.h and Enum.h -> Click on "copy items if needed" -> OK

###How to use it

Import the following classes in your class:

```
#import "MMActionConfirmation.h"
#import "Enum.h"
```

Set your class as delegate of MMActionConfirmationViewDelegate

```
@interface ViewController : UIViewController<MMActionConfirmationViewDelegate>
```

Init and show the confirmation alert:

```
- (IBAction)callAction:(id)sender {
   MMActionConfirmationView *mmAC=[[MMActionConfirmationView alloc]initWithConfirmationMode:telephoneConfirmation Value:@"0018008002775" andDelegate:self];
   [mmAC show];
}
```

Implementing the MMActionConfirmationCantOpenURLDelegateForMode in your class in order to controll the response in case the controller failed to open a url e.g Make a call on iPad

```
-(void)MMActionConfirmationCantOpenURLDelegateForMode:(NSInteger)mode{
    //Handle the error
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
```
# ![Screenshot](https://raw.github.com/mavris/MMActionConfirmation/master/screenshot1.png) # ![Screenshot](https://raw.github.com/mavris/MMActionConfirmation/master/screenshot2.png) # ![Screenshot](https://raw.github.com/mavris/MMActionConfirmation/master/screenshot3.png) # ![Screenshot](https://raw.github.com/mavris/MMActionConfirmation/master/screenshot4.png)

That's it!

If you don't need to handle in case that URL cant be opene just enter "nil" as delegate paramater.

###Authors

* Michael Mavris

###License

Copyright Miksoft 2016

Licensed under the MIT License
