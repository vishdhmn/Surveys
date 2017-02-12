//
//  N3DependencyConditions.h
//
//  Created by Vishal Dhiman on 12/02/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface N3DependencyConditions : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double dependencyConditionsIdentifier;
@property (nonatomic, strong) id unit;
@property (nonatomic, strong) id integerValue;
@property (nonatomic, strong) NSString *answerId;
@property (nonatomic, strong) NSString *ruleKey;
@property (nonatomic, strong) id floatValue;
@property (nonatomic, strong) id textValue;
@property (nonatomic, strong) NSString *operator;
@property (nonatomic, assign) double dependencyId;
@property (nonatomic, strong) id datetimeValue;
@property (nonatomic, strong) id stringValue;
@property (nonatomic, strong) NSString *questionId;
@property (nonatomic, strong) id responseOther;

+ (N3DependencyConditions *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
