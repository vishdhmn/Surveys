//
//  N3Dependency.h
//
//  Created by Vishal Dhiman on 12/02/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface N3Dependency : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *rule;
@property (nonatomic, assign) double dependencyIdentifier;
@property (nonatomic, strong) NSString *questionId;
@property (nonatomic, strong) NSArray *dependencyConditions;

+ (N3Dependency *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
