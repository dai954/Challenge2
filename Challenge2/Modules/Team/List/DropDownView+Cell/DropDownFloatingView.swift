//
//  DropDownFloatingView.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/08.
//

import UIKit

class DropDownFloatingView: UIView {
    
    private let dropDownTableViewController = DropDownTableViewController()
    private var dropViewHeightConstraint = NSLayoutConstraint()
    private var dropViewTopConstraint = NSLayoutConstraint()
    private var blindViewTopConstraint = NSLayoutConstraint()
    
    private var isOpen = false
    var tableViewHeight: CGFloat = 401
    var floatingViewYPosition: CGFloat = 0
    var safeAreaInsetsTop: CGFloat = 0
    
    let detailSearchlabel: UILabel = {
        let label = UILabel()
        label.text = "詳細検索"
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    var teamNumberlabel: UILabel = {
        let label = UILabel()
        label.text = "0チーム募集中"
        label.font = .systemFont(ofSize: 12)
        label.textColor = #colorLiteral(red: 0.9353960156, green: 0.2671836317, blue: 0.2663446367, alpha: 1)
        return label
    }()
    
    let pullDownImage: UIImageView = {
        let imageView = UIImageView(frame: .init(x: 0, y: 0, width: 15, height: 15))
        imageView.image = UIImage(systemName: "chevron.down")
        imageView.tintColor = .black
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let bottomBorder: UIView = {
        let border = UIView()
        border.backgroundColor = .lightGray
        border.alpha = 0
        return border
    }()
    
    let blindView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0
        return view
    }()
    
    let containerView = UIView()
    
    @objc private func blindViewTapped() {
        dismissDropDownFloatingView()
    }
    
    private var containerViewTrailingConstraint = NSLayoutConstraint()
    private var containerViewCenterConstraint = NSLayoutConstraint()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(blindViewTapped))
        blindView.addGestureRecognizer(tapGestureRecognizer)
        
        
        addSubview(teamNumberlabel)
        addSubview(bottomBorder)
        teamNumberlabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 0, left: 12, bottom: 0, right: 0))
        bottomBorder.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, size: .init(width: 0, height: 0.3))
        
        containerView.addSubview(detailSearchlabel)
        containerView.addSubview(pullDownImage)
        addSubview(containerView)

        detailSearchlabel.anchor(top: containerView.topAnchor, leading:  containerView.leadingAnchor, bottom:  containerView.bottomAnchor, trailing: nil)
        pullDownImage.anchor(top:  detailSearchlabel.topAnchor, leading: detailSearchlabel.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 10, left: 8, bottom: 0, right: 0), size: .init(width: 20, height: 20))
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        containerView.widthAnchor.constraint(equalToConstant: 72).isActive = true
        containerViewTrailingConstraint = containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        containerViewTrailingConstraint.isActive = true
        containerViewCenterConstraint = containerView.centerXAnchor.constraint(equalTo: centerXAnchor)
        
        }
    
    override func didMoveToSuperview() {
        if let superview = self.superview {
            dropDownTableViewController.view.translatesAutoresizingMaskIntoConstraints = false
            superview.addSubview(dropDownTableViewController.view)
            superview.addSubview(blindView)
            superview.bringSubviewToFront(dropDownTableViewController.view)

            dropDownTableViewController.view.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: -20, left: 0, bottom: 0, right: 0))
            dropViewHeightConstraint = dropDownTableViewController.view.heightAnchor.constraint(equalToConstant: 0)
            dropViewTopConstraint = dropDownTableViewController.view.topAnchor.constraint(equalTo: bottomAnchor, constant: 0)
            blindView.anchor(top: nil, leading: superview.leadingAnchor, bottom: superview.bottomAnchor, trailing: superview.trailingAnchor)
            blindViewTopConstraint = blindView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0)
        }
        

    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let flotingPosition: CGFloat = floatingViewYPosition - safeAreaInsetsTop - TeamListTableViewController.floatingViewHeight
        if isOpen == false {
            isOpen = true
            bottomBorder.alpha = 1
            
            NSLayoutConstraint.deactivate([dropViewHeightConstraint, dropViewTopConstraint ,blindViewTopConstraint, containerViewTrailingConstraint])
            dropViewHeightConstraint.constant = tableViewHeight
            print("dropDownTableViewController.tableView.contentSize.height", dropDownTableViewController.tableView.contentSize.height)
            blindViewTopConstraint.constant = TeamListTableViewController.floatingViewHeight
            dropViewTopConstraint.constant = flotingPosition
            superview?.bringSubviewToFront(dropDownTableViewController.view)
            NSLayoutConstraint.activate([dropViewHeightConstraint, blindViewTopConstraint, dropViewTopConstraint, containerViewCenterConstraint])
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: .curveLinear, animations: {
                self.dropDownTableViewController.view.layoutIfNeeded()
                self.layoutIfNeeded()
                self.dropDownTableViewController.view.center.y += self.dropDownTableViewController.view.frame.height / 2
                self.blindView.alpha = 0.7
                self.pullDownImage.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 0.999)
                
                self.teamNumberlabel.alpha = 0
            }, completion: nil)
            
        } else {
            dismissDropDownFloatingView()
        }
        
    }
    
    private func dismissDropDownFloatingView() {
        isOpen = false
        bottomBorder.alpha = 0
        NSLayoutConstraint.deactivate([dropViewHeightConstraint, containerViewCenterConstraint])
        self.dropViewHeightConstraint.constant = 0
        NSLayoutConstraint.activate([dropViewHeightConstraint , containerViewTrailingConstraint])
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: .curveLinear, animations: {
            self.dropDownTableViewController.view.center.y -= self.dropDownTableViewController.view.frame.height / 2
            
            self.blindView.alpha = 0
            self.pullDownImage.transform = .identity
            self.teamNumberlabel.alpha = 1
            
            self.layoutIfNeeded()
            self.dropDownTableViewController.view.layoutIfNeeded()
            self.dropDownTableViewController.view.endEditing(true)
        }, completion: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
