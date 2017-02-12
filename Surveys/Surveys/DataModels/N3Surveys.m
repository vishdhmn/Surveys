//
//  N3Surveys.m
//
//  Created by Vishal Dhiman on 12/02/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "N3Surveys.h"
#import "N3Questions.h"
#import "N3Theme.h"


NSString *const kN3SurveysCoverImageUrl = @"cover_image_url";
NSString *const kN3SurveysLanguageList = @"language_list";
NSString *const kN3SurveysTitle = @"title";
NSString *const kN3SurveysTagList = @"tag_list";
NSString *const kN3SurveysIsAccessCodeValidRequired = @"is_access_code_valid_required";
NSString *const kN3SurveysCoverBackgroundColor = @"cover_background_color";
NSString *const kN3SurveysIsAccessCodeRequired = @"is_access_code_required";
NSString *const kN3SurveysShortUrl = @"short_url";
NSString *const kN3SurveysThankEmailAboveThreshold = @"thank_email_above_threshold";
NSString *const kN3SurveysSurveyVersion = @"survey_version";
NSString *const kN3SurveysType = @"type";
NSString *const kN3SurveysQuestions = @"questions";
NSString *const kN3SurveysId = @"id";
NSString *const kN3SurveysDefaultLanguage = @"default_language";
NSString *const kN3SurveysIsActive = @"is_active";
NSString *const kN3SurveysActiveAt = @"active_at";
NSString *const kN3SurveysAccessCodePrompt = @"access_code_prompt";
NSString *const kN3SurveysAccessCodeValidation = @"access_code_validation";
NSString *const kN3SurveysFooterContent = @"footer_content";
NSString *const kN3SurveysTheme = @"theme";
NSString *const kN3SurveysCreatedAt = @"created_at";
NSString *const kN3SurveysThankEmailBelowThreshold = @"thank_email_below_threshold";
NSString *const kN3SurveysInactiveAt = @"inactive_at";
NSString *const kN3SurveysDescription = @"description";


@interface N3Surveys ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation N3Surveys

@synthesize coverImageUrl = _coverImageUrl;
@synthesize languageList = _languageList;
@synthesize title = _title;
@synthesize tagList = _tagList;
@synthesize isAccessCodeValidRequired = _isAccessCodeValidRequired;
@synthesize coverBackgroundColor = _coverBackgroundColor;
@synthesize isAccessCodeRequired = _isAccessCodeRequired;
@synthesize shortUrl = _shortUrl;
@synthesize thankEmailAboveThreshold = _thankEmailAboveThreshold;
@synthesize surveyVersion = _surveyVersion;
@synthesize type = _type;
@synthesize questions = _questions;
@synthesize internalBaseClassIdentifier = _internalBaseClassIdentifier;
@synthesize defaultLanguage = _defaultLanguage;
@synthesize isActive = _isActive;
@synthesize activeAt = _activeAt;
@synthesize accessCodePrompt = _accessCodePrompt;
@synthesize accessCodeValidation = _accessCodeValidation;
@synthesize footerContent = _footerContent;
@synthesize theme = _theme;
@synthesize createdAt = _createdAt;
@synthesize thankEmailBelowThreshold = _thankEmailBelowThreshold;
@synthesize inactiveAt = _inactiveAt;
@synthesize internalBaseClassDescription = _internalBaseClassDescription;


