//
//  N3Answers.m
//
//  Created by Vishal Dhiman on 12/02/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "N3Answers.h"


NSString *const kN3AnswersWeight = @"weight";
NSString *const kN3AnswersIsCustomerFirstName = @"is_customer_first_name";
NSString *const kN3AnswersIsCustomerLastName = @"is_customer_last_name";
NSString *const kN3AnswersAlerts = @"alerts";
NSString *const kN3AnswersScore = @"score";
NSString *const kN3AnswersIsCustomerTitle = @"is_customer_title";
NSString *const kN3AnswersShortText = @"short_text";
NSString *const kN3AnswersDefaultValue = @"default_value";
NSString *const kN3AnswersQuestionId = @"question_id";
NSString *const kN3AnswersId = @"id";
NSString *const kN3AnswersIsCustomerEmail = @"is_customer_email";
NSString *const kN3AnswersDisplayType = @"display_type";
NSString *const kN3AnswersIsMandatory = @"is_mandatory";
NSString *const kN3AnswersReferenceIdentifier = @"reference_identifier";
NSString *const kN3AnswersDateConstraint = @"date_constraint";
NSString *const kN3AnswersInputMask = @"input_mask";
NSString *const kN3AnswersResponseClass = @"response_class";
NSString *const kN3AnswersText = @"text";
NSString *const kN3AnswersHelpText = @"help_text";
NSString *const kN3AnswersInputMaskPlaceholder = @"input_mask_placeholder";
NSString *const kN3AnswersPromptCustomAnswer = @"prompt_custom_answer";
NSString *const kN3AnswersDisplayOrder = @"display_order";


@interface N3Answers ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation N3Answers

@synthesize weight = _weight;
@synthesize isCustomerFirstName = _isCustomerFirstName;
@synthesize isCustomerLastName = _isCustomerLastName;
@synthesize alerts = _alerts;
@synthesize score = _score;
@synthesize isCustomerTitle = _isCustomerTitle;
@synthesize shortText = _shortText;
@synthesize defaultValue = _defaultValue;
@synthesize questionId = _questionId;
@synthesize answersIdentifier = _answersIdentifier;
@synthesize isCustomerEmail = _isCustomerEmail;
@synthesize displayType = _displayType;
@synthesize isMandatory = _isMandatory;
@synthesize referenceIdentifier = _referenceIdentifier;
@synthesize dateConstraint = _dateConstraint;
@synthesize inputMask = _inputMask;
@synthesize responseClass = _responseClass;
@synthesize text = _text;
@synthesize helpText = _helpText;
@synthesize inputMaskPlaceholder = _inputMaskPlaceholder;
@synthesize promptCustomAnswer = _promptCustomAnswer;
@synthesize displayOrder = _displayOrder;


