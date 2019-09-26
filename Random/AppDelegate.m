//
//  AppDelegate.m
//  Random
//
//  Created by Aleksandr Tsebrii on 2/17/16.
//  Copyright © 2016 Aleksandr Tsebrii. All rights reserved.
//

#import "AppDelegate.h"
#import "ATStartController.h"
#import "ATPredictionController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    NSUInteger language = ATSelectedLanguageEnglish;
    NSString *deviceLanguage = [[NSLocale preferredLanguages] objectAtIndex:0];
    if ([deviceLanguage isEqualToString:@"ru"] || [deviceLanguage isEqualToString:@"uk"]) {
        language = ATSelectedLanguageRussian;
    } else {
        language = ATSelectedLanguageEnglish;
    }
    
    ATPredictionController *predictionController = [[ATPredictionController alloc] initWithselectedLanguage:language];
    self.window.rootViewController = predictionController;
    
    return YES;
    
}

@end
