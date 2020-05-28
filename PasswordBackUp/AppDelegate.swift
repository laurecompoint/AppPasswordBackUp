//
//  AppDelegate.swift
//  PasswordBackUp
//
//  Created by Laure Compoint on 23/04/2020.
//  Copyright © 2020 Laure Compoint. All rights reserved.
//
import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions:
        [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
