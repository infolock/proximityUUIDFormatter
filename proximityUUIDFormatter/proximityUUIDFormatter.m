//
//  proximityUUIDFormatter.m
//  estimoteTraining
//
//  Created by Jonathon Hibbard on 5/23/14.
//  Copyright (c) 2014 DataOCD. All rights reserved.
//

#import "proximityUUIDFormatter.h"

@interface proximityUUIDFormatter ()
    @property (nonatomic, copy) NSString *previousValue;
    @property (nonatomic, copy) UITextRange *previousSelection;

@end

@implementation proximityUUIDFormatter


-(void)stashValuesInTextField:(UITextField *)textField {
    self.previousValue = textField.text;
    self.previousSelection = textField.selectedTextRange;
}

-(void)resetValueInTextField:(UITextField *)textField {
    textField.text = [self.previousValue copy];
    textField.selectedTextRange = [self.previousSelection copy];

    self.previousValue = nil;
    self.previousSelection = nil;
}

+(instancetype)sharedInstance {

    static proximityUUIDFormatter *_sharedInstance = nil;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        _sharedInstance = [proximityUUIDFormatter new];
    });

    return _sharedInstance;
}

#pragma mark -
#pragma mark Helpers
#pragma mark -

+(NSString *)generateUUID {
    return [[NSUUID UUID] UUIDString];
}


+(NSUUID *)proximityUUIDFromUUID:(id)UUID {

    if( [UUID isKindOfClass:[NSString class]] ) {
        return [[NSUUID alloc] initWithUUIDString:UUID];
    }
    
    return UUID;
}

+(BOOL)isValidProximityUUID:(NSString *)proximityUUID {
    return (bool)[[NSUUID alloc] initWithUUIDString:proximityUUID];
}


#pragma mark -
#pragma mark Usage Methods
#pragma mark -

+(void)storeValuesInTextField:(UITextField *)textField {
    [[proximityUUIDFormatter sharedInstance] stashValuesInTextField:textField];
}

+(void)formatTextField:(UITextField *)textField {

    NSUInteger targetCursorPosition = (NSUInteger)[textField offsetFromPosition:textField.beginningOfDocument toPosition:textField.selectedTextRange.start];

    NSString *nekkedProximityUUID = [[self class] stripHyphensFromString:textField.text atCursorPosition:&targetCursorPosition];
    if( [nekkedProximityUUID length] > 32 ) {
        [[proximityUUIDFormatter sharedInstance] resetValueInTextField:textField];
        return;
    }

    NSString *proximityUUID = [[self class] hyphenateString:nekkedProximityUUID atCursorPosition:&targetCursorPosition];
    textField.text = proximityUUID;

    UITextPosition *targetPosition = [textField positionFromPosition:[textField beginningOfDocument] offset:targetCursorPosition];
    [textField setSelectedTextRange: [textField textRangeFromPosition:targetPosition toPosition:targetPosition]];
}

+(NSString *)stripHyphensFromString:(NSString *)string atCursorPosition:(NSUInteger *)cursorPosition {

    NSUInteger originalCursorPosition = *cursorPosition;
    NSMutableString *poleDancer = [NSMutableString new];

    NSUInteger strLen = [string length];
    NSUInteger i;

    for( i = 0; i < strLen; i++ ) {
        unichar characterToAdd = [string characterAtIndex:i];

        if( isalnum( characterToAdd ) ) {

            NSString *stringToAdd = [NSString stringWithCharacters:&characterToAdd length:1];
            [poleDancer appendString:stringToAdd];

        } else if( i < originalCursorPosition ) {
            (*cursorPosition)--;
        }
    }

    return poleDancer;
}

+(NSString *)hyphenateString:(NSString *)string atCursorPosition:(NSUInteger *)cursorPosition {

    NSMutableString *hyphenatedString = [NSMutableString new];
    NSUInteger cursorPositionInString = *cursorPosition;

    NSUInteger strLen = [string length];
    NSUInteger i;

    for( i = 0; i < strLen; i++) {
        if( i >= 8 && i <= 20 && i%4 == 0 ) {
            [hyphenatedString appendString:@"-"];

            if( i < cursorPositionInString ) {
                (*cursorPosition)++;
            }
        }

        unichar characterToAdd = [string characterAtIndex:i];
        [hyphenatedString appendString:[NSString stringWithCharacters:&characterToAdd length:1]];
    }

    return hyphenatedString;
}

@end
