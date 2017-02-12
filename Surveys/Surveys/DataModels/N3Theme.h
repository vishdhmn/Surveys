//
//  N3Theme.h
//
//  Created by Vishal Dhiman on 12/02/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface N3Theme : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *colorInactive;
@property (nonatomic, strong) NSString *colorQuestion;
@property (nonatomic, strong) NSString *colorAnswerNormal;
@property (nonatomic, strong) NSString *colorAnswerInactive;
@property (nonatomic, strong) NSString *colorActive;

+ (N3Theme *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
