//
//  AppDelegate.m
//  Random
//
//  Created by Aleksandr Tsebrii on 2/17/16.
//  Copyright © 2016 Aleksandr Tsebrii. All rights reserved.
//

#import "AppDelegate.h"
#import "ATStartController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    ATStartController *startController = [[ATStartController alloc] init];
    self.window.rootViewController = startController;
    
    return YES;
    
}

@end
