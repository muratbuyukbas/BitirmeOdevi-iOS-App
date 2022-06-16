//
//  AppDelegate.swift
//  TarifDefterim
//
//  Created by Murat Büyükbaş on 4/7/22.
//

import Firebase
import UIKit
import Appirater

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        Appirater.appLaunched(true)
        Appirater.setDebug(false)
        Appirater.setDaysUntilPrompt(3)

        FirebaseApp.configure()

        return true
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        Appirater.appEnteredForeground(true)
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {}
}

