//
//  N3RestController.m
//  Surveys
//
//  Created by Vishal Dhiman on 12/02/17.
//  Copyright © 2017 Vishal Dhiman. All rights reserved.
//

#import "N3RestManager.h"
#import "AFNetworking.h"
#import <AFOAuth2Manager/AFOAuth2Manager.h>

#define kOAuthIdentifier @"Nimbl3OAuth"
#define kNimbl3UserName @"carlos@nimbl3.com"
#define kNimbl3Password @"antikera"

static NSString * const BaseURLString = @"https://nimbl3-survey-api.herokuapp.com";
static int resultsPerPage = 10;

@implementation N3RestManager

+(void)fetchSurveysForPage:(int) page withCompletion:(void(^)(BOOL, id))completionBlock{
    
    
    NSString *string = [NSString stringWithFormat:@"%@/surveys.json?page=%d&per_page=%d", BaseURLString, page, resultsPerPage];
    __block NSURL *url = [NSURL URLWithString:string];
    
    __block AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    AFOAuthCredential *credential =
    [AFOAuthCredential retrieveCredentialWithIdentifier:kOAuthIdentifier];
    
    __block void (^executeManager)() = ^void() {
        [manager GET:url.absoluteString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
            completionBlock(YES, responseObject);
            //NSLog(@"fetchSurveysForPage JSON: %@", responseObject);
        } failure:^(NSURLSessionTask *operation, NSError *error) {
            completionBlock(NO, nil);
            NSLog(@"fetchSurveysForPage Error: %@", error);
        }];
    };
    
    if (credential && !credential.isExpired) {
        [manager.requestSerializer setAuthorizationHeaderFieldWithCredential:credential];
        executeManager();
    }else{
        [N3RestManager fetchNewOauthTokenWithCompletion:^(BOOL sucess, AFOAuthCredential *credential) {
            if (sucess) {
                executeManager();
            }
        }];
    }
    
}

+(void)fetchNewOauthTokenWithCompletion:(void(^)(BOOL, AFOAuthCredential *))completionBlock{
    
    NSURL *url = [NSURL URLWithString:BaseURLString];
    AFOAuth2Manager *OAuth2Manager =
    [[AFOAuth2Manager alloc] initWithBaseURL:url
                                    clientID:@"DummyNimble3Id"
                                      secret:@"DummyNimble3Secret"];
    
    [OAuth2Manager authenticateUsingOAuthWithURLString:@"/oauth/token"
                                              username:kNimbl3UserName
                                              password:kNimbl3Password
                                                 scope:nil
                                               success:^(AFOAuthCredential *credential) {
                                                   [AFOAuthCredential storeCredential:credential
                                                                       withIdentifier:kOAuthIdentifier];
                                                   completionBlock(YES, credential);
                                                   //NSLog(@"Token: %@", credential.accessToken);
                                               }
                                               failure:^(NSError *error) {
                                                   NSLog(@"Error: %@", error);
                                                   completionBlock(NO, nil);
                                               }];
}




@end
