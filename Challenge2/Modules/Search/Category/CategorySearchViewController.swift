//
//  CategorySearchViewController.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/10/26.
//

//import UIKit
//
//class CategorySearchViewController: BaseListController {
//
//    fileprivate let cellId = "CategoryCell"
//    fileprivate let footerCellId = "FooterCategoryCell"
//
//    fileprivate let categoryResouces = CategoryResouce.allCases
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        collectionView.backgroundColor = UIColor.primaryGray()
//
//        collectionView.register(SearchCategoryCell.self, forCellWithReuseIdentifier: cellId)
//        collectionView.register(CategorySearchFooterCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerCellId)
//
////        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
////        layout.sectionInset = UIEdgeInsets(top: 10.0, left: 0, bottom: 10.0, right: 0)
//    }
//
//    override func viewDidLayoutSubviews() {
//            super.viewDidLayoutSubviews()
//
//            // Set collectionView height to content size height.
//            if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//                collectionView.heightAnchor.constraint(equalToConstant: layout.collectionViewContentSize.height).isActive = true
//                view.layoutIfNeeded()
//                view.frame.size.height = layout.collectionViewContentSize.height
//            }
//        }
//
//
//    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerCellId, for: indexPath)
//
//        return footer
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return categoryResouces.count
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print("cell", indexPath.item)
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchCategoryCell
//
//        let categoryResouces = CategoryResouce.allCases
//
//        cell.categoryLabel.text = categoryResouces[indexPath.item].title
//        return cell
//    }
//
//
//}
//
//extension CategorySearchViewController: UICollectionViewDelegateFlowLayout {
//
//    struct CategorySearchSizeAndInset {
//        static let spacing: CGFloat = 10
//        static let cellHeight: CGFloat = 70
//        fileprivate static let insetWidth: CGFloat = 10
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
//        return .init(width: view.frame.width, height: 35)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return .init(width: view.frame.width / 2 - CategorySearchSizeAndInset.spacing / 2, height: CategorySearchSizeAndInset.cellHeight)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return .init(top: CategorySearchSizeAndInset.insetWidth, left: 0, bottom: CategorySearchSizeAndInset.insetWidth, right: 0)
//    }
//}

//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//
//        // Set collectionView height to content size height.
//        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//            collectionView.heightAnchor.constraint(equalToConstant: layout.collectionViewContentSize.height).isActive = true
//            view.layoutIfNeeded()
//            view.frame.size.height = layout.collectionViewContentSize.height
//        }
//    }

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class CategorySearchViewController: UIViewController {
    
    struct CategorySearchSizeAndInset {
        static let spacing: CGFloat = 10
        static let cellHeight: CGFloat = 70
        fileprivate static let insetWidth: CGFloat = 10
    }
    
    var collectionView: UICollectionView!
    
    let disposeBag = DisposeBag()
    
    var layout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = .init(width: view.frame.width / 2 - CategorySearchSizeAndInset.spacing * 2, height: CategorySearchSizeAndInset.cellHeight)
        layout.minimumInteritemSpacing = CategorySearchSizeAndInset.spacing
        layout.footerReferenceSize = .init(width: view.frame.width, height: 35)
        layout.sectionInset = .init(top: CategorySearchSizeAndInset.insetWidth, left: 0, bottom: CategorySearchSizeAndInset.insetWidth, right: 0)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.primaryGray()
        collectionView.isScrollEnabled = false
        collectionView.register(SearchCategoryCell.self, forCellWithReuseIdentifier: SearchCategoryCell.cellId)
        collectionView.register(CategorySearchFooterReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: CategorySearchFooterReusableView.footerReusableViewId)

        bindViewModel()
        
        view.addSubview(collectionView)
        collectionView.fillSuperview()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        collectionView.heightAnchor.constraint(equalToConstant: layout.collectionViewContentSize.height).isActive = true
        view.layoutIfNeeded()
        view.frame.size.height = layout.collectionViewContentSize.height
        
    }
    
    private func bindViewModel() {
        let viewModel = CategorySearchViewModel(resourceAPI: ResourceAPI.resourceAPIShared)
        
        let input = CategorySearchViewModel.Input(viewLayoutEvent: rx.viewWillAppear.mapToVoid())
        let output = viewModel.transform(input: input)
        
        let dataSource = RxCollectionViewSectionedReloadDataSource<CategorySearchSection> { dataSource, collectionView, indexPath, item in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCategoryCell.cellId, for: indexPath) as! SearchCategoryCell
            cell.categoryLabel.text = item.title
            return cell
        } configureSupplementaryView: { dataSource, collectionView, supplementaryViewOfKind, indexPath in
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: supplementaryViewOfKind, withReuseIdentifier: CategorySearchFooterReusableView.footerReusableViewId, for: indexPath)
            return footer
        }
        output.categories
            .bind(to: collectionView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
    
}
