//
//  SearchViewController.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/10/26.
//

import UIKit

final class BaseSearchViewController: UIViewController {

    fileprivate let scrollView = UIScrollView()
    fileprivate let stackView = UIStackView()
    fileprivate let contentView = UIView()
    fileprivate let searchBarView: UISearchBar = {
        let sb = UISearchBar()
        sb.textField?.backgroundColor = .white
        sb.placeholder = "キーワード検索はここをタップ"
        sb.textField?.isEnabled = false
        return sb
    }()
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "公式チャレンジ"
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .center
        label.backgroundColor = UIColor.primaryGray()
        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        setupChildren()
        setupViews()
        
//        Color for position test
//        scrollView.backgroundColor = .yellow
//        stackView.backgroundColor = .purple
//        contentView.backgroundColor = .green
//        headerLabel.backgroundColor = .orange
        
        scrollView.backgroundColor = UIColor.primaryGray()
        stackView.backgroundColor = UIColor.primaryGray()
        contentView.backgroundColor = UIColor.primaryGray()
    }
    
    private func setupSearchBar() {
        //   For next VC, it should be set here.
        if #available(iOS 14.0, *) {
            navigationItem.backButtonDisplayMode = .minimal
        }
        else {
            navigationItem.backButtonTitle = ""
        }
        
        navigationItem.titleView = searchBarView
        
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(singleTap))

//        searchBarView.addGestureRecognizer(tapGesture)
    }
    
    /// - Method:
    ///     - Tips : addChild" and "didMove" method creates a parent-child relationship between the current view controller and another view controller that's gonna be child.
    private func setupChildren() {

        let categorySearchVC = CategorySearchViewController()
        let officialAppSearchVC = OfficialAppSearchViewController()
        addChild(categorySearchVC)
        addChild(officialAppSearchVC)
        stackView.addArrangedSubview(categorySearchVC.view)
        stackView.addArrangedSubview(officialAppSearchVC.view)
        categorySearchVC.didMove(toParent: self)
        officialAppSearchVC.didMove(toParent: self)
        
        stackView.addSubview(headerLabel)
        headerLabel.anchor(top: categorySearchVC.view.bottomAnchor, leading: officialAppSearchVC.view.leadingAnchor, bottom: officialAppSearchVC.view.topAnchor, trailing: officialAppSearchVC.view.trailingAnchor, padding: .init(top: 30, left: 0, bottom: 0, right: 0))

        stackView.axis = .vertical
        stackView.distribution = .equalSpacing

        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)

    }
    
    
    func setupViews(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 94/100).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30).isActive = true
        stackView.spacing = 30
    }
    
}
