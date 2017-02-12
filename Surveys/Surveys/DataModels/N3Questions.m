//
//  N3Questions.m
//
//  Created by Vishal Dhiman on 12/02/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "N3Questions.h"
#import "N3Dependency.h"


NSString *const kN3QuestionsCoverImageUrl = @"cover_image_url";
NSString *const kN3QuestionsFacebookProfile = @"facebook_profile";
NSString *const kN3QuestionsCoverImageOpacity = @"cover_image_opacity";
NSString *const kN3QuestionsCorrectAnswerId = @"correct_answer_id";
NSString *const kN3QuestionsTagList = @"tag_list";
NSString *const kN3QuestionsCoverBackgroundColor = @"cover_background_color";
NSString *const kN3QuestionsShortText = @"short_text";
NSString *const kN3QuestionsAnswers = @"answers";
NSString *const kN3QuestionsPick = @"pick";
NSString *const kN3QuestionsId = @"id";
NSString *const kN3QuestionsDisplayType = @"display_type";
NSString *const kN3QuestionsDependency = @"dependency";
NSString *const kN3QuestionsIsMandatory = @"is_mandatory";
NSString *const kN3QuestionsIsShareableOnTwitter = @"is_shareable_on_twitter";
NSString *const kN3QuestionsHelpText = @"help_text";
NSString *const kN3QuestionsText = @"text";
NSString *const kN3QuestionsFontSize = @"font_size";
NSString *const kN3QuestionsTwitterProfile = @"twitter_profile";
NSString *const kN3QuestionsDisplayOrder = @"display_order";
NSString *const kN3QuestionsFontFace = @"font_face";
NSString *const kN3QuestionsIsShareableOnFacebook = @"is_shareable_on_facebook";
NSString *const kN3QuestionsImageUrl = @"image_url";


@interface N3Questions ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation N3Questions

@synthesize coverImageUrl = _coverImageUrl;
@synthesize facebookProfile = _facebookProfile;
@synthesize coverImageOpacity = _coverImageOpacity;
@synthesize correctAnswerId = _correctAnswerId;
@synthesize tagList = _tagList;
@synthesize coverBackgroundColor = _coverBackgroundColor;
@synthesize shortText = _shortText;
@synthesize answers = _answers;
@synthesize pick = _pick;
@synthesize questionsIdentifier = _questionsIdentifier;
@synthesize displayType = _displayType;
@synthesize dependency = _dependency;
@synthesize isMandatory = _isMandatory;
@synthesize isShareableOnTwitter = _isShareableOnTwitter;
@synthesize helpText = _helpText;
@synthesize text = _text;
@synthesize fontSize = _fontSize;
@synthesize twitterProfile = _twitterProfile;
@synthesize displayOrder = _displayOrder;
@synthesize fontFace = _fontFace;
@synthesize isShareableOnFacebook = _isShareableOnFacebook;
@synthesize imageUrl = _imageUrl;


