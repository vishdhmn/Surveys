//
//  N3Alerts.h
//
//  Created by Vishal Dhiman on 12/02/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface N3Alerts : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *alertsIdentifier;
@property (nonatomic, strong) NSString *recipient;
@property (nonatomic, strong) NSString *alertType;
@property (nonatomic, strong) NSString *answerId;
@property (nonatomic, assign) BOOL isOnlyBusinessHours;

+ (N3Alerts *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
