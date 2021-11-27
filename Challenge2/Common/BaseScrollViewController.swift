//
//  BaseScrollViewController.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/27.
//

import UIKit


// View hierarchy: BaseSerchViewController.view -> UIScrollView -> UIView(ContentView) -> UIStackView -> UIView -> UICollectionView
class BaseScrollViewController: ViewController {
    
    var categorySearchVC: CategoryViewController!
    var officialAppSearchVC: OfficialAppViewController!

    let scrollView = UIScrollView()
    private let contentView = UIView()
    let stackView = UIStackView()
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "公式チャレンジ"
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .center
        label.backgroundColor = UIColor.primaryGray()
        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return label
    }()
    
    init(categorySearchVC: CategoryViewController, officialAppSearchVC: OfficialAppViewController) {
        super.init(nibName: nil, bundle: nil)
        self.categorySearchVC = categorySearchVC
        self.officialAppSearchVC = officialAppSearchVC
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChildren()
        setupViews()

        scrollView.backgroundColor = UIColor.primaryGray()
        stackView.backgroundColor = UIColor.primaryGray()
        contentView.backgroundColor = UIColor.primaryGray()
        
//        scrollView.backgroundColor = UIColor.cyan
//        stackView.backgroundColor = UIColor.yellow
//        contentView.backgroundColor = UIColor.green
        
    }
    
    
    /// - Method:
    ///     - Tips : addChild" and "didMove" method creates a parent-child relationship between the current view controller and another view controller that's gonna be child.
    func setupChildren() {

        addChild(categorySearchVC)
        addChild(officialAppSearchVC)
        stackView.addArrangedSubview(categorySearchVC.view)
        stackView.addArrangedSubview(officialAppSearchVC.view)
        categorySearchVC.didMove(toParent: self)
        officialAppSearchVC.didMove(toParent: self)
        
        stackView.addSubview(headerLabel)

        stackView.axis = .vertical
        stackView.distribution = .equalSpacing

        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
    }
    
    var stackViewTopAnchor: NSLayoutConstraint = NSLayoutConstraint()
    
    func setupViews(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        //↓↓↓
        stackViewTopAnchor = stackView.topAnchor.constraint(equalTo: contentView.topAnchor)
        stackViewTopAnchor.isActive = true
        
        stackView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 94/100).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30).isActive = true
        stackView.spacing = 30
        
        headerLabel.anchor(top: categorySearchVC.view.bottomAnchor, leading: officialAppSearchVC.view.leadingAnchor, bottom: officialAppSearchVC.view.topAnchor, trailing: officialAppSearchVC.view.trailingAnchor, padding: .init(top: 30, left: 0, bottom: 0, right: 0))
    }
    
}
