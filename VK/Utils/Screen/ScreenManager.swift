//
//  ScreenManager.swift
//  VK
//
//  Created by Александр Чегошев on 18.08.2018.
//  Copyright © 2018 4egoshev. All rights reserved.
//

import UIKit

class ScreenManager: NSObject {

    //MARK: - Config
    class func configMainWindow() {
        let appDelegate: UIApplicationDelegate  = UIApplication.shared.delegate!
        appDelegate.window??.rootViewController = ScreenFabric.rootViewController()
    }
    
    //MARK: - Getters
    class func rootNavigationController() -> UINavigationController {
//        let controller = UIApplication.shared.keyWindow?.rootViewController
        return UIApplication.shared.keyWindow?.rootViewController as! UINavigationController
    }
    
    //MARK: - Helper
    class func set(viewController: UIViewController) {
        rootNavigationController().setViewControllers([viewController], animated: true)
    }
    
    class func push(viewController: UIViewController) {
        rootNavigationController().pushViewController(viewController, animated: true)
    }
    
    class func present(viewController: UIViewController) {
        rootNavigationController().present(viewController, animated: true, completion: nil)
    }
    
    class func dismiss() {
        rootNavigationController().dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Main menu
    class func selectSection(with config: MainMenuSection) {
        rootNavigationController().setViewControllers([ScreenFabric.menuViewController(config: config)], animated: false)
        dismiss()
    }
    
    //MARK: - Controllers
    class func pushMainMenu() {
        ScreenManager.present(viewController: ScreenFabric.mainMenu())
    }
    
    class func setNewsViewcontroller() {
        set(viewController: ScreenFabric.newsViewController())
    }
}
