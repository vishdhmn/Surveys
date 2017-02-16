//
//  N3SurveyCollectionViewCell.m
//  Surveys
//
//  Created by Vishal Dhiman on 12/02/17.
//  Copyright © 2017 Vishal Dhiman. All rights reserved.
//

#import "N3SurveyCollectionViewCell.h"
#import <UIImageView+AFNetworking.h>

@interface N3SurveyCollectionViewCell()

@property (nonatomic, strong) N3Surveys *currentSurvey;

@end

@implementation N3SurveyCollectionViewCell

-(void)configureForSurvey:(N3Surveys*)survey{
    self.currentSurvey = survey;
    
    [self.header setText:survey.title];
    [self.details setText:survey.internalBaseClassDescription];
    
    [self.image setImage:[UIImage imageNamed:@"placeholder.png"]];
    if (survey.coverImageUrl && survey.coverImageUrl.length) {
        NSURL *imgUrl = [NSURL URLWithString:[survey.coverImageUrl stringByAppendingString:@"l"]];
        if (imgUrl) {
            [self.image setImageWithURL:imgUrl placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
        }
    }
}

-(IBAction)surveyClicked:(id)sender{
    [self.delegate surveyClicked:self.currentSurvey];
}

@end