+ (N3Surveys *)modelObjectWithDictionary:(NSDictionary *)dict
{
    N3Surveys *instance = [[N3Surveys alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.coverImageUrl = [self objectOrNilForKey:kN3SurveysCoverImageUrl fromDictionary:dict];
            self.languageList = [self objectOrNilForKey:kN3SurveysLanguageList fromDictionary:dict];
            self.title = [self objectOrNilForKey:kN3SurveysTitle fromDictionary:dict];
            self.tagList = [self objectOrNilForKey:kN3SurveysTagList fromDictionary:dict];
            self.isAccessCodeValidRequired = [[self objectOrNilForKey:kN3SurveysIsAccessCodeValidRequired fromDictionary:dict] boolValue];
            self.coverBackgroundColor = [self objectOrNilForKey:kN3SurveysCoverBackgroundColor fromDictionary:dict];
            self.isAccessCodeRequired = [[self objectOrNilForKey:kN3SurveysIsAccessCodeRequired fromDictionary:dict] boolValue];
            self.shortUrl = [self objectOrNilForKey:kN3SurveysShortUrl fromDictionary:dict];
            self.thankEmailAboveThreshold = [self objectOrNilForKey:kN3SurveysThankEmailAboveThreshold fromDictionary:dict];
            self.surveyVersion = [[self objectOrNilForKey:kN3SurveysSurveyVersion fromDictionary:dict] doubleValue];
            self.type = [self objectOrNilForKey:kN3SurveysType fromDictionary:dict];
    NSObject *receivedN3Questions = [dict objectForKey:kN3SurveysQuestions];
    NSMutableArray *parsedN3Questions = [NSMutableArray array];
    if ([receivedN3Questions isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedN3Questions) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedN3Questions addObject:[N3Questions modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedN3Questions isKindOfClass:[NSDictionary class]]) {
       [parsedN3Questions addObject:[N3Questions modelObjectWithDictionary:(NSDictionary *)receivedN3Questions]];
    }

    self.questions = [NSArray arrayWithArray:parsedN3Questions];
            self.internalBaseClassIdentifier = [self objectOrNilForKey:kN3SurveysId fromDictionary:dict];
            self.defaultLanguage = [self objectOrNilForKey:kN3SurveysDefaultLanguage fromDictionary:dict];
            self.isActive = [[self objectOrNilForKey:kN3SurveysIsActive fromDictionary:dict] boolValue];
            self.activeAt = [self objectOrNilForKey:kN3SurveysActiveAt fromDictionary:dict];
            self.accessCodePrompt = [self objectOrNilForKey:kN3SurveysAccessCodePrompt fromDictionary:dict];
            self.accessCodeValidation = [self objectOrNilForKey:kN3SurveysAccessCodeValidation fromDictionary:dict];
            self.footerContent = [self objectOrNilForKey:kN3SurveysFooterContent fromDictionary:dict];
            self.theme = [N3Theme modelObjectWithDictionary:[dict objectForKey:kN3SurveysTheme]];
            self.createdAt = [self objectOrNilForKey:kN3SurveysCreatedAt fromDictionary:dict];
            self.thankEmailBelowThreshold = [self objectOrNilForKey:kN3SurveysThankEmailBelowThreshold fromDictionary:dict];
            self.inactiveAt = [self objectOrNilForKey:kN3SurveysInactiveAt fromDictionary:dict];
            self.internalBaseClassDescription = [self objectOrNilForKey:kN3SurveysDescription fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.coverImageUrl forKey:kN3SurveysCoverImageUrl];
NSMutableArray *tempArrayForLanguageList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.languageList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForLanguageList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForLanguageList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForLanguageList] forKey:@"kN3SurveysLanguageList"];
    [mutableDict setValue:self.title forKey:kN3SurveysTitle];
    [mutableDict setValue:self.tagList forKey:kN3SurveysTagList];
    [mutableDict setValue:[NSNumber numberWithBool:self.isAccessCodeValidRequired] forKey:kN3SurveysIsAccessCodeValidRequired];
    [mutableDict setValue:self.coverBackgroundColor forKey:kN3SurveysCoverBackgroundColor];
    [mutableDict setValue:[NSNumber numberWithBool:self.isAccessCodeRequired] forKey:kN3SurveysIsAccessCodeRequired];
    [mutableDict setValue:self.shortUrl forKey:kN3SurveysShortUrl];
    [mutableDict setValue:self.thankEmailAboveThreshold forKey:kN3SurveysThankEmailAboveThreshold];
    [mutableDict setValue:[NSNumber numberWithDouble:self.surveyVersion] forKey:kN3SurveysSurveyVersion];
    [mutableDict setValue:self.type forKey:kN3SurveysType];
NSMutableArray *tempArrayForQuestions = [NSMutableArray array];
    for (NSObject *subArrayObject in self.questions) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForQuestions addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForQuestions addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForQuestions] forKey:@"kN3SurveysQuestions"];
    [mutableDict setValue:self.internalBaseClassIdentifier forKey:kN3SurveysId];
    [mutableDict setValue:self.defaultLanguage forKey:kN3SurveysDefaultLanguage];
    [mutableDict setValue:[NSNumber numberWithBool:self.isActive] forKey:kN3SurveysIsActive];
    [mutableDict setValue:self.activeAt forKey:kN3SurveysActiveAt];
    [mutableDict setValue:self.accessCodePrompt forKey:kN3SurveysAccessCodePrompt];
    [mutableDict setValue:self.accessCodeValidation forKey:kN3SurveysAccessCodeValidation];
    [mutableDict setValue:self.footerContent forKey:kN3SurveysFooterContent];
    [mutableDict setValue:[self.theme dictionaryRepresentation] forKey:kN3SurveysTheme];
    [mutableDict setValue:self.createdAt forKey:kN3SurveysCreatedAt];
    [mutableDict setValue:self.thankEmailBelowThreshold forKey:kN3SurveysThankEmailBelowThreshold];
    [mutableDict setValue:self.inactiveAt forKey:kN3SurveysInactiveAt];
    [mutableDict setValue:self.internalBaseClassDescription forKey:kN3SurveysDescription];

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

    self.coverImageUrl = [aDecoder decodeObjectForKey:kN3SurveysCoverImageUrl];
    self.languageList = [aDecoder decodeObjectForKey:kN3SurveysLanguageList];
    self.title = [aDecoder decodeObjectForKey:kN3SurveysTitle];
    self.tagList = [aDecoder decodeObjectForKey:kN3SurveysTagList];
    self.isAccessCodeValidRequired = [aDecoder decodeBoolForKey:kN3SurveysIsAccessCodeValidRequired];
    self.coverBackgroundColor = [aDecoder decodeObjectForKey:kN3SurveysCoverBackgroundColor];
    self.isAccessCodeRequired = [aDecoder decodeBoolForKey:kN3SurveysIsAccessCodeRequired];
    self.shortUrl = [aDecoder decodeObjectForKey:kN3SurveysShortUrl];
    self.thankEmailAboveThreshold = [aDecoder decodeObjectForKey:kN3SurveysThankEmailAboveThreshold];
    self.surveyVersion = [aDecoder decodeDoubleForKey:kN3SurveysSurveyVersion];
    self.type = [aDecoder decodeObjectForKey:kN3SurveysType];
    self.questions = [aDecoder decodeObjectForKey:kN3SurveysQuestions];
    self.internalBaseClassIdentifier = [aDecoder decodeObjectForKey:kN3SurveysId];
    self.defaultLanguage = [aDecoder decodeObjectForKey:kN3SurveysDefaultLanguage];
    self.isActive = [aDecoder decodeBoolForKey:kN3SurveysIsActive];
    self.activeAt = [aDecoder decodeObjectForKey:kN3SurveysActiveAt];
    self.accessCodePrompt = [aDecoder decodeObjectForKey:kN3SurveysAccessCodePrompt];
    self.accessCodeValidation = [aDecoder decodeObjectForKey:kN3SurveysAccessCodeValidation];
    self.footerContent = [aDecoder decodeObjectForKey:kN3SurveysFooterContent];
    self.theme = [aDecoder decodeObjectForKey:kN3SurveysTheme];
    self.createdAt = [aDecoder decodeObjectForKey:kN3SurveysCreatedAt];
    self.thankEmailBelowThreshold = [aDecoder decodeObjectForKey:kN3SurveysThankEmailBelowThreshold];
    self.inactiveAt = [aDecoder decodeObjectForKey:kN3SurveysInactiveAt];
    self.internalBaseClassDescription = [aDecoder decodeObjectForKey:kN3SurveysDescription];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_coverImageUrl forKey:kN3SurveysCoverImageUrl];
    [aCoder encodeObject:_languageList forKey:kN3SurveysLanguageList];
    [aCoder encodeObject:_title forKey:kN3SurveysTitle];
    [aCoder encodeObject:_tagList forKey:kN3SurveysTagList];
    [aCoder encodeBool:_isAccessCodeValidRequired forKey:kN3SurveysIsAccessCodeValidRequired];
    [aCoder encodeObject:_coverBackgroundColor forKey:kN3SurveysCoverBackgroundColor];
    [aCoder encodeBool:_isAccessCodeRequired forKey:kN3SurveysIsAccessCodeRequired];
    [aCoder encodeObject:_shortUrl forKey:kN3SurveysShortUrl];
    [aCoder encodeObject:_thankEmailAboveThreshold forKey:kN3SurveysThankEmailAboveThreshold];
    [aCoder encodeDouble:_surveyVersion forKey:kN3SurveysSurveyVersion];
    [aCoder encodeObject:_type forKey:kN3SurveysType];
    [aCoder encodeObject:_questions forKey:kN3SurveysQuestions];
    [aCoder encodeObject:_internalBaseClassIdentifier forKey:kN3SurveysId];
    [aCoder encodeObject:_defaultLanguage forKey:kN3SurveysDefaultLanguage];
    [aCoder encodeBool:_isActive forKey:kN3SurveysIsActive];
    [aCoder encodeObject:_activeAt forKey:kN3SurveysActiveAt];
    [aCoder encodeObject:_accessCodePrompt forKey:kN3SurveysAccessCodePrompt];
    [aCoder encodeObject:_accessCodeValidation forKey:kN3SurveysAccessCodeValidation];
    [aCoder encodeObject:_footerContent forKey:kN3SurveysFooterContent];
    [aCoder encodeObject:_theme forKey:kN3SurveysTheme];
    [aCoder encodeObject:_createdAt forKey:kN3SurveysCreatedAt];
    [aCoder encodeObject:_thankEmailBelowThreshold forKey:kN3SurveysThankEmailBelowThreshold];
    [aCoder encodeObject:_inactiveAt forKey:kN3SurveysInactiveAt];
    [aCoder encodeObject:_internalBaseClassDescription forKey:kN3SurveysDescription];
}

