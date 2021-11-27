//
//  AppDelegate.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/10/25.
//

import UIKit
import RxSwift
import Kingfisher

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UINavigationBar.appearance().barTintColor = UIColor.primaryRed()
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().isTranslucent = false
        
        // Config image cache limit
        let cache = ImageCache.default
        cache.memoryStorage.config.totalCostLimit = 1024 * 1024 * 100 // Constrain Memory Cache
        cache.diskStorage.config.sizeLimit = 1024 * 1024 * 300 // Constrain Disk Cache
        
        // Count number of rx object (Observables, Observers, Disposables, etc.).
        
//        let timer = Timer(timeInterval: 3.0, target: BlockOperation.init(block: {
//                print("Resource count \(RxSwift.Resources.total)")
//            }), selector: #selector(Operation.main), userInfo: nil, repeats: true)
//        RunLoop.main.add(timer, forMode: .common)
        
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

