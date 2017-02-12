//
//  N3Answers.h
//
//  Created by Vishal Dhiman on 12/02/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface N3Answers : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) id weight;
@property (nonatomic, assign) BOOL isCustomerFirstName;
@property (nonatomic, assign) BOOL isCustomerLastName;
@property (nonatomic, strong) NSArray *alerts;
@property (nonatomic, assign) double score;
@property (nonatomic, assign) BOOL isCustomerTitle;
@property (nonatomic, strong) NSString *shortText;
@property (nonatomic, strong) id defaultValue;
@property (nonatomic, strong) NSString *questionId;
@property (nonatomic, strong) NSString *answersIdentifier;
@property (nonatomic, assign) BOOL isCustomerEmail;
@property (nonatomic, strong) NSString *displayType;
@property (nonatomic, assign) BOOL isMandatory;
@property (nonatomic, strong) id referenceIdentifier;
@property (nonatomic, strong) id dateConstraint;
@property (nonatomic, strong) id inputMask;
@property (nonatomic, strong) NSString *responseClass;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) id helpText;
@property (nonatomic, strong) id inputMaskPlaceholder;
@property (nonatomic, assign) BOOL promptCustomAnswer;
@property (nonatomic, assign) double displayOrder;

+ (N3Answers *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
