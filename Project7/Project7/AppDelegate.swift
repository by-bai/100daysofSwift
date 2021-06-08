//
//  AppDelegate.swift
//  Project7
//
//  Created by Bai on 7/6/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        print("1")
        if let tabBarController = window?.rootViewController as? UITabBarController { //rootviewcontroller is UITabBarController
            print("2")
            let storyboard = UIStoryboard(name: "Main", bundle: nil) //get reference to Main.storyboard
            //nil= use current app bundle
            let vc = storyboard.instantiateViewController(withIdentifier: "NavController") //create view controller, pass in the storyboard ID of the viewcontroller.
            vc.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 1)
            tabBarController.viewControllers?.append(vc) //add new view controller to tab bar controller's viewControllers array
            
            //tldr: above code creates a duplicate ViewController wrapped inside a navigation controller, gives it a new tab bar item and adds it to the list of existing tabs. this lets us use the same class for both tabs w/o having to duplicate things in storyboard
        
        }
        return true 
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