+ (N3Answers *)modelObjectWithDictionary:(NSDictionary *)dict
{
    N3Answers *instance = [[N3Answers alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.weight = [self objectOrNilForKey:kN3AnswersWeight fromDictionary:dict];
            self.isCustomerFirstName = [[self objectOrNilForKey:kN3AnswersIsCustomerFirstName fromDictionary:dict] boolValue];
            self.isCustomerLastName = [[self objectOrNilForKey:kN3AnswersIsCustomerLastName fromDictionary:dict] boolValue];
            self.alerts = [self objectOrNilForKey:kN3AnswersAlerts fromDictionary:dict];
            self.score = [[self objectOrNilForKey:kN3AnswersScore fromDictionary:dict] doubleValue];
            self.isCustomerTitle = [[self objectOrNilForKey:kN3AnswersIsCustomerTitle fromDictionary:dict] boolValue];
            self.shortText = [self objectOrNilForKey:kN3AnswersShortText fromDictionary:dict];
            self.defaultValue = [self objectOrNilForKey:kN3AnswersDefaultValue fromDictionary:dict];
            self.questionId = [self objectOrNilForKey:kN3AnswersQuestionId fromDictionary:dict];
            self.answersIdentifier = [self objectOrNilForKey:kN3AnswersId fromDictionary:dict];
            self.isCustomerEmail = [[self objectOrNilForKey:kN3AnswersIsCustomerEmail fromDictionary:dict] boolValue];
            self.displayType = [self objectOrNilForKey:kN3AnswersDisplayType fromDictionary:dict];
            self.isMandatory = [[self objectOrNilForKey:kN3AnswersIsMandatory fromDictionary:dict] boolValue];
            self.referenceIdentifier = [self objectOrNilForKey:kN3AnswersReferenceIdentifier fromDictionary:dict];
            self.dateConstraint = [self objectOrNilForKey:kN3AnswersDateConstraint fromDictionary:dict];
            self.inputMask = [self objectOrNilForKey:kN3AnswersInputMask fromDictionary:dict];
            self.responseClass = [self objectOrNilForKey:kN3AnswersResponseClass fromDictionary:dict];
            self.text = [self objectOrNilForKey:kN3AnswersText fromDictionary:dict];
            self.helpText = [self objectOrNilForKey:kN3AnswersHelpText fromDictionary:dict];
            self.inputMaskPlaceholder = [self objectOrNilForKey:kN3AnswersInputMaskPlaceholder fromDictionary:dict];
            self.promptCustomAnswer = [[self objectOrNilForKey:kN3AnswersPromptCustomAnswer fromDictionary:dict] boolValue];
            self.displayOrder = [[self objectOrNilForKey:kN3AnswersDisplayOrder fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.weight forKey:kN3AnswersWeight];
    [mutableDict setValue:[NSNumber numberWithBool:self.isCustomerFirstName] forKey:kN3AnswersIsCustomerFirstName];
    [mutableDict setValue:[NSNumber numberWithBool:self.isCustomerLastName] forKey:kN3AnswersIsCustomerLastName];
NSMutableArray *tempArrayForAlerts = [NSMutableArray array];
    for (NSObject *subArrayObject in self.alerts) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForAlerts addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForAlerts addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForAlerts] forKey:@"kN3AnswersAlerts"];
    [mutableDict setValue:[NSNumber numberWithDouble:self.score] forKey:kN3AnswersScore];
    [mutableDict setValue:[NSNumber numberWithBool:self.isCustomerTitle] forKey:kN3AnswersIsCustomerTitle];
    [mutableDict setValue:self.shortText forKey:kN3AnswersShortText];
    [mutableDict setValue:self.defaultValue forKey:kN3AnswersDefaultValue];
    [mutableDict setValue:self.questionId forKey:kN3AnswersQuestionId];
    [mutableDict setValue:self.answersIdentifier forKey:kN3AnswersId];
    [mutableDict setValue:[NSNumber numberWithBool:self.isCustomerEmail] forKey:kN3AnswersIsCustomerEmail];
    [mutableDict setValue:self.displayType forKey:kN3AnswersDisplayType];
    [mutableDict setValue:[NSNumber numberWithBool:self.isMandatory] forKey:kN3AnswersIsMandatory];
    [mutableDict setValue:self.referenceIdentifier forKey:kN3AnswersReferenceIdentifier];
    [mutableDict setValue:self.dateConstraint forKey:kN3AnswersDateConstraint];
    [mutableDict setValue:self.inputMask forKey:kN3AnswersInputMask];
    [mutableDict setValue:self.responseClass forKey:kN3AnswersResponseClass];
    [mutableDict setValue:self.text forKey:kN3AnswersText];
    [mutableDict setValue:self.helpText forKey:kN3AnswersHelpText];
    [mutableDict setValue:self.inputMaskPlaceholder forKey:kN3AnswersInputMaskPlaceholder];
    [mutableDict setValue:[NSNumber numberWithBool:self.promptCustomAnswer] forKey:kN3AnswersPromptCustomAnswer];
    [mutableDict setValue:[NSNumber numberWithDouble:self.displayOrder] forKey:kN3AnswersDisplayOrder];

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

    self.weight = [aDecoder decodeObjectForKey:kN3AnswersWeight];
    self.isCustomerFirstName = [aDecoder decodeBoolForKey:kN3AnswersIsCustomerFirstName];
    self.isCustomerLastName = [aDecoder decodeBoolForKey:kN3AnswersIsCustomerLastName];
    self.alerts = [aDecoder decodeObjectForKey:kN3AnswersAlerts];
    self.score = [aDecoder decodeDoubleForKey:kN3AnswersScore];
    self.isCustomerTitle = [aDecoder decodeBoolForKey:kN3AnswersIsCustomerTitle];
    self.shortText = [aDecoder decodeObjectForKey:kN3AnswersShortText];
    self.defaultValue = [aDecoder decodeObjectForKey:kN3AnswersDefaultValue];
    self.questionId = [aDecoder decodeObjectForKey:kN3AnswersQuestionId];
    self.answersIdentifier = [aDecoder decodeObjectForKey:kN3AnswersId];
    self.isCustomerEmail = [aDecoder decodeBoolForKey:kN3AnswersIsCustomerEmail];
    self.displayType = [aDecoder decodeObjectForKey:kN3AnswersDisplayType];
    self.isMandatory = [aDecoder decodeBoolForKey:kN3AnswersIsMandatory];
    self.referenceIdentifier = [aDecoder decodeObjectForKey:kN3AnswersReferenceIdentifier];
    self.dateConstraint = [aDecoder decodeObjectForKey:kN3AnswersDateConstraint];
    self.inputMask = [aDecoder decodeObjectForKey:kN3AnswersInputMask];
    self.responseClass = [aDecoder decodeObjectForKey:kN3AnswersResponseClass];
    self.text = [aDecoder decodeObjectForKey:kN3AnswersText];
    self.helpText = [aDecoder decodeObjectForKey:kN3AnswersHelpText];
    self.inputMaskPlaceholder = [aDecoder decodeObjectForKey:kN3AnswersInputMaskPlaceholder];
    self.promptCustomAnswer = [aDecoder decodeBoolForKey:kN3AnswersPromptCustomAnswer];
    self.displayOrder = [aDecoder decodeDoubleForKey:kN3AnswersDisplayOrder];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_weight forKey:kN3AnswersWeight];
    [aCoder encodeBool:_isCustomerFirstName forKey:kN3AnswersIsCustomerFirstName];
    [aCoder encodeBool:_isCustomerLastName forKey:kN3AnswersIsCustomerLastName];
    [aCoder encodeObject:_alerts forKey:kN3AnswersAlerts];
    [aCoder encodeDouble:_score forKey:kN3AnswersScore];
    [aCoder encodeBool:_isCustomerTitle forKey:kN3AnswersIsCustomerTitle];
    [aCoder encodeObject:_shortText forKey:kN3AnswersShortText];
    [aCoder encodeObject:_defaultValue forKey:kN3AnswersDefaultValue];
    [aCoder encodeObject:_questionId forKey:kN3AnswersQuestionId];
    [aCoder encodeObject:_answersIdentifier forKey:kN3AnswersId];
    [aCoder encodeBool:_isCustomerEmail forKey:kN3AnswersIsCustomerEmail];
    [aCoder encodeObject:_displayType forKey:kN3AnswersDisplayType];
    [aCoder encodeBool:_isMandatory forKey:kN3AnswersIsMandatory];
    [aCoder encodeObject:_referenceIdentifier forKey:kN3AnswersReferenceIdentifier];
    [aCoder encodeObject:_dateConstraint forKey:kN3AnswersDateConstraint];
    [aCoder encodeObject:_inputMask forKey:kN3AnswersInputMask];
    [aCoder encodeObject:_responseClass forKey:kN3AnswersResponseClass];
    [aCoder encodeObject:_text forKey:kN3AnswersText];
    [aCoder encodeObject:_helpText forKey:kN3AnswersHelpText];
    [aCoder encodeObject:_inputMaskPlaceholder forKey:kN3AnswersInputMaskPlaceholder];
    [aCoder encodeBool:_promptCustomAnswer forKey:kN3AnswersPromptCustomAnswer];
    [aCoder encodeDouble:_displayOrder forKey:kN3AnswersDisplayOrder];
}

