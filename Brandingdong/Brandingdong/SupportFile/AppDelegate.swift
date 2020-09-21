//
//  AppDelegate.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/08/20.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    let naviVC = UINavigationController(rootViewController: HomeLaunchScreenViewController())
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.backgroundColor = .systemBackground
    window?.rootViewController = naviVC
    window?.makeKeyAndVisible()
    return true
  }
}

