//
//  SelectionScrollViewController.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/27.
//

import UIKit

final class SelectionScrollViewController: BaseScrollViewController {
    
    override func setupChildren() {
        super.setupChildren()
        navBar.topItem?.title = "カテゴリーから選ぶ"
        view.addSubview(navBar)
    }
    
    override func setupViews() {
        super.setupViews()
        navBar.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, size: .init(width: 0, height: ViewController.navBarHeight))
        
        stackViewTopAnchor.constant = ViewController.navBarHeight
    }
    
}
