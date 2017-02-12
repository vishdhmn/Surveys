//
//  N3Alerts.m
//
//  Created by Vishal Dhiman on 12/02/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "N3Alerts.h"


NSString *const kN3AlertsId = @"id";
NSString *const kN3AlertsRecipient = @"recipient";
NSString *const kN3AlertsAlertType = @"alert_type";
NSString *const kN3AlertsAnswerId = @"answer_id";
NSString *const kN3AlertsIsOnlyBusinessHours = @"is_only_business_hours";


@interface N3Alerts ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation N3Alerts

@synthesize alertsIdentifier = _alertsIdentifier;
@synthesize recipient = _recipient;
@synthesize alertType = _alertType;
@synthesize answerId = _answerId;
@synthesize isOnlyBusinessHours = _isOnlyBusinessHours;


+ (N3Alerts *)modelObjectWithDictionary:(NSDictionary *)dict
{
    N3Alerts *instance = [[N3Alerts alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.alertsIdentifier = [self objectOrNilForKey:kN3AlertsId fromDictionary:dict];
            self.recipient = [self objectOrNilForKey:kN3AlertsRecipient fromDictionary:dict];
            self.alertType = [self objectOrNilForKey:kN3AlertsAlertType fromDictionary:dict];
            self.answerId = [self objectOrNilForKey:kN3AlertsAnswerId fromDictionary:dict];
            self.isOnlyBusinessHours = [[self objectOrNilForKey:kN3AlertsIsOnlyBusinessHours fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.alertsIdentifier forKey:kN3AlertsId];
    [mutableDict setValue:self.recipient forKey:kN3AlertsRecipient];
    [mutableDict setValue:self.alertType forKey:kN3AlertsAlertType];
    [mutableDict setValue:self.answerId forKey:kN3AlertsAnswerId];
    [mutableDict setValue:[NSNumber numberWithBool:self.isOnlyBusinessHours] forKey:kN3AlertsIsOnlyBusinessHours];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.alertsIdentifier = [aDecoder decodeObjectForKey:kN3AlertsId];
    self.recipient = [aDecoder decodeObjectForKey:kN3AlertsRecipient];
    self.alertType = [aDecoder decodeObjectForKey:kN3AlertsAlertType];
    self.answerId = [aDecoder decodeObjectForKey:kN3AlertsAnswerId];
    self.isOnlyBusinessHours = [aDecoder decodeBoolForKey:kN3AlertsIsOnlyBusinessHours];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_alertsIdentifier forKey:kN3AlertsId];
    [aCoder encodeObject:_recipient forKey:kN3AlertsRecipient];
    [aCoder encodeObject:_alertType forKey:kN3AlertsAlertType];
    [aCoder encodeObject:_answerId forKey:kN3AlertsAnswerId];
    [aCoder encodeBool:_isOnlyBusinessHours forKey:kN3AlertsIsOnlyBusinessHours];
}

- (id)copyWithZone:(NSZone *)zone
{
    N3Alerts *copy = [[N3Alerts alloc] init];
    
    if (copy) {

        copy.alertsIdentifier = [self.alertsIdentifier copyWithZone:zone];
        copy.recipient = [self.recipient copyWithZone:zone];
        copy.alertType = [self.alertType copyWithZone:zone];
        copy.answerId = [self.answerId copyWithZone:zone];
        copy.isOnlyBusinessHours = self.isOnlyBusinessHours;
    }
    
    return copy;
}


@end