- (id)copyWithZone:(NSZone *)zone
{
    N3Surveys *copy = [[N3Surveys alloc] init];
    
    if (copy) {

        copy.coverImageUrl = [self.coverImageUrl copyWithZone:zone];
        copy.languageList = [self.languageList copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.tagList = [self.tagList copyWithZone:zone];
        copy.isAccessCodeValidRequired = self.isAccessCodeValidRequired;
        copy.coverBackgroundColor = [self.coverBackgroundColor copyWithZone:zone];
        copy.isAccessCodeRequired = self.isAccessCodeRequired;
        copy.shortUrl = [self.shortUrl copyWithZone:zone];
        copy.thankEmailAboveThreshold = [self.thankEmailAboveThreshold copyWithZone:zone];
        copy.surveyVersion = self.surveyVersion;
        copy.type = [self.type copyWithZone:zone];
        copy.questions = [self.questions copyWithZone:zone];
        copy.internalBaseClassIdentifier = [self.internalBaseClassIdentifier copyWithZone:zone];
        copy.defaultLanguage = [self.defaultLanguage copyWithZone:zone];
        copy.isActive = self.isActive;
        copy.activeAt = [self.activeAt copyWithZone:zone];
        copy.accessCodePrompt = [self.accessCodePrompt copyWithZone:zone];
        copy.accessCodeValidation = [self.accessCodeValidation copyWithZone:zone];
        copy.footerContent = [self.footerContent copyWithZone:zone];
        copy.theme = [self.theme copyWithZone:zone];
        copy.createdAt = [self.createdAt copyWithZone:zone];
        copy.thankEmailBelowThreshold = [self.thankEmailBelowThreshold copyWithZone:zone];
        copy.inactiveAt = [self.inactiveAt copyWithZone:zone];
        copy.internalBaseClassDescription = [self.internalBaseClassDescription copyWithZone:zone];
    }
    
    return copy;
}


@end
