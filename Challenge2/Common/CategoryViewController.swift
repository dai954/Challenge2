//
//  CategoryViewController.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/27.
//

import Foundation

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class CategoryViewController: ViewController {
    
    struct CategorySearchSizeAndInset {
        static let spacing: CGFloat = 10
        static let cellHeight: CGFloat = 70
        fileprivate static let insetWidth: CGFloat = 10
    }
    
    var collectionView: UICollectionView!
    
    var layout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.heightAnchor.constraint(equalToConstant: layout.collectionViewContentSize.height).isActive = true
        view.layoutIfNeeded()
        view.frame.size.height = layout.collectionViewContentSize.height
    }
    
    override func makeUI() {
        super.makeUI()
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
        view.addSubview(collectionView)
        collectionView.fillSuperview()
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        let viewModel = CategoryViewModel(resourceAPI: ResourceAPI.resourceAPIShared)
        
        let input = CategoryViewModel.Input(
            viewWillAppearEvent: rx.viewWillAppear.asSignal().mapToVoid()
        )
        let output = viewModel.transform(input: input)
        
        let dataSource = RxCollectionViewSectionedReloadDataSource<CategorySearchSection> { dataSource, collectionView, indexPath, item in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCategoryCell.cellId, for: indexPath) as! SearchCategoryCell
            cell.categoryLabel.text = item.title
            cell.categoryImage.image = item.image
            return cell
        } configureSupplementaryView: { dataSource, collectionView, supplementaryViewOfKind, indexPath in
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: supplementaryViewOfKind, withReuseIdentifier: CategorySearchFooterReusableView.footerReusableViewId, for: indexPath)
            return footer
        }
        
        output.categories
            .drive(collectionView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
    }
    
}
