//
//  ViewController.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/10/25.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    let disposeBag = DisposeBag()
    
    let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(.init(systemName: "plus"), for: .normal)
        button.tintColor = .white
        button.widthAnchor.constraint(equalToConstant: 48).isActive = true
        button.heightAnchor.constraint(equalToConstant: 48).isActive = true
        button.layer.cornerRadius = 24
        button.backgroundColor = UIColor.primaryRed()
        
        button.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let searchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.searchTextField.backgroundColor = .white
        sb.searchTextField.tintColor = .lightGray
        sb.placeholder = "キーワード検索はここをタップ"
        return sb
    }()
    
    static let navBarHeight: CGFloat = 44
    
    let navBar: UINavigationBar = {
        let bar = UINavigationBar()
        let navItem = UINavigationItem()
        let stopItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.stop, target: nil, action: #selector(dissmissModalView))
        navItem.rightBarButtonItem = stopItem
        bar.setItems([navItem], animated: false)
        bar.tintColor = .white
        bar.barTintColor = UIColor.primaryRed()
        bar.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont.systemFont(ofSize: 16)]
        return bar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultViewControllerSetting()
        makeUI()
        bindViewModel()
    }

    private func defaultViewControllerSetting() {
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)]
        
        if #available(iOS 14.0, *) {
            navigationItem.backButtonDisplayMode = .minimal
        }
        else {
            navigationItem.backButtonTitle = ""
        }
        
        if #available(iOS 13, *)
        {
            let statusBar = UIView(frame: (UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.windowScene?.statusBarManager?.statusBarFrame)!)
            statusBar.backgroundColor = UIColor.primaryRed()
            UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.addSubview(statusBar)
        }
    }
    
    func makeUI() {
    }

    func bindViewModel() {
    }
    
    @objc private func plusButtonTapped() {
        let vc = TeamCreateViewController()
        vc.navigationItem.title = "チーム作成"
        vc.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: vc, action: #selector(dissmissView))
        vc.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: vc, action: nil)
        
        let transition = CATransition()
        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.moveIn
        transition.subtype = CATransitionSubtype.fromTop
        navigationController?.view.layer.add(transition, forKey: nil)
        navigationController?.pushViewController(vc, animated: false)
        
        tabBarController?.tabBar.isHidden = true
    }
    
    @objc func dissmissView(){
        let transition = CATransition()
            transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.reveal
        transition.subtype = CATransitionSubtype.fromBottom
            navigationController?.view.layer.add(transition, forKey: nil)
            _ = navigationController?.popViewController(animated: false)
        
        tabBarController?.tabBar.isHidden = false
    }
    
    @objc func dissmissModalView() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
