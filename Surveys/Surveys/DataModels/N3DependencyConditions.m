//
//  N3DependencyConditions.m
//
//  Created by Vishal Dhiman on 12/02/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "N3DependencyConditions.h"


NSString *const kN3DependencyConditionsId = @"id";
NSString *const kN3DependencyConditionsUnit = @"unit";
NSString *const kN3DependencyConditionsIntegerValue = @"integer_value";
NSString *const kN3DependencyConditionsAnswerId = @"answer_id";
NSString *const kN3DependencyConditionsRuleKey = @"rule_key";
NSString *const kN3DependencyConditionsFloatValue = @"float_value";
NSString *const kN3DependencyConditionsTextValue = @"text_value";
NSString *const kN3DependencyConditionsOperator = @"operator";
NSString *const kN3DependencyConditionsDependencyId = @"dependency_id";
NSString *const kN3DependencyConditionsDatetimeValue = @"datetime_value";
NSString *const kN3DependencyConditionsStringValue = @"string_value";
NSString *const kN3DependencyConditionsQuestionId = @"question_id";
NSString *const kN3DependencyConditionsResponseOther = @"response_other";


@interface N3DependencyConditions ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation N3DependencyConditions

@synthesize dependencyConditionsIdentifier = _dependencyConditionsIdentifier;
@synthesize unit = _unit;
@synthesize integerValue = _integerValue;
@synthesize answerId = _answerId;
@synthesize ruleKey = _ruleKey;
@synthesize floatValue = _floatValue;
@synthesize textValue = _textValue;
@synthesize operator = _operator;
@synthesize dependencyId = _dependencyId;
@synthesize datetimeValue = _datetimeValue;
@synthesize stringValue = _stringValue;
@synthesize questionId = _questionId;
@synthesize responseOther = _responseOther;


