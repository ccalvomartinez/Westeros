//
//  AppDelegate.swift
//  Westeros
//
//  Created by Administrador on 6/7/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = UIColor.cyan
        
        // Creamos unos modelos
        let houses = Repository.local.housesFactory.elements
        let seasons = Repository.local.seasonsFactory.elements
        
        // Creamos los controladores
        let houseDataSource = DataSources.houseDataSource(model: houses)
        let houseDelegate = Delegates.housesDelegate(model: houses)
        let houseArrayTableVC = ArrayTableViewController(dataSource: houseDataSource,
                                                    arrayDelegate: houseDelegate,
                                                    title: "Westeros",
                                                    style: .plain)
        let housesVC = houseArrayTableVC.wrappedInNavigation()
        
        let seasonDataSource = DataSources.seasonDataSource(model: seasons)
        let seasonDelegate = Delegates.seasonDelegate(model: seasons)
        let seasonArrayTableVC = ArrayTableViewController(dataSource: seasonDataSource,
                                                         arrayDelegate: seasonDelegate,
                                                         title: "Seasons",
                                                         style: .plain)
        let seasonsVC = seasonArrayTableVC.wrappedInNavigation()
        
        let tabViewController = UITabBarController()
        tabViewController.viewControllers=[housesVC, seasonsVC]
        
        //Aignamos al RootVC
        let rootVC = tabViewController
        window?.rootViewController=rootVC
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

