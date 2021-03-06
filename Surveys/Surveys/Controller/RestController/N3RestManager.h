//
//  N3RestController.h
//  Surveys
//
//  Created by Vishal Dhiman on 12/02/17.
//  Copyright © 2017 Vishal Dhiman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface N3RestManager : NSObject

+(void)fetchSurveysForPage:(int) page withCompletion:(void(^)(BOOL, id))completionBlock;

@end
