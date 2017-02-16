//
//  AuthData.m
//
//  Created by Vishal Dhiman on 16/02/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "AuthData.h"


NSString *const kAuthDataCreatedAt = @"created_at";
NSString *const kAuthDataTokenType = @"token_type";
NSString *const kAuthDataExpiresIn = @"expires_in";
NSString *const kAuthDataAccessToken = @"access_token";


@interface AuthData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation AuthData

@synthesize createdAt = _createdAt;
@synthesize tokenType = _tokenType;
@synthesize expiresIn = _expiresIn;
@synthesize accessToken = _accessToken;


+ (AuthData *)modelObjectWithDictionary:(NSDictionary *)dict
{
    AuthData *instance = [[AuthData alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.createdAt = [[self objectOrNilForKey:kAuthDataCreatedAt fromDictionary:dict] doubleValue];
            self.tokenType = [self objectOrNilForKey:kAuthDataTokenType fromDictionary:dict];
            self.expiresIn = [[self objectOrNilForKey:kAuthDataExpiresIn fromDictionary:dict] doubleValue];
            self.accessToken = [self objectOrNilForKey:kAuthDataAccessToken fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createdAt] forKey:kAuthDataCreatedAt];
    [mutableDict setValue:self.tokenType forKey:kAuthDataTokenType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.expiresIn] forKey:kAuthDataExpiresIn];
    [mutableDict setValue:self.accessToken forKey:kAuthDataAccessToken];

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

    self.createdAt = [aDecoder decodeDoubleForKey:kAuthDataCreatedAt];
    self.tokenType = [aDecoder decodeObjectForKey:kAuthDataTokenType];
    self.expiresIn = [aDecoder decodeDoubleForKey:kAuthDataExpiresIn];
    self.accessToken = [aDecoder decodeObjectForKey:kAuthDataAccessToken];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_createdAt forKey:kAuthDataCreatedAt];
    [aCoder encodeObject:_tokenType forKey:kAuthDataTokenType];
    [aCoder encodeDouble:_expiresIn forKey:kAuthDataExpiresIn];
    [aCoder encodeObject:_accessToken forKey:kAuthDataAccessToken];
}

- (id)copyWithZone:(NSZone *)zone
{
    AuthData *copy = [[AuthData alloc] init];
    
    if (copy) {

        copy.createdAt = self.createdAt;
        copy.tokenType = [self.tokenType copyWithZone:zone];
        copy.expiresIn = self.expiresIn;
        copy.accessToken = [self.accessToken copyWithZone:zone];
    }
    
    return copy;
}


@end
