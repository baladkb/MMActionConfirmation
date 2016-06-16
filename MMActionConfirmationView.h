//
//  MMActionConfirmationView.h
//
//  Created by Michael Mavris on 13/06/16.
//  Copyright © 2016 Miksoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MMActionConfirmationViewDelegate <NSObject>

@optional
/*!
 @brief This method is a delegate which is called when the controller can't open the URL
 */
-(void)MMActionConfirmationCantOpenURLDelegateForMode:(NSInteger)mode;

@end

@interface MMActionConfirmationView : UIView

/*!
 @brief This method initialize the view that will show the Alert
 @param mode This parameter defines the mode of confirmation. Available modes are emailConfirmation, telephoneConfirmation, websiteConfirmation, facebookConfirmation (or their integer values:0,1,2,3)
 @param stringValue The value that will be used for the action. eg: for telephone:  0018008002775 , Email: info@apple.com, Website: http://www.apple.com , Facebook: https://www.facebook.com/pages/Apple-Inc/105596369475033
 
 @code
 MMActionConfirmationView *mmAC = [[MMActionConfirmationView alloc]initWithConfirmationMode:facebookConfirmation andValue:@"https://www.facebook.com/pages/Apple-Inc/105596369475033"];
 [mmAC show];

 OR

 MMActionConfirmationView *mmAC = [[MMActionConfirmationView alloc]initWithConfirmationMode:telephoneConfirmation andValue:@"0018008002775"];
 [mmAC show];
 @endcode
 */
-(instancetype)initWithConfirmationMode:(NSInteger)mode Value:(NSString*)stringValue andDelegate:(id <MMActionConfirmationViewDelegate>)del;

- (void)show;
@end
