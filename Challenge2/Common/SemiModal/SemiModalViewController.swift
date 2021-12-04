//
//  SemiModalViewController.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/12/01.
//

import UIKit

class SemiModalViewController: ViewController {
    
    let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    var modalHeight: CGFloat {
        return 300
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        view.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.heightAnchor.constraint(equalToConstant: modalHeight).isActive = true
        contentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        contentView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
}

extension SemiModalViewController: SemiModalPresenterDelegate {

    var semiModalContentHeight: CGFloat {
        return modalHeight
    }
    
}
