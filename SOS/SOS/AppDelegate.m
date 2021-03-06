//
//  AppDelegate.m
//  SOS
//
//  Created by Leonid Kokhnovych on 2016-03-05.
//  Copyright © 2016 Team14. All rights reserved.
//

#import "AppDelegate.h"
#import "AppStorage.h"

NSString *SOS_SCREEN_IDENTIFIER = @"SOS VC";
NSString *MAIN_STORYBOARD_NAME = @"Main";

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self autorizeUser];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark -
#pragma mark Helper Methods

- (void)autorizeUser
{
    NSString *userUUID = [[AppStorage sharedInstance] userUUID];
    if (userUUID) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:MAIN_STORYBOARD_NAME
                                                             bundle:nil];
        UIViewController <UserSessionObligatorily> *SOSVC = [storyboard instantiateViewControllerWithIdentifier:SOS_SCREEN_IDENTIFIER];
        SOSVC.userUUID = userUUID;
        
        if (SOSVC) {
            self.window.rootViewController = SOSVC;
        }
        else {
            NSLog(@"Can't instantiate SOS VC.");
        }
    }
}



@end
