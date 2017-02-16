//
//  N3FeedController.m
//  Surveys
//
//  Created by Vishal Dhiman on 16/02/17.
//  Copyright © 2017 Vishal Dhiman. All rights reserved.
//

#import "N3FeedController.h"
#import "N3RestController.h"
#import "DataModels.h"

@interface N3FeedController()

@property (nonatomic, strong) NSMutableArray *currentFeed;

@end

@implementation N3FeedController

+ (instancetype)sharedController {
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}


+(NSArray*)getFeedItems{
    return [[self sharedController] getAllFeed];
}

-(NSArray*)getAllFeed{
    if (self.currentFeed.count) {
        return [self.currentFeed copy];
    }else{
        [self getNewFeed];
    }
    return nil;
}

-(void)getMoreFeed:(int)page{
    
    [N3RestController fetchSurveysForPage:page withCompletion:^(BOOL success, id response) {
        if (success) {

        }else{
            [self feedFetchFailed];
        }
    }];
}

-(void)feedFetchFailed{
    
}

-(void)getNewFeed{
    
    [N3RestController fetchSurveysForPage:1 withCompletion:^(BOOL success, id response) {
            if (response && [response isKindOfClass:[NSArray class]]) {
                self.currentFeed = [[NSMutableArray alloc] init];
                for (NSDictionary *dict in (NSArray*)response) {
                    N3Surveys *survey = [N3Surveys modelObjectWithDictionary:dict];
                    if (survey) {
                        [self.currentFeed addObject:survey];
                    }
                }
                [[NSNotificationCenter defaultCenter] postNotificationName:kN3FeedRefreshKey object:self.currentFeed];
            }
        
    }];
    
}

@end
