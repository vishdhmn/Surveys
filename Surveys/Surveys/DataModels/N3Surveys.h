//
//  N3Surveys.h
//
//  Created by Vishal Dhiman on 12/02/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class N3Theme;

@interface N3Surveys : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *coverImageUrl;
@property (nonatomic, strong) NSArray *languageList;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *tagList;
@property (nonatomic, assign) BOOL isAccessCodeValidRequired;
@property (nonatomic, strong) id coverBackgroundColor;
@property (nonatomic, assign) BOOL isAccessCodeRequired;
@property (nonatomic, strong) NSString *shortUrl;
@property (nonatomic, strong) NSString *thankEmailAboveThreshold;
@property (nonatomic, assign) double surveyVersion;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSArray *questions;
@property (nonatomic, strong) NSString *internalBaseClassIdentifier;
@property (nonatomic, strong) NSString *defaultLanguage;
@property (nonatomic, assign) BOOL isActive;
@property (nonatomic, strong) NSString *activeAt;
@property (nonatomic, strong) id accessCodePrompt;
@property (nonatomic, strong) NSString *accessCodeValidation;
@property (nonatomic, strong) NSString *footerContent;
@property (nonatomic, strong) N3Theme *theme;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, strong) NSString *thankEmailBelowThreshold;
@property (nonatomic, strong) id inactiveAt;
@property (nonatomic, strong) NSString *internalBaseClassDescription;

+ (N3Surveys *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
