//
//  N3Questions.h
//
//  Created by Vishal Dhiman on 12/02/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class N3Dependency;

@interface N3Questions : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *coverImageUrl;
@property (nonatomic, strong) id facebookProfile;
@property (nonatomic, assign) double coverImageOpacity;
@property (nonatomic, strong) id correctAnswerId;
@property (nonatomic, strong) NSString *tagList;
@property (nonatomic, strong) id coverBackgroundColor;
@property (nonatomic, strong) NSString *shortText;
@property (nonatomic, strong) NSArray *answers;
@property (nonatomic, strong) NSString *pick;
@property (nonatomic, strong) NSString *questionsIdentifier;
@property (nonatomic, strong) NSString *displayType;
@property (nonatomic, strong) N3Dependency *dependency;
@property (nonatomic, assign) BOOL isMandatory;
@property (nonatomic, assign) BOOL isShareableOnTwitter;
@property (nonatomic, strong) id helpText;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) id fontSize;
@property (nonatomic, strong) id twitterProfile;
@property (nonatomic, assign) double displayOrder;
@property (nonatomic, strong) id fontFace;
@property (nonatomic, assign) BOOL isShareableOnFacebook;
@property (nonatomic, strong) NSString *imageUrl;

+ (N3Questions *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