- (id)copyWithZone:(NSZone *)zone
{
    N3Answers *copy = [[N3Answers alloc] init];
    
    if (copy) {

        copy.weight = [self.weight copyWithZone:zone];
        copy.isCustomerFirstName = self.isCustomerFirstName;
        copy.isCustomerLastName = self.isCustomerLastName;
        copy.alerts = [self.alerts copyWithZone:zone];
        copy.score = self.score;
        copy.isCustomerTitle = self.isCustomerTitle;
        copy.shortText = [self.shortText copyWithZone:zone];
        copy.defaultValue = [self.defaultValue copyWithZone:zone];
        copy.questionId = [self.questionId copyWithZone:zone];
        copy.answersIdentifier = [self.answersIdentifier copyWithZone:zone];
        copy.isCustomerEmail = self.isCustomerEmail;
        copy.displayType = [self.displayType copyWithZone:zone];
        copy.isMandatory = self.isMandatory;
        copy.referenceIdentifier = [self.referenceIdentifier copyWithZone:zone];
        copy.dateConstraint = [self.dateConstraint copyWithZone:zone];
        copy.inputMask = [self.inputMask copyWithZone:zone];
        copy.responseClass = [self.responseClass copyWithZone:zone];
        copy.text = [self.text copyWithZone:zone];
        copy.helpText = [self.helpText copyWithZone:zone];
        copy.inputMaskPlaceholder = [self.inputMaskPlaceholder copyWithZone:zone];
        copy.promptCustomAnswer = self.promptCustomAnswer;
        copy.displayOrder = self.displayOrder;
    }
    
    return copy;
}


@end
