//
//  ViewController.m
//  Example
//
//  Created by Jonathon Hibbard on 5/23/14.
//  Copyright (c) 2014 puuid. All rights reserved.
//

#import "ViewController.h"
#import "proximityUUIDFormatter.h"

@interface ViewController() <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextField *proximityUUIDTextField;

@end

@implementation ViewController

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    [proximityUUIDFormatter storeValuesInTextField:textField];
    return YES;
}

-(IBAction)formatProximityUUIDInTextField:(UITextField *)textField {
    [proximityUUIDFormatter formatTextField:textField];
}

-(IBAction)doneButtonTapped:(id)sender {

    UIAlertView *alert;

    if( ![proximityUUIDFormatter isValidProximityUUID:self.proximityUUIDTextField.text] ) {
        alert = [[UIAlertView alloc] initWithTitle:@"INVALID ProximityUUID!"
                                           message:@"The ProximityUUID you have entered is invalid!  Please try again."
                                          delegate:nil
                                 cancelButtonTitle:@"OK"
                                 otherButtonTitles:nil];
    } else {

        [self.proximityUUIDTextField resignFirstResponder];

        alert = [[UIAlertView alloc] initWithTitle:@"wh00t!"
                                           message:@"The ProximityUUID appears to be valid!"
                                          delegate:nil
                                 cancelButtonTitle:@"yay team"
                                 otherButtonTitles:nil];
    }

    [alert show];
}

@end
