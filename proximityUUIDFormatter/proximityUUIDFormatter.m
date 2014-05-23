//
//  proximityUUIDTextFieldFormatter.m
//  estimoteTraining
//
//  Created by Jonathon Hibbard on 5/23/14.
//  Copyright (c) 2014 DataOCD. All rights reserved.
//

#import "proximityUUIDTextFieldFormatter.h"

@interface proximityUUIDTextFieldFormatter()
    @property (nonatomic, copy) NSString *previousTextFieldContent;
    @property (nonatomic, copy) UITextRange *previousSelection;

@end

@implementation proximityUUIDTextFieldFormatter


-(void)stashValuesInTextField:(UITextField *)textField {
    self.previousTextFieldContent = textField.text;
    self.previousSelection = textField.selectedTextRange;
}

-(void)resetValueInTextField:(UITextField *)textField {
    textField.text = [self.previousTextFieldContent copy];
    textField.selectedTextRange = [self.previousSelection copy];

    self.previousTextFieldContent = nil;
    self.previousSelection = nil;
}

+(instancetype)sharedInstance {

    static proximityUUIDTextFieldFormatter *_sharedInstance = nil;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        _sharedInstance = [proximityUUIDTextFieldFormatter new];
    });

    return _sharedInstance;
}

+(BOOL)isValidProximityUUID:(NSString *)proximityUUID {
    return (bool) [[NSUUID alloc] initWithUUIDString:proximityUUID];
}

+(void)storeValuesInTextField:(UITextField *)textField {
    [[proximityUUIDTextFieldFormatter sharedInstance] stashValuesInTextField:textField];
}

+(void)formatTextField:(UITextField *)textField {

    NSUInteger targetCursorPosition = (NSUInteger)[textField offsetFromPosition:textField.beginningOfDocument toPosition:textField.selectedTextRange.start];

    NSString *proximityUUIDWithoutHyphens = [[self class] removeHyphensFromText:textField.text withCursorPosition:&targetCursorPosition];

    if( [proximityUUIDWithoutHyphens length] > 32 ) {
        [[proximityUUIDTextFieldFormatter sharedInstance] resetValueInTextField:textField];
        return;
    }

    NSString *proximityUUIDWithHyphens = [[self class] insertHyphensForProximityUUID:proximityUUIDWithoutHyphens withCursorPosition:&targetCursorPosition];
    textField.text = proximityUUIDWithHyphens;

    UITextPosition *targetPosition = [textField positionFromPosition:[textField beginningOfDocument] offset:targetCursorPosition];
    [textField setSelectedTextRange: [textField textRangeFromPosition:targetPosition toPosition:targetPosition]];
}

+(NSString *)removeHyphensFromText:(NSString *)string withCursorPosition:(NSUInteger *)cursorPosition {

    NSUInteger originalCursorPosition = *cursorPosition;
    NSMutableString *alphaNumOnlyStr = [NSMutableString new];

    NSUInteger strLen = [string length];
    NSUInteger i;

    for( i = 0; i < strLen; i++ ) {
        unichar characterToAdd = [string characterAtIndex:i];

        if( isalnum( characterToAdd ) ) {

            NSString *stringToAdd = [NSString stringWithCharacters:&characterToAdd length:1];
            [alphaNumOnlyStr appendString:stringToAdd];

        } else if( i < originalCursorPosition ) {
            (*cursorPosition)--;
        }
    }

    return alphaNumOnlyStr;
}

+(NSString *)insertHyphensForProximityUUID:(NSString *)string withCursorPosition:(NSUInteger *)cursorPosition {

    NSMutableString *stringWithHyphens = [NSMutableString new];
    NSUInteger cursorPositionInString = *cursorPosition;

    NSUInteger strLen = [string length];
    NSUInteger i;

    for( i = 0; i < strLen; i++) {
        if( i >= 8 && i <= 20 && i%4 == 0 ) {
            [stringWithHyphens appendString:@"-"];

            if( i < cursorPositionInString ) {
                (*cursorPosition)++;
            }
        }

        unichar characterToAdd = [string characterAtIndex:i];
        [stringWithHyphens appendString:[NSString stringWithCharacters:&characterToAdd length:1]];
    }

    return stringWithHyphens;
}
@end
