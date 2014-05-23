//
//  proximityUUIDTextFieldFormatter.h
//  estimoteTraining
//
//  Created by Jonathon Hibbard on 5/23/14.
//  Copyright (c) 2014 DataOCD. All rights reserved.
//



@interface proximityUUIDTextFieldFormatter : NSObject

/**
 * Some (extra) helpers...
 */
+(NSString *)generateUUID;                              // Quick way to generate a random UUID
+(NSUUID *)proximityUUIDFromUUID:(id)UUID;              // Convenience method to allow us to work with either a UUID String or Object
+(BOOL)isValidProximityUUID:(NSString *)proximityUUID;  // Is this a valid ProximityUUID?

/**
 * Usage methods
 */
+(void)storeValuesInTextField:(UITextField *)textField;  // Ensures we keep a properly structured, 32-character value.
+(void)formatTextField:(UITextField *)textField;         // Handles the actual heavy lifting of formatting/keeping track of cursor position, and all that other jazz...

@end
