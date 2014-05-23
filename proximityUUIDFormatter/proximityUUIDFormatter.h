//
//  proximityUUIDTextFieldFormatter.h
//  estimoteTraining
//
//  Created by Jonathon Hibbard on 5/23/14.
//  Copyright (c) 2014 DataOCD. All rights reserved.
//



@interface proximityUUIDTextFieldFormatter : NSObject

// Some (extra) helpers...
+(NSString *)generateUUID;
+(NSUUID *)proximityUUIDFromUUID:(id)UUID;
+(BOOL)isValidProximityUUID:(NSString *)proximityUUID;

// Usage methods
+(void)storeValuesInTextField:(UITextField *)textField;
+(void)formatTextField:(UITextField *)textField;

@end
