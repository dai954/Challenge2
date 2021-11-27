//
//  SearchViewController.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/10/26.
//

//import UIKit
//
//enum BaseSearchViewControllerType {
//    case search
//    case selection
//}
//
//
//// View hierarchy: BaseSerchViewController.view -> UIScrollView -> UIView(ContentView) -> UIStackView -> UIView -> UICollectionView
//final class BaseSearchViewController: ViewController {
//
//    var categorySearchVC: CategoryViewController!
//    var officialAppSearchVC: OfficialAppViewController!
//    var viewType: BaseSearchViewControllerType!
//
//    private let scrollView = UIScrollView()
//    private let stackView = UIStackView()
//    private let contentView = UIView()
//
//    let headerLabel: UILabel = {
//        let label = UILabel()
//        label.text = "公式チャレンジ"
//        label.font = .systemFont(ofSize: 12)
//        label.textAlignment = .center
//        label.backgroundColor = UIColor.primaryGray()
//        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
//        return label
//    }()
//
//    init(categorySearchVC: CategoryViewController, officialAppSearchVC: OfficialAppViewController, for viewType: BaseSearchViewControllerType) {
//        super.init(nibName: nil, bundle: nil)
//        self.categorySearchVC = categorySearchVC
//        self.officialAppSearchVC = officialAppSearchVC
//        self.viewType = viewType
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupChildren()
//        setupViews()
//
////        scrollView.backgroundColor = UIColor.primaryGray()
////        stackView.backgroundColor = UIColor.primaryGray()
////        contentView.backgroundColor = UIColor.primaryGray()
//
//        scrollView.backgroundColor = UIColor.cyan
//        stackView.backgroundColor = UIColor.yellow
//        contentView.backgroundColor = UIColor.green
//
//        if viewType == .search {
//            setupSearchBar()
//        } else if viewType == .selection {
//            view.addSubview(navBar)
//        }
//    }
//
//
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        // to prevent weird blak line at the top of view while transforming to next view
//        navigationController?.view.setNeedsLayout()
//        navigationController?.view.layoutIfNeeded()
//    }
//
//    private func setupSearchBar() {
//        searchBar.searchTextField.isEnabled = false
//        navigationItem.titleView = searchBar
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(singleTap))
//        searchBar.addGestureRecognizer(tapGesture)
//    }
//
//    override func viewWillLayoutSubviews() {
//        print("viewWillLayoutSubviews normal")
//        if viewType == .selection {
//            print("viewWillLayoutSubviews selection")
//        super.viewWillLayoutSubviews()
//        let statusBarHeight = self.view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
//        navBar.frame = .init(x: 0, y: statusBarHeight, width: view.frame.width, height: 44)
//        }
//    }
//
//    @objc private func singleTap() {
//        let vc = TagSearchViewController()
//        navigationController?.pushViewController(vc, animated: true)
//    }
//
//    /// - Method:
//    ///     - Tips : addChild" and "didMove" method creates a parent-child relationship between the current view controller and another view controller that's gonna be child.
//    private func setupChildren() {
//
//        addChild(categorySearchVC)
//        addChild(officialAppSearchVC)
//        stackView.addArrangedSubview(categorySearchVC.view)
//        stackView.addArrangedSubview(officialAppSearchVC.view)
//        categorySearchVC.didMove(toParent: self)
//        officialAppSearchVC.didMove(toParent: self)
//
//        stackView.addSubview(headerLabel)
//
//        stackView.axis = .vertical
//        stackView.distribution = .equalSpacing
//
//        view.addSubview(scrollView)
//        scrollView.addSubview(contentView)
//        contentView.addSubview(stackView)
//
//        view.addSubview(addButton)
//    }
//
//
//    func setupViews(){
//        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        contentView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//
//        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
//        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//
//        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
//        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
//        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
//        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
//
//        stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
//        stackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
//        stackView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 94/100).isActive = true
//        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30).isActive = true
//        stackView.spacing = 30
//
//        headerLabel.anchor(top: categorySearchVC.view.bottomAnchor, leading: officialAppSearchVC.view.leadingAnchor, bottom: officialAppSearchVC.view.topAnchor, trailing: officialAppSearchVC.view.trailingAnchor, padding: .init(top: 30, left: 0, bottom: 0, right: 0))
//
//        addButton.anchor(top: nil, leading: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 16, right: 6))
//    }
//
//}



import UIKit

final class BaseSearchViewController: BaseScrollViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // to prevent weird blak line at the top of view while transforming to next view
        navigationController?.view.setNeedsLayout()
        navigationController?.view.layoutIfNeeded()
    }
    
    private func setupSearchBar() {
        searchBar.searchTextField.isEnabled = false
        navigationItem.titleView = searchBar
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(singleTap))
        searchBar.addGestureRecognizer(tapGesture)
    }
    
    @objc private func singleTap() {
        let vc = TagSearchViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func setupChildren() {
        super.setupChildren()
        view.addSubview(addButton)
    }
    
    override func setupViews() {
        super.setupViews()
        addButton.anchor(top: nil, leading: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 16, right: 6))
    }
}
