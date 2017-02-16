//
//  N3SurveyCollectionViewCell.h
//  Surveys
//
//  Created by Vishal Dhiman on 12/02/17.
//  Copyright © 2017 Vishal Dhiman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModels.h"

@protocol N3SurveyCollectionViewCellDelegate <NSObject>

@required
-(void)surveyClicked:(N3Surveys*)survey;

@end

@interface N3SurveyCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) IBOutlet UILabel *header;
@property (nonatomic, strong) IBOutlet UILabel *details;
@property (nonatomic, strong) IBOutlet UIImageView *image;

@property (nonatomic, weak) id<N3SurveyCollectionViewCellDelegate> delegate;

-(void)configureForSurvey:(N3Surveys*)survey;

@end
