//
//  HomeTabBarController.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/10/26.
//

import UIKit

class HomeTabBarController: UITabBarController {
    
    enum HomeTabBarItem: Int, CaseIterable {
        case search, team, myData
        
        private func controller() -> UIViewController {
            switch self {
            case .search:
                let vc = BaseSearchViewController(categorySearchVC: CategorySearchViewController(), officialAppSearchVC: OfficialAppSearchViewController())
                return UINavigationController(rootViewController: vc)
            case .team:
                let vc = UIViewController()
                return UINavigationController(rootViewController: vc)
            case .myData:
                let vc = UIViewController()
                return UINavigationController(rootViewController: vc)
            }
        }
        
        var image: UIImage? {
            switch self {
            case .search:
                return UIImage(named: "search")
            case .team:
                return UIImage(named: "apps")
            case .myData:
                return UIImage(named: "apps")
            }
        }
        
        var title: String {
            switch self {
            case .search:
                return "チーム検索"
            case .team:
                return "チーム"
            case .myData:
                return "マイデータ"
            }
        }
        
        func getController() -> UIViewController {
            let vc = controller()
            vc.tabBarItem.title = self.title
            vc.tabBarItem.image = self.image
            
            return vc
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().barTintColor = UIColor.primaryWhite()
        UITabBar.appearance().tintColor = UIColor.primaryRed()
        
        let tabBarItems = HomeTabBarItem.allCases
        let controllers = tabBarItems.map { $0.getController() }
        viewControllers = controllers
    }
    
}
