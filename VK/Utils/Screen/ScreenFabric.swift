//
//  ScreenFabric.swift
//  VK
//
//  Created by Александр Чегошев on 18.08.2018.
//  Copyright © 2018 4egoshev. All rights reserved.
//

import UIKit
import SideMenu

enum MainMenuSection: Int {
    case news
    case friends
    case groups
}

class ScreenFabric: NSObject {
    
    //MARK: - Helpers
    private class func wrapToNavigationController(with controller:UIViewController) -> UINavigationController {
        let navController = UINavigationController(rootViewController: controller)
//        SPUtils.blueNavBar(navController: navController)
        return navController
    }

    class func rootViewController() -> UIViewController {
//        let controller = friendsViewController()
        let controller = LoginViewController()
        
        let navController = wrapToNavigationController(with: controller)
        sideMenu(with: controller)
        return navController
    }
    
    private class func sideMenu(with mainController: UIViewController) {
        let mainMenuController = mainMenuViewController()
        SideMenuManager.default.menuPresentMode              = .menuSlideIn
        SideMenuManager.default.menuBlurEffectStyle          = .light
        SideMenuManager.default.menuFadeStatusBar            = false
        SideMenuManager.default.menuWidth                    = mainMenuController.view.frame.width * 0.75
        SideMenuManager.default.menuLeftNavigationController = mainMenuController
        
        SideMenuManager.default.menuAddPanGestureToPresent(toView: mainController.navigationController!.navigationBar)
        SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: mainController.navigationController!.view)
    }
    
    //MARK: - Main menu
    class func mainMenuViewController() -> UISideMenuNavigationController {
        let item1 = MainMenuItem(title: "Новости", section: .news)
        let item2 = MainMenuItem(title: "Друзья", section: .friends)
        let item3 = MainMenuItem(title: "Группы", section: .groups)

        let controller = MenuViewController()
        controller.items = [item1, item2, item3]
        return UISideMenuNavigationController(rootViewController: controller)
    }
    
    class func mainMenu() -> UISideMenuNavigationController {
        return SideMenuManager.default.menuLeftNavigationController!
    }
    
    class func menuViewController(config: MainMenuSection) -> UIViewController {
        switch config {
        case .news:
            return newsViewController()
        case .friends:
            return friendsViewController()
        case .groups:
            return groupsViewController()
        }
    }
    
    //MARK: - Controllers
    class func newsViewController() -> UIViewController {
        let controller = NewsViewController()
        controller.addMenuButton()
        return controller
    }
    
    class func friendsViewController() -> UIViewController {
        let controller = FriendsViewController()
        controller.addMenuButton()
        return controller
    }
    
    class func groupsViewController() -> UIViewController {
        let controller = GroupsViewController()
        controller.addMenuButton()
        return controller
    }
}
