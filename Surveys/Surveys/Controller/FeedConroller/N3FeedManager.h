//
//  N3FeedController.h
//  Surveys
//
//  Created by Vishal Dhiman on 16/02/17.
//  Copyright © 2017 Vishal Dhiman. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kN3FeedRefreshKey @"FeedRefreshedKey"
#define kN3FeedUpdateKey @"FeedUpdateKey"
#define kN3FeedFailedKey @"FeedFailedKey"

@interface N3FeedManager : NSObject

+(NSArray*)getFeedItems;

+ (instancetype)sharedManager;

-(void)getNewFeed;

-(void)getMoreFeed:(int)page;

@end
