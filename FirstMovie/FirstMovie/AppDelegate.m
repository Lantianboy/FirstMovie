//
//  AppDelegate.m
//  FirstMovie
//
//  Created by 最爱是深蓝 on 2017/8/21.
//  Copyright © 2017年 ProductTest. All rights reserved.
//

#import "AppDelegate.h"
#import "RootTabbar.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    
    //本地缓存版本号 第一次启动时本地没有缓存版本号
    NSString * Version = [[NSUserDefaults standardUserDefaults]objectForKey:@"VersionCache"] ;
    
    //当前版本号
    NSString * versionis = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"] ;
    
    
    if (![Version isEqualToString:versionis])//如果本地缓存版本号和当前应用版本号不一样，则是第一次启动(更新版本也算第一次启动)
    {
        ViewController * view = [[ViewController alloc ]init] ;
        
        //创建URL(播放内容)
        view.movURL = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"qidong"ofType:@"mp4"]];//选择本地视频

        self.window.rootViewController = view;
        
        
        /*
         设置下边这句话是将当前版本号缓存到本地，下次启动对比如果一样就不启动视频
         也可以将这句话放到ViewController.m的进入应用方法里面
         为了每次都能启动视频，先注释
         */
       // [[NSUserDefaults standardUserDefaults] setObject:versionis forKey:@"Version"] ;
        
        
    }else{
        //不是首次启动
        RootTabbar * root = [[RootTabbar alloc]init] ;
        self.window.rootViewController = root ;
        
        
    }
    
    
    
    
//    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds] ;
//    RootTabbar * root = [[RootTabbar alloc]init] ;
//    //UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:root] ;
//    
//    
//    self.window.rootViewController = root ;
//    [self.window makeKeyWindow] ;
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
