//
//  AuthData.h
//
//  Created by Vishal Dhiman on 16/02/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface AuthData : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double createdAt;
@property (nonatomic, strong) NSString *tokenType;
@property (nonatomic, assign) double expiresIn;
@property (nonatomic, strong) NSString *accessToken;

+ (AuthData *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
