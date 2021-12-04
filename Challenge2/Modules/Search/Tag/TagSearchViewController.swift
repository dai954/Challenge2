//
//  TagSearchViewController.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/10/27.
//


import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class TagSearchViewController: ViewController {

    var collectionView: UICollectionView!
    var layout: LeftAlignedCollectionViewFlowLayout!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.view.setNeedsLayout()
        navigationController?.view.layoutIfNeeded()
    }
    
    func addDissmissKeyboardTapGenture() {
        
        let tapGesture = UITapGestureRecognizer(
                    target: self,
            action: #selector(dismissKeyboard(_:)))
                tapGesture.cancelsTouchesInView = false
                view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        searchBar.endEditing(true)
        print("dismissKeyboard for tag")
    }
    
    override func makeUI() {
        super.makeUI()
        navigationItem.titleView = searchBar
        searchBar.becomeFirstResponder()
        addDissmissKeyboardTapGenture()
        
        layout = LeftAlignedCollectionViewFlowLayout()
        layout.headerReferenceSize = .init(width: view.frame.width, height: 30)
        layout.sectionInset = .init(top: 0, left: 0, bottom: 16, right: 0)

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.contentInset = .init(top: 10, left: 10, bottom: 10, right: 10)
        collectionView.backgroundColor = UIColor.primaryGray()
        collectionView.register(TagCollectionViewCell.self, forCellWithReuseIdentifier: TagCollectionViewCell.cellId)
        collectionView.register(TagSearchHeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: TagSearchHeaderReusableView.headerReusableViewId)
        
        view.addSubview(collectionView)
        collectionView.fillSuperview()
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        let viewModel = TagSearchViewModel(resourceAPI: ResourceAPI.resourceAPIShared)
        
        let input = TagSearchViewModel.Input(
            viewLWillAppearEvent: rx.viewWillAppear.asSignal().mapToVoid(),
            selection: collectionView.rx.modelSelected(String.self).asDriver(),
            searchWord: searchBar.rx.text.orEmpty.asDriver(),
            searchButtonClicked: searchBar.rx.searchButtonClicked.asSignal()
        )
        let output = viewModel.transform(input: input)
        let dataSource = RxCollectionViewSectionedReloadDataSource<TagSearchSection> { dataSource, collectionView, indexPath, item in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCollectionViewCell.cellId, for: indexPath) as! TagCollectionViewCell
            cell.tagLabel.text = item
            return cell
        } configureSupplementaryView: { dataSource, collectionView, supplementaryViewOfKind, indexPath in
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: supplementaryViewOfKind, withReuseIdentifier: TagSearchHeaderReusableView.headerReusableViewId, for: indexPath) as! TagSearchHeaderReusableView
            header.headerLabel.text = dataSource.sectionModels[indexPath.section].header
            return header
        }
        
        output.tags
            .drive(collectionView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        output.searchInvoked
            .drive(onNext: { [weak self] viewModel in
                let vc = TeamListTableViewController(viewModel: viewModel)
                vc.navigationItem.title = viewModel.keyword.value
                self?.navigationController?.pushViewController(vc, animated: true)
            }).disposed(by: disposeBag)
    }

}
