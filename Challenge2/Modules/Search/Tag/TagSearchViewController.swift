//
//  TagSearchViewController.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/10/27.
//

//import UIKit
//
//class TagSearchViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
//
//    fileprivate let tagCellId = "tagCellId"
//    fileprivate let tagHeaderId = "tagHeaderId"
//
//    fileprivate let tagResource = TagResource.allCases
//
//    fileprivate let searchBar: UISearchBar = {
//        let sb = UISearchBar()
//        sb.textField?.backgroundColor = .white
//        sb.placeholder = "キーワード検索はここをタップ"
//        return sb
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        collectionView.backgroundColor = UIColor.primaryGray()
//
//        navigationItem.titleView = searchBar
//
//        collectionView.register(TagHeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: tagHeaderId)
//        collectionView.register(TagCollectionViewCell.self, forCellWithReuseIdentifier: tagCellId)
//        collectionView.contentInset = .init(top: 0, left: 10, bottom: 10, right: 10)
//
//    }
//
//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return tagResource.count
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return tagResource[section].tags.count
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: tagHeaderId, for: indexPath) as! TagHeaderReusableView
//        header.headerLabel.text = tagResource[indexPath.section].title
//
//        return header
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: tagCellId, for: indexPath) as! TagCollectionViewCell
//        let tags = tagResource[indexPath.section].tags
//        cell.tagLabel.text = tags[indexPath.item]
//
//        cell.layer.cornerRadius = 12
//        cell.backgroundColor = .white
//
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return .init(top: 0, left: 0, bottom: 16, right: 0)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return .init(width: view.frame.width, height: 30)
//    }
//
//
//
//}


import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class TagSearchViewController: UIViewController, UICollectionViewDelegate {

    var collectionView: UICollectionView!

    let diaposeBag = DisposeBag()

    var layout: LeftAlignedCollectionViewFlowLayout!
    
    fileprivate let searchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.textField?.backgroundColor = .white
        sb.placeholder = "キーワード検索はここをタップ"
        return sb
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.titleView = searchBar
        
        layout = LeftAlignedCollectionViewFlowLayout()
        layout.headerReferenceSize = .init(width: view.frame.width, height: 30)
        layout.sectionInset = .init(top: 0, left: 0, bottom: 16, right: 0)

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.contentInset = .init(top: 10, left: 10, bottom: 10, right: 10)
        collectionView.backgroundColor = UIColor.primaryGray()
        collectionView.register(TagCollectionViewCell.self, forCellWithReuseIdentifier: TagCollectionViewCell.cellId)
        collectionView.register(TagSearchHeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: TagSearchHeaderReusableView.headerReusableViewId)
        
        bindViewModel()
        
        view.addSubview(collectionView)
        collectionView.fillSuperview()
        
    }
    
    private func bindViewModel() {
        let viewModel = TagSearchViewModel(resourceAPI: ResourceAPI.resourceAPIShared)
        
        let input = TagSearchViewModel.Input(viewLayoutEvent: rx.viewWillAppear.mapToVoid())
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
            .bind(to: collectionView.rx.items(dataSource: dataSource))
            .disposed(by: diaposeBag)
        
    }

}
