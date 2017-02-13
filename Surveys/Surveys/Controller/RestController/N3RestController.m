//
//  N3RestController.m
//  Surveys
//
//  Created by Vishal Dhiman on 12/02/17.
//  Copyright © 2017 Vishal Dhiman. All rights reserved.
//

#import "N3RestController.h"

static NSString * const BaseURLString = @"https://nimbl3-survey-api.herokuapp.com";
static int resultsPerPage = 10;

@implementation N3RestController

+(void)fetchSurveysForPage:(int) page{
    
    NSString *string = [NSString stringWithFormat:@"%@/surveys.json?page=%d&per_page=%d", BaseURLString, page, resultsPerPage];
    NSURL *url = [NSURL URLWithString:string];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:url.absoluteString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"fetchNewOauthToken JSON: %@", responseObject);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"fetchNewOauthToken Error: %@", error);
    }];
}

+(void)fetchNewOauthToken{
    
    NSString *string = [NSString stringWithFormat:@"%@/oauth/token", BaseURLString];
    NSURL *url = [NSURL URLWithString:string];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSDictionary *params = @{@"grant_type":@"password",@"username":@"carlos@nimbl3.com",@"password":@"antikera"};
    
    [manager POST:url.absoluteString parameters:params progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"fetchNewOauthToken JSON: %@", responseObject);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"fetchNewOauthToken Error: %@", error);
    }];
    
}


@end
