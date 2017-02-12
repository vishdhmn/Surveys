//
//  N3Dependency.m
//
//  Created by Vishal Dhiman on 12/02/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "N3Dependency.h"
#import "N3DependencyConditions.h"


NSString *const kN3DependencyRule = @"rule";
NSString *const kN3DependencyId = @"id";
NSString *const kN3DependencyQuestionId = @"question_id";
NSString *const kN3DependencyDependencyConditions = @"dependency_conditions";


@interface N3Dependency ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation N3Dependency

@synthesize rule = _rule;
@synthesize dependencyIdentifier = _dependencyIdentifier;
@synthesize questionId = _questionId;
@synthesize dependencyConditions = _dependencyConditions;


+ (N3Dependency *)modelObjectWithDictionary:(NSDictionary *)dict
{
    N3Dependency *instance = [[N3Dependency alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.rule = [self objectOrNilForKey:kN3DependencyRule fromDictionary:dict];
            self.dependencyIdentifier = [[self objectOrNilForKey:kN3DependencyId fromDictionary:dict] doubleValue];
            self.questionId = [self objectOrNilForKey:kN3DependencyQuestionId fromDictionary:dict];
    NSObject *receivedN3DependencyConditions = [dict objectForKey:kN3DependencyDependencyConditions];
    NSMutableArray *parsedN3DependencyConditions = [NSMutableArray array];
    if ([receivedN3DependencyConditions isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedN3DependencyConditions) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedN3DependencyConditions addObject:[N3DependencyConditions modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedN3DependencyConditions isKindOfClass:[NSDictionary class]]) {
       [parsedN3DependencyConditions addObject:[N3DependencyConditions modelObjectWithDictionary:(NSDictionary *)receivedN3DependencyConditions]];
    }

    self.dependencyConditions = [NSArray arrayWithArray:parsedN3DependencyConditions];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.rule forKey:kN3DependencyRule];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dependencyIdentifier] forKey:kN3DependencyId];
    [mutableDict setValue:self.questionId forKey:kN3DependencyQuestionId];
NSMutableArray *tempArrayForDependencyConditions = [NSMutableArray array];
    for (NSObject *subArrayObject in self.dependencyConditions) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForDependencyConditions addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForDependencyConditions addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDependencyConditions] forKey:@"kN3DependencyDependencyConditions"];

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

    self.rule = [aDecoder decodeObjectForKey:kN3DependencyRule];
    self.dependencyIdentifier = [aDecoder decodeDoubleForKey:kN3DependencyId];
    self.questionId = [aDecoder decodeObjectForKey:kN3DependencyQuestionId];
    self.dependencyConditions = [aDecoder decodeObjectForKey:kN3DependencyDependencyConditions];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_rule forKey:kN3DependencyRule];
    [aCoder encodeDouble:_dependencyIdentifier forKey:kN3DependencyId];
    [aCoder encodeObject:_questionId forKey:kN3DependencyQuestionId];
    [aCoder encodeObject:_dependencyConditions forKey:kN3DependencyDependencyConditions];
}

- (id)copyWithZone:(NSZone *)zone
{
    N3Dependency *copy = [[N3Dependency alloc] init];
    
    if (copy) {

        copy.rule = [self.rule copyWithZone:zone];
        copy.dependencyIdentifier = self.dependencyIdentifier;
        copy.questionId = [self.questionId copyWithZone:zone];
        copy.dependencyConditions = [self.dependencyConditions copyWithZone:zone];
    }
    
    return copy;
}


@end
