//
//  AppDelegate.swift
//  MundoDeRafa
//
//  Created by Albert Rayneer on 16/09/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let didFirstLaunch = UserDefaults.standard.bool(forKey: "didFirstLaunch")
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let navigationController = UINavigationController()
        let rootViewController = didFirstLaunch ? MainMenuViewController() : OnboardingViewController()
        navigationController.viewControllers = [rootViewController]
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        MusicHelper.shared.playBackgroundMusicIfNeeded()
        if #available(iOS 13.0, *) {
            return true
        }
        UserDefaults.standard.setValue(true, forKey: "didFirstLaunch")
        
        configureForTests()
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
}

// MARK: UITests
extension AppDelegate {
    private func configureForTests() {
        if CommandLine.arguments.contains("-reset") {
            guard let defaultsName = Bundle.main.bundleIdentifier else { return }
            UserDefaults.standard.removePersistentDomain(forName: defaultsName)
        }
        
        if CommandLine.arguments.contains("-skipOnboarding") {
            UserDefaults.standard.set(0, forKey: "hasSeenOnboard")
        }
    }
}
