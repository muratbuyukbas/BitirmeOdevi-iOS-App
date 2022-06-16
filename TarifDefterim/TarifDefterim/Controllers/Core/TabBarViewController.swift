//
//  TabBarViewController.swift
//  TarifDefterim
//
//  Created by Murat Büyükbaş on 4/7/22.
//

import UIKit

/// Primary tab controller for core app UI
final class TabBarViewController: UITabBarController {

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpControllers()
    }

    /// Sets up tab bar controllers
    private func setUpControllers() {
        guard let email = UserDefaults.standard.string(forKey: "email"),
              let username = UserDefaults.standard.string(forKey: "username") else {
            return
        }

        let currentUser = User(
            username: username,
            email: email
        )

        // Define VCs
        let home = HomeViewController()
        let explore = ExploreViewController()
        let camera = CameraViewController()
        let activity = NotificationsViewController()
        let profile = ProfileViewController(user: currentUser)

        let nav1 = UINavigationController(rootViewController: home)
        let nav2 = UINavigationController(rootViewController: explore)
        let nav3 = UINavigationController(rootViewController: camera)
        let nav4 = UINavigationController(rootViewController: activity)
        let nav5 = UINavigationController(rootViewController: profile)

        nav1.navigationBar.tintColor = .label
        nav2.navigationBar.tintColor = .label
        nav3.navigationBar.tintColor = .label
        nav4.navigationBar.tintColor = .label
        nav5.navigationBar.tintColor = .label
        
        
        

        if #available(iOS 14.0, *) {
            home.navigationItem.backButtonDisplayMode = .minimal
            explore.navigationItem.backButtonDisplayMode = .minimal
            camera.navigationItem.backButtonDisplayMode = .minimal
            activity.navigationItem.backButtonDisplayMode = .minimal
            profile.navigationItem.backButtonDisplayMode = .minimal
        } else {
            nav1.navigationItem.backButtonTitle = ""
            nav2.navigationItem.backButtonTitle = ""
            nav3.navigationItem.backButtonTitle = ""
            nav4.navigationItem.backButtonTitle = ""
            nav5.navigationItem.backButtonTitle = ""
        }


        // Define tab items
        nav1.tabBarItem = UITabBarItem(title: "Son Tarifler", image: UIImage(systemName: "doc.text"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Keşfet", image: UIImage(systemName: "safari"), tag: 1)
        nav3.tabBarItem = UITabBarItem(title: "Ekle", image: UIImage(systemName: "plus.diamond"), tag: 1)
        nav4.tabBarItem = UITabBarItem(title: "Bildirimler", image: UIImage(systemName: "bell"), tag: 1)
        nav5.tabBarItem = UITabBarItem(title: "Profil", image: UIImage(systemName: "person.circle"), tag: 1)
        
        UITabBar.appearance().tintColor = UIColor(red: 216/255, green: 67/255, blue: 57/255, alpha: 1)

        
        

        
        
        // Set controllers
        self.setViewControllers(
            [nav1, nav2, nav3, nav4, nav5],
            animated: false
        )
    }
}
