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
        let stopItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.stop, target: nil, action: #selector(dissmissView))
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
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    @objc func dissmissView(){
            self.dismiss(animated: true, completion: nil)
    }
    
}

