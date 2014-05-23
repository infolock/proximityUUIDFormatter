//
//  proximityUUIDTextFieldFormatter.h
//  estimoteTraining
//
//  Created by Jonathon Hibbard on 5/23/14.
//  Copyright (c) 2014 DataOCD. All rights reserved.
//



@interface proximityUUIDTextFieldFormatter : NSObject

+(BOOL)isValidProximityUUID:(NSString *)proximityUUID;
+(void)storeValuesInTextField:(UITextField *)textField;
+(void)formatTextField:(UITextField *)textField;

@end