+ (N3Questions *)modelObjectWithDictionary:(NSDictionary *)dict
{
    N3Questions *instance = [[N3Questions alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.coverImageUrl = [self objectOrNilForKey:kN3QuestionsCoverImageUrl fromDictionary:dict];
            self.facebookProfile = [self objectOrNilForKey:kN3QuestionsFacebookProfile fromDictionary:dict];
            self.coverImageOpacity = [[self objectOrNilForKey:kN3QuestionsCoverImageOpacity fromDictionary:dict] doubleValue];
            self.correctAnswerId = [self objectOrNilForKey:kN3QuestionsCorrectAnswerId fromDictionary:dict];
            self.tagList = [self objectOrNilForKey:kN3QuestionsTagList fromDictionary:dict];
            self.coverBackgroundColor = [self objectOrNilForKey:kN3QuestionsCoverBackgroundColor fromDictionary:dict];
            self.shortText = [self objectOrNilForKey:kN3QuestionsShortText fromDictionary:dict];
            self.answers = [self objectOrNilForKey:kN3QuestionsAnswers fromDictionary:dict];
            self.pick = [self objectOrNilForKey:kN3QuestionsPick fromDictionary:dict];
            self.questionsIdentifier = [self objectOrNilForKey:kN3QuestionsId fromDictionary:dict];
            self.displayType = [self objectOrNilForKey:kN3QuestionsDisplayType fromDictionary:dict];
            self.dependency = [N3Dependency modelObjectWithDictionary:[dict objectForKey:kN3QuestionsDependency]];
            self.isMandatory = [[self objectOrNilForKey:kN3QuestionsIsMandatory fromDictionary:dict] boolValue];
            self.isShareableOnTwitter = [[self objectOrNilForKey:kN3QuestionsIsShareableOnTwitter fromDictionary:dict] boolValue];
            self.helpText = [self objectOrNilForKey:kN3QuestionsHelpText fromDictionary:dict];
            self.text = [self objectOrNilForKey:kN3QuestionsText fromDictionary:dict];
            self.fontSize = [self objectOrNilForKey:kN3QuestionsFontSize fromDictionary:dict];
            self.twitterProfile = [self objectOrNilForKey:kN3QuestionsTwitterProfile fromDictionary:dict];
            self.displayOrder = [[self objectOrNilForKey:kN3QuestionsDisplayOrder fromDictionary:dict] doubleValue];
            self.fontFace = [self objectOrNilForKey:kN3QuestionsFontFace fromDictionary:dict];
            self.isShareableOnFacebook = [[self objectOrNilForKey:kN3QuestionsIsShareableOnFacebook fromDictionary:dict] boolValue];
            self.imageUrl = [self objectOrNilForKey:kN3QuestionsImageUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.coverImageUrl forKey:kN3QuestionsCoverImageUrl];
    [mutableDict setValue:self.facebookProfile forKey:kN3QuestionsFacebookProfile];
    [mutableDict setValue:[NSNumber numberWithDouble:self.coverImageOpacity] forKey:kN3QuestionsCoverImageOpacity];
    [mutableDict setValue:self.correctAnswerId forKey:kN3QuestionsCorrectAnswerId];
    [mutableDict setValue:self.tagList forKey:kN3QuestionsTagList];
    [mutableDict setValue:self.coverBackgroundColor forKey:kN3QuestionsCoverBackgroundColor];
    [mutableDict setValue:self.shortText forKey:kN3QuestionsShortText];
NSMutableArray *tempArrayForAnswers = [NSMutableArray array];
    for (NSObject *subArrayObject in self.answers) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForAnswers addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForAnswers addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForAnswers] forKey:@"kN3QuestionsAnswers"];
    [mutableDict setValue:self.pick forKey:kN3QuestionsPick];
    [mutableDict setValue:self.questionsIdentifier forKey:kN3QuestionsId];
    [mutableDict setValue:self.displayType forKey:kN3QuestionsDisplayType];
    [mutableDict setValue:[self.dependency dictionaryRepresentation] forKey:kN3QuestionsDependency];
    [mutableDict setValue:[NSNumber numberWithBool:self.isMandatory] forKey:kN3QuestionsIsMandatory];
    [mutableDict setValue:[NSNumber numberWithBool:self.isShareableOnTwitter] forKey:kN3QuestionsIsShareableOnTwitter];
    [mutableDict setValue:self.helpText forKey:kN3QuestionsHelpText];
    [mutableDict setValue:self.text forKey:kN3QuestionsText];
    [mutableDict setValue:self.fontSize forKey:kN3QuestionsFontSize];
    [mutableDict setValue:self.twitterProfile forKey:kN3QuestionsTwitterProfile];
    [mutableDict setValue:[NSNumber numberWithDouble:self.displayOrder] forKey:kN3QuestionsDisplayOrder];
    [mutableDict setValue:self.fontFace forKey:kN3QuestionsFontFace];
    [mutableDict setValue:[NSNumber numberWithBool:self.isShareableOnFacebook] forKey:kN3QuestionsIsShareableOnFacebook];
    [mutableDict setValue:self.imageUrl forKey:kN3QuestionsImageUrl];

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

    self.coverImageUrl = [aDecoder decodeObjectForKey:kN3QuestionsCoverImageUrl];
    self.facebookProfile = [aDecoder decodeObjectForKey:kN3QuestionsFacebookProfile];
    self.coverImageOpacity = [aDecoder decodeDoubleForKey:kN3QuestionsCoverImageOpacity];
    self.correctAnswerId = [aDecoder decodeObjectForKey:kN3QuestionsCorrectAnswerId];
    self.tagList = [aDecoder decodeObjectForKey:kN3QuestionsTagList];
    self.coverBackgroundColor = [aDecoder decodeObjectForKey:kN3QuestionsCoverBackgroundColor];
    self.shortText = [aDecoder decodeObjectForKey:kN3QuestionsShortText];
    self.answers = [aDecoder decodeObjectForKey:kN3QuestionsAnswers];
    self.pick = [aDecoder decodeObjectForKey:kN3QuestionsPick];
    self.questionsIdentifier = [aDecoder decodeObjectForKey:kN3QuestionsId];
    self.displayType = [aDecoder decodeObjectForKey:kN3QuestionsDisplayType];
    self.dependency = [aDecoder decodeObjectForKey:kN3QuestionsDependency];
    self.isMandatory = [aDecoder decodeBoolForKey:kN3QuestionsIsMandatory];
    self.isShareableOnTwitter = [aDecoder decodeBoolForKey:kN3QuestionsIsShareableOnTwitter];
    self.helpText = [aDecoder decodeObjectForKey:kN3QuestionsHelpText];
    self.text = [aDecoder decodeObjectForKey:kN3QuestionsText];
    self.fontSize = [aDecoder decodeObjectForKey:kN3QuestionsFontSize];
    self.twitterProfile = [aDecoder decodeObjectForKey:kN3QuestionsTwitterProfile];
    self.displayOrder = [aDecoder decodeDoubleForKey:kN3QuestionsDisplayOrder];
    self.fontFace = [aDecoder decodeObjectForKey:kN3QuestionsFontFace];
    self.isShareableOnFacebook = [aDecoder decodeBoolForKey:kN3QuestionsIsShareableOnFacebook];
    self.imageUrl = [aDecoder decodeObjectForKey:kN3QuestionsImageUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_coverImageUrl forKey:kN3QuestionsCoverImageUrl];
    [aCoder encodeObject:_facebookProfile forKey:kN3QuestionsFacebookProfile];
    [aCoder encodeDouble:_coverImageOpacity forKey:kN3QuestionsCoverImageOpacity];
    [aCoder encodeObject:_correctAnswerId forKey:kN3QuestionsCorrectAnswerId];
    [aCoder encodeObject:_tagList forKey:kN3QuestionsTagList];
    [aCoder encodeObject:_coverBackgroundColor forKey:kN3QuestionsCoverBackgroundColor];
    [aCoder encodeObject:_shortText forKey:kN3QuestionsShortText];
    [aCoder encodeObject:_answers forKey:kN3QuestionsAnswers];
    [aCoder encodeObject:_pick forKey:kN3QuestionsPick];
    [aCoder encodeObject:_questionsIdentifier forKey:kN3QuestionsId];
    [aCoder encodeObject:_displayType forKey:kN3QuestionsDisplayType];
    [aCoder encodeObject:_dependency forKey:kN3QuestionsDependency];
    [aCoder encodeBool:_isMandatory forKey:kN3QuestionsIsMandatory];
    [aCoder encodeBool:_isShareableOnTwitter forKey:kN3QuestionsIsShareableOnTwitter];
    [aCoder encodeObject:_helpText forKey:kN3QuestionsHelpText];
    [aCoder encodeObject:_text forKey:kN3QuestionsText];
    [aCoder encodeObject:_fontSize forKey:kN3QuestionsFontSize];
    [aCoder encodeObject:_twitterProfile forKey:kN3QuestionsTwitterProfile];
    [aCoder encodeDouble:_displayOrder forKey:kN3QuestionsDisplayOrder];
    [aCoder encodeObject:_fontFace forKey:kN3QuestionsFontFace];
    [aCoder encodeBool:_isShareableOnFacebook forKey:kN3QuestionsIsShareableOnFacebook];
    [aCoder encodeObject:_imageUrl forKey:kN3QuestionsImageUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    N3Questions *copy = [[N3Questions alloc] init];
    
    if (copy) {

        copy.coverImageUrl = [self.coverImageUrl copyWithZone:zone];
        copy.facebookProfile = [self.facebookProfile copyWithZone:zone];
        copy.coverImageOpacity = self.coverImageOpacity;
        copy.correctAnswerId = [self.correctAnswerId copyWithZone:zone];
        copy.tagList = [self.tagList copyWithZone:zone];
        copy.coverBackgroundColor = [self.coverBackgroundColor copyWithZone:zone];
        copy.shortText = [self.shortText copyWithZone:zone];
        copy.answers = [self.answers copyWithZone:zone];
        copy.pick = [self.pick copyWithZone:zone];
        copy.questionsIdentifier = [self.questionsIdentifier copyWithZone:zone];
        copy.displayType = [self.displayType copyWithZone:zone];
        copy.dependency = [self.dependency copyWithZone:zone];
        copy.isMandatory = self.isMandatory;
        copy.isShareableOnTwitter = self.isShareableOnTwitter;
        copy.helpText = [self.helpText copyWithZone:zone];
        copy.text = [self.text copyWithZone:zone];
        copy.fontSize = [self.fontSize copyWithZone:zone];
        copy.twitterProfile = [self.twitterProfile copyWithZone:zone];
        copy.displayOrder = self.displayOrder;
        copy.fontFace = [self.fontFace copyWithZone:zone];
        copy.isShareableOnFacebook = self.isShareableOnFacebook;
        copy.imageUrl = [self.imageUrl copyWithZone:zone];
    }
    
    return copy;
}


@end
