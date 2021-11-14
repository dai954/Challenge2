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
                let vc = BaseSearchViewController()
                return UINavigationController(rootViewController: vc)
            case .team:
                let vc = TeamListTableViewController(viewModel: TeamListViewModel(challengeAPI: MockChallengeAPI.mockChallegeAPIShared, keyword: "mock"))
                return UINavigationController(rootViewController: vc)
            case .myData:
                let vc = TeamDetailTableViewController(viewModel: TeamDetailViewModel(app: MockChallengeAPI.mockChallegeAPIShared.getSampleApp()))
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


//class AlwaysPoppableNavigationController : UINavigationController {
//
//    private var alwaysPoppableDelegate: AlwaysPoppableDelegate!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        self.alwaysPoppableDelegate = AlwaysPoppableDelegate(navigationController: self, originalDelegate: self.interactivePopGestureRecognizer!.delegate!)
//        self.interactivePopGestureRecognizer!.delegate = self.alwaysPoppableDelegate
//    }
//}
//
//private class AlwaysPoppableDelegate : NSObject, UIGestureRecognizerDelegate {
//
//    weak var navigationController: AlwaysPoppableNavigationController?
//    weak var originalDelegate: UIGestureRecognizerDelegate?
//
//    init(navigationController: AlwaysPoppableNavigationController, originalDelegate: UIGestureRecognizerDelegate) {
//        self.navigationController = navigationController
//        self.originalDelegate = originalDelegate
//    }
//
//    // For handling iOS before 13.4
//    @objc func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
//        if let navigationController = navigationController, navigationController.isNavigationBarHidden && navigationController.viewControllers.count > 1 {
//            return true
//        }
//        else if let originalDelegate = originalDelegate {
//            return originalDelegate.gestureRecognizer!(gestureRecognizer, shouldReceive: touch)
//        }
//        else {
//            return false
//        }
//    }
//
//    // For handling iOS 13.4+
//    @objc func _gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceiveEvent event: UIEvent) -> Bool {
//        if let navigationController = navigationController, navigationController.isNavigationBarHidden && navigationController.viewControllers.count > 1 {
//            return true
//        }
//        else if let originalDelegate = originalDelegate {
//            let selector = #selector(_gestureRecognizer(_:shouldReceiveEvent:))
//            if originalDelegate.responds(to: selector) {
//                let result = originalDelegate.perform(selector, with: gestureRecognizer, with: event)
//                return result != nil
//            }
//        }
//
//        return false
//    }
//
//    override func responds(to aSelector: Selector) -> Bool {
//        if #available(iOS 13.4, *) {
//            // iOS 13.4+ does not need to override responds(to:) behavior, it only uses forwardingTarget
//            return originalDelegate?.responds(to: aSelector) ?? false
//        }
//        else {
//            if aSelector == #selector(gestureRecognizer(_:shouldReceive:)) {
//                return true
//            }
//            else {
//                return originalDelegate?.responds(to: aSelector) ?? false
//            }
//        }
//    }
//
//    override func forwardingTarget(for aSelector: Selector) -> Any? {
//        if #available(iOS 13.4, *), aSelector == #selector(_gestureRecognizer(_:shouldReceiveEvent:)) {
//            return nil
//        }
//        else {
//            return self.originalDelegate
//        }
//    }
//}
