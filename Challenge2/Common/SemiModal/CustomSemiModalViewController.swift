//
//  CustomSemiModalViewController.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/12/01.
//

import UIKit

class CustomSemiModalViewController: SemiModalViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "タイトル"
        label.sizeToFit()
        return label
    }()
    
    let doneButton: UIButton = {
        let button = UIButton()
        button.setTitle("決定", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.setTitleColor(.red, for: .normal)
        button.sizeToFit()
        button.addTarget(self, action: #selector(doneButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var semiModalTitleBarView: UIView = {
        let view = UIView(frame: .init(x: 0, y: 0, width: view.frame.width, height: 40))
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(doneButton)
        titleLabel.centerInSuperview()
        doneButton.anchor(top: view.topAnchor, leading: nil, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 10))
        return view
    }()
    
    @objc private func doneButtonTapped(_ sender: NSObject) {
        dismiss(animated: true, completion: nil)
    }
    
    override var modalHeight: CGFloat {
        return 250
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.addSubview(semiModalTitleBarView)
        contentView.backgroundColor = .green
    }
    
}
