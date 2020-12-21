//
//  AppDelegate.swift
//  SPokemon
//
//  Created by José Moreira on 20/12/2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow()
        let controller = PokemonListViewController()
        let navigationController = UINavigationController(rootViewController: controller)

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        return true
    }
}
