//
//  AppDelegate.swift
//  ExameniOS
//
//  Created by Luis Fernando Sánchez Palma on 30/03/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    public var window: UIWindow?
    private var navigation: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.navigation = UINavigationController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigation
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()
        navigation?.isNavigationBarHidden = true
        
        let view = RegisterMain.createModule(navigation: self.navigation)
        navigation?.pushViewController(view, animated: true)
        
        return true
    }
    
}

