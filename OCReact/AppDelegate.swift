//
//  AppDelegate.swift
//  OCReact
//
//  Created by Konrad Roj on 18/07/2019.
//  Copyright © 2019 Konrad Roj. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
}

extension AppDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = prepareScanListScene()
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {}
    func applicationDidEnterBackground(_ application: UIApplication) {
        /* some logic to stop text recognition */
    }
    func applicationWillEnterForeground(_ application: UIApplication) {
        /* some logic to continue text recognition */
    }
    func applicationDidBecomeActive(_ application: UIApplication) {}
    func applicationWillTerminate(_ application: UIApplication) {
        /* some logic to restore text recognition */
    }
    
}

extension AppDelegate {
    
    private func prepareScanListScene() -> UINavigationController {
        let viewModel = ScanListViewModel(database: Service.database, textRecognition: Service.textRecognition)
        let viewController = ScanListViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
    
}