+ (N3DependencyConditions *)modelObjectWithDictionary:(NSDictionary *)dict
{
    N3DependencyConditions *instance = [[N3DependencyConditions alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.dependencyConditionsIdentifier = [[self objectOrNilForKey:kN3DependencyConditionsId fromDictionary:dict] doubleValue];
            self.unit = [self objectOrNilForKey:kN3DependencyConditionsUnit fromDictionary:dict];
            self.integerValue = [self objectOrNilForKey:kN3DependencyConditionsIntegerValue fromDictionary:dict];
            self.answerId = [self objectOrNilForKey:kN3DependencyConditionsAnswerId fromDictionary:dict];
            self.ruleKey = [self objectOrNilForKey:kN3DependencyConditionsRuleKey fromDictionary:dict];
            self.floatValue = [self objectOrNilForKey:kN3DependencyConditionsFloatValue fromDictionary:dict];
            self.textValue = [self objectOrNilForKey:kN3DependencyConditionsTextValue fromDictionary:dict];
            self.operator = [self objectOrNilForKey:kN3DependencyConditionsOperator fromDictionary:dict];
            self.dependencyId = [[self objectOrNilForKey:kN3DependencyConditionsDependencyId fromDictionary:dict] doubleValue];
            self.datetimeValue = [self objectOrNilForKey:kN3DependencyConditionsDatetimeValue fromDictionary:dict];
            self.stringValue = [self objectOrNilForKey:kN3DependencyConditionsStringValue fromDictionary:dict];
            self.questionId = [self objectOrNilForKey:kN3DependencyConditionsQuestionId fromDictionary:dict];
            self.responseOther = [self objectOrNilForKey:kN3DependencyConditionsResponseOther fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dependencyConditionsIdentifier] forKey:kN3DependencyConditionsId];
    [mutableDict setValue:self.unit forKey:kN3DependencyConditionsUnit];
    [mutableDict setValue:self.integerValue forKey:kN3DependencyConditionsIntegerValue];
    [mutableDict setValue:self.answerId forKey:kN3DependencyConditionsAnswerId];
    [mutableDict setValue:self.ruleKey forKey:kN3DependencyConditionsRuleKey];
    [mutableDict setValue:self.floatValue forKey:kN3DependencyConditionsFloatValue];
    [mutableDict setValue:self.textValue forKey:kN3DependencyConditionsTextValue];
    [mutableDict setValue:self.operator forKey:kN3DependencyConditionsOperator];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dependencyId] forKey:kN3DependencyConditionsDependencyId];
    [mutableDict setValue:self.datetimeValue forKey:kN3DependencyConditionsDatetimeValue];
    [mutableDict setValue:self.stringValue forKey:kN3DependencyConditionsStringValue];
    [mutableDict setValue:self.questionId forKey:kN3DependencyConditionsQuestionId];
    [mutableDict setValue:self.responseOther forKey:kN3DependencyConditionsResponseOther];

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

    self.dependencyConditionsIdentifier = [aDecoder decodeDoubleForKey:kN3DependencyConditionsId];
    self.unit = [aDecoder decodeObjectForKey:kN3DependencyConditionsUnit];
    self.integerValue = [aDecoder decodeObjectForKey:kN3DependencyConditionsIntegerValue];
    self.answerId = [aDecoder decodeObjectForKey:kN3DependencyConditionsAnswerId];
    self.ruleKey = [aDecoder decodeObjectForKey:kN3DependencyConditionsRuleKey];
    self.floatValue = [aDecoder decodeObjectForKey:kN3DependencyConditionsFloatValue];
    self.textValue = [aDecoder decodeObjectForKey:kN3DependencyConditionsTextValue];
    self.operator = [aDecoder decodeObjectForKey:kN3DependencyConditionsOperator];
    self.dependencyId = [aDecoder decodeDoubleForKey:kN3DependencyConditionsDependencyId];
    self.datetimeValue = [aDecoder decodeObjectForKey:kN3DependencyConditionsDatetimeValue];
    self.stringValue = [aDecoder decodeObjectForKey:kN3DependencyConditionsStringValue];
    self.questionId = [aDecoder decodeObjectForKey:kN3DependencyConditionsQuestionId];
    self.responseOther = [aDecoder decodeObjectForKey:kN3DependencyConditionsResponseOther];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_dependencyConditionsIdentifier forKey:kN3DependencyConditionsId];
    [aCoder encodeObject:_unit forKey:kN3DependencyConditionsUnit];
    [aCoder encodeObject:_integerValue forKey:kN3DependencyConditionsIntegerValue];
    [aCoder encodeObject:_answerId forKey:kN3DependencyConditionsAnswerId];
    [aCoder encodeObject:_ruleKey forKey:kN3DependencyConditionsRuleKey];
    [aCoder encodeObject:_floatValue forKey:kN3DependencyConditionsFloatValue];
    [aCoder encodeObject:_textValue forKey:kN3DependencyConditionsTextValue];
    [aCoder encodeObject:_operator forKey:kN3DependencyConditionsOperator];
    [aCoder encodeDouble:_dependencyId forKey:kN3DependencyConditionsDependencyId];
    [aCoder encodeObject:_datetimeValue forKey:kN3DependencyConditionsDatetimeValue];
    [aCoder encodeObject:_stringValue forKey:kN3DependencyConditionsStringValue];
    [aCoder encodeObject:_questionId forKey:kN3DependencyConditionsQuestionId];
    [aCoder encodeObject:_responseOther forKey:kN3DependencyConditionsResponseOther];
}

- (id)copyWithZone:(NSZone *)zone
{
    N3DependencyConditions *copy = [[N3DependencyConditions alloc] init];
    
    if (copy) {

        copy.dependencyConditionsIdentifier = self.dependencyConditionsIdentifier;
        copy.unit = [self.unit copyWithZone:zone];
        copy.integerValue = [self.integerValue copyWithZone:zone];
        copy.answerId = [self.answerId copyWithZone:zone];
        copy.ruleKey = [self.ruleKey copyWithZone:zone];
        copy.floatValue = [self.floatValue copyWithZone:zone];
        copy.textValue = [self.textValue copyWithZone:zone];
        copy.operator = [self.operator copyWithZone:zone];
        copy.dependencyId = self.dependencyId;
        copy.datetimeValue = [self.datetimeValue copyWithZone:zone];
        copy.stringValue = [self.stringValue copyWithZone:zone];
        copy.questionId = [self.questionId copyWithZone:zone];
        copy.responseOther = [self.responseOther copyWithZone:zone];
    }
    
    return copy;
}


@end
