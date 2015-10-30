//
//  AppDelegate.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self initializeWithApplication:application];
    [self moveDataToDoc];
    return YES;
}

- (void)moveDataToDoc{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"sqlite" ofType:@"bundle"];
    path = [path stringByAppendingPathComponent:@"sqlite.db"];
    NSLog(@"path %@",path);
    NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    docPath = [docPath stringByAppendingPathComponent:@"sqlite3.db"];
    NSLog(@"docpath %@",docPath);
    NSFileManager *manager = [NSFileManager defaultManager];
    while (![manager fileExistsAtPath:docPath]) {
        [manager moveItemAtPath:path toPath:docPath error:nil];
    }
}

@end
