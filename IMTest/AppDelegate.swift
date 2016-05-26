//
//  AppDelegate.swift
//  IMTest
//
//  Created by HouMeng on 16/5/19.
//  Copyright © 2016年 侯猛. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate ,RCIMUserInfoDataSource{

    var window: UIWindow?

    func getUserInfoWithUserId(userId: String!, completion: ((RCUserInfo!) -> Void)!) {
        
        let userInfo = RCUserInfo()
        userInfo.userId = userId;
        
        switch userId{
            case "houmeng":
            userInfo.name = "侯猛"
            userInfo.portraitUri = "http://rescdn.qqmail.com/dyimg/20140409/72B8663B7F23.jpg"
            
            case "xiaona":
            userInfo.name = "晓娜"
            userInfo.portraitUri = "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3948662581,2562691314&fm=116&gp=0.jpg"
            
        default:
            print("无此用户")
        }
        
        return completion(userInfo)
    }
    
    func connectServer(completion:()->Void) {
        // 初始化appkey
        RCIM.sharedRCIM().initWithAppKey("x18ywvqf876pc")
        
        // 初始化token
        RCIM.sharedRCIM().connectWithToken("Kqz5bLRgsxJG+k37DibnxnCPTac30B0F255hsM1zX8b5Mu1jf031tCIK2u5o+20ylJAUNeFkXm3VoAv9Hs7rQ3rs4Lr62PGn",
            success: { (userId) -> Void in

                RCIMClient.sharedRCIMClient().currentUserInfo = RCUserInfo(userId: "houmeng", name: "侯猛", portrait: "http://image.baidu.com/search/detail?ct=503316480&z=0&tn=baiduimagedetail&rn=1&oe=utf-8&in=3354&cl=2&lm=-1&ie=gbk&is=0,0&pi=0&di=1333259290&os=2224883539,384504086&pn=9&spn=0&word=%CD%B7%CF%F1&statnum=head&cg=head&objurl=http%3A%2F%2Fdepot.nipic.com%2Ffile%2F20150605%2F13378630_23102978350.jpg&simid=&fr=ala&oriquery=%E5%A4%B4%E5%83%8F&ala=1&alatpl=portait&pos=1")
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    completion()
                })
                
            }, error: { (status) -> Void in
                print("登陆的错误码为:\(status.rawValue)")
            }, tokenIncorrect: {
                //token过期或者不正确。
                //如果设置了token有效期并且token过期，请重新请求您的服务器获取新的token
                //如果没有设置token有效期却提示token错误，请检查您客户端和服务器的appkey是否匹配，还有检查您获取token的流程。
                print("token错误")
        })
    }
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        
        
        // 设置用户头像代理
        RCIM.sharedRCIM().userInfoDataSource = self
        
       
        
        
        
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

