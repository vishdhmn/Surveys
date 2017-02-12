//
//  N3Theme.m
//
//  Created by Vishal Dhiman on 12/02/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "N3Theme.h"


NSString *const kN3ThemeColorInactive = @"color_inactive";
NSString *const kN3ThemeColorQuestion = @"color_question";
NSString *const kN3ThemeColorAnswerNormal = @"color_answer_normal";
NSString *const kN3ThemeColorAnswerInactive = @"color_answer_inactive";
NSString *const kN3ThemeColorActive = @"color_active";


@interface N3Theme ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation N3Theme

@synthesize colorInactive = _colorInactive;
@synthesize colorQuestion = _colorQuestion;
@synthesize colorAnswerNormal = _colorAnswerNormal;
@synthesize colorAnswerInactive = _colorAnswerInactive;
@synthesize colorActive = _colorActive;


+ (N3Theme *)modelObjectWithDictionary:(NSDictionary *)dict
{
    N3Theme *instance = [[N3Theme alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.colorInactive = [self objectOrNilForKey:kN3ThemeColorInactive fromDictionary:dict];
            self.colorQuestion = [self objectOrNilForKey:kN3ThemeColorQuestion fromDictionary:dict];
            self.colorAnswerNormal = [self objectOrNilForKey:kN3ThemeColorAnswerNormal fromDictionary:dict];
            self.colorAnswerInactive = [self objectOrNilForKey:kN3ThemeColorAnswerInactive fromDictionary:dict];
            self.colorActive = [self objectOrNilForKey:kN3ThemeColorActive fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.colorInactive forKey:kN3ThemeColorInactive];
    [mutableDict setValue:self.colorQuestion forKey:kN3ThemeColorQuestion];
    [mutableDict setValue:self.colorAnswerNormal forKey:kN3ThemeColorAnswerNormal];
    [mutableDict setValue:self.colorAnswerInactive forKey:kN3ThemeColorAnswerInactive];
    [mutableDict setValue:self.colorActive forKey:kN3ThemeColorActive];

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

    self.colorInactive = [aDecoder decodeObjectForKey:kN3ThemeColorInactive];
    self.colorQuestion = [aDecoder decodeObjectForKey:kN3ThemeColorQuestion];
    self.colorAnswerNormal = [aDecoder decodeObjectForKey:kN3ThemeColorAnswerNormal];
    self.colorAnswerInactive = [aDecoder decodeObjectForKey:kN3ThemeColorAnswerInactive];
    self.colorActive = [aDecoder decodeObjectForKey:kN3ThemeColorActive];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_colorInactive forKey:kN3ThemeColorInactive];
    [aCoder encodeObject:_colorQuestion forKey:kN3ThemeColorQuestion];
    [aCoder encodeObject:_colorAnswerNormal forKey:kN3ThemeColorAnswerNormal];
    [aCoder encodeObject:_colorAnswerInactive forKey:kN3ThemeColorAnswerInactive];
    [aCoder encodeObject:_colorActive forKey:kN3ThemeColorActive];
}

- (id)copyWithZone:(NSZone *)zone
{
    N3Theme *copy = [[N3Theme alloc] init];
    
    if (copy) {

        copy.colorInactive = [self.colorInactive copyWithZone:zone];
        copy.colorQuestion = [self.colorQuestion copyWithZone:zone];
        copy.colorAnswerNormal = [self.colorAnswerNormal copyWithZone:zone];
        copy.colorAnswerInactive = [self.colorAnswerInactive copyWithZone:zone];
        copy.colorActive = [self.colorActive copyWithZone:zone];
    }
    
    return copy;
}


@end
