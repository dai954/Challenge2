//
//  SampleTestTableViewController.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/11.
//

//import UIKit
//
//class SampleTestTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//
//    let tableView = UITableView()
//    let bottomView = BottomView()
//
//    override func viewDidLoad() {
//        navigationController?.hidesBarsOnSwipe = true
//        tableView.delegate = self
//        tableView.dataSource = self
//
//        view.addSubview(bottomView)
//        view.addSubview(tableView)
//        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: bottomView.topAnchor, trailing: view.trailingAnchor)
//        bottomView.anchor(top: nil, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, size: .init(width: 0, height: 150))
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 50
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
//        cell.textLabel?.text = "hello"
//        return cell
//    }
//
//
//}
//
//
//class SampleTestCollectionViewController: BaseListController, UICollectionViewDelegateFlowLayout {
//
//    let bottomView = BottomView()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        collectionView.backgroundColor = .lightGray
//
//        navigationController?.hidesBarsOnSwipe = true
//
//        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
//
//        view.addSubview(bottomView)
//        bottomView.anchor(top: nil, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, size: .init(width: 0, height: 150))
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 30
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
//        cell.backgroundColor = .blue
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return .init(width: view.frame.width, height: 180)
//    }
//}
