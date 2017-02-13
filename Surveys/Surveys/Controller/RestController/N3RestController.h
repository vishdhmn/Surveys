//
//  N3RestController.h
//  Surveys
//
//  Created by Vishal Dhiman on 12/02/17.
//  Copyright © 2017 Vishal Dhiman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface N3RestController : NSObject

+(void)fetchSurveysForPage:(int) page;
+(void)fetchNewOauthToken;

@end
