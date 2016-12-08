//
//  AppDelegate.swift
//  DeepLink-Demo
//
//  Created by Aynur Galiev on 6.декабря.2016.
//  Copyright © 2016 Aynur Galiev. All rights reserved.
//

import UIKit

struct Constants {
    static let mainUserActivity: String = "com.flatstack.Movie"
    static let activeMoviesKey: String = "ActiveMovies"
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        guard let components = URLComponents(string: url.absoluteString) else { return false }
        guard components.host == "search" else { return false }
        guard let items = components.queryItems, items.count == 1 else { return false }
        guard let movieName = items[0].value else { return false }
        
        if let viewController = app.keyWindow?.rootViewController as? UINavigationController,
           let topViewController = viewController.topViewController as? ViewController {
            
            let index = movies.index(where: { (movie) -> Bool in
                return movie.name == movieName
            })
            if let lIndex = index {
                let indexPath = IndexPath(row: lIndex, section: 0)
                topViewController.tableView(topViewController.tableView, didSelectRowAt: indexPath)
            }
        }
        
        return true
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        return true
    }
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([Any]?) -> Void) -> Bool {
        
        if let viewController = self.window?.rootViewController as? ViewController {
            viewController.restoreUserActivityState(userActivity)
        }
        
        return true
    }
}

