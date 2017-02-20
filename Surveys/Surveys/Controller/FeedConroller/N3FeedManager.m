//
//  N3FeedController.m
//  Surveys
//
//  Created by Vishal Dhiman on 16/02/17.
//  Copyright © 2017 Vishal Dhiman. All rights reserved.
//

#import "N3FeedManager.h"
#import "N3RestManager.h"
#import "DataModels.h"

@interface N3FeedManager()

@property (nonatomic, strong) NSMutableArray *currentFeed;

@end

@implementation N3FeedManager

+ (instancetype)sharedManager {
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}


+(NSArray*)getFeedItems{
    return [[self sharedManager] getAllFeed];
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
    
    [N3RestManager fetchSurveysForPage:page withCompletion:^(BOOL success, id response) {
        if (success && response && [response isKindOfClass:[NSArray class]]) {
            if (!self.currentFeed) {
                self.currentFeed = [[NSMutableArray alloc] init];
            }
            for (NSDictionary *dict in (NSArray*)response) {
                N3Surveys *survey = [N3Surveys modelObjectWithDictionary:dict];
                if (survey) {
                    [self.currentFeed addObject:survey];
                }
            }
            [[NSNotificationCenter defaultCenter] postNotificationName:kN3FeedUpdateKey object:self.currentFeed];
        }else{
            [self feedFetchFailed];
        }
    }];
}

-(void)feedFetchFailed{
    [[NSNotificationCenter defaultCenter] postNotificationName:kN3FeedFailedKey object:nil];
}

-(void)getNewFeed{
    
    [N3RestManager fetchSurveysForPage:1 withCompletion:^(BOOL success, id response) {
            if (success && response && [response isKindOfClass:[NSArray class]]) {
                self.currentFeed = [[NSMutableArray alloc] init];
                for (NSDictionary *dict in (NSArray*)response) {
                    N3Surveys *survey = [N3Surveys modelObjectWithDictionary:dict];
                    if (survey) {
                        [self.currentFeed addObject:survey];
                    }
                }
                [[NSNotificationCenter defaultCenter] postNotificationName:kN3FeedRefreshKey object:self.currentFeed];
            }else{
                [self feedFetchFailed];
            }
        
    }];
    
}

@end
