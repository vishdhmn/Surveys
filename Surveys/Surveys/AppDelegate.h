//
//  AppDelegate.h
//  Surveys
//
//  Created by Vishal Dhiman on 20/02/17.
//  Copyright © 2017 Vishal Dhiman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

