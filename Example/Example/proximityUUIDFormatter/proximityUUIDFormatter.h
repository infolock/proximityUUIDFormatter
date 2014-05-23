//
//  proximityUUIDFormatter.h
//  estimoteTraining
//
//  Created by Jonathon Hibbard on 5/23/14.
//  Copyright (c) 2014 DataOCD. All rights reserved.
//

@interface proximityUUIDFormatter : NSObject

// Is this a valid ProximityUUID?
+(BOOL)isValidProximityUUID:(NSString *)proximityUUID;

// Ensures we keep a properly structured, 32-character value.
+(void)storeValuesInTextField:(UITextField *)textField;

// Handles the actual heavy lifting of formatting/keeping track of cursor position, and all that other jazz...
+(void)formatTextField:(UITextField *)textField;

@end
