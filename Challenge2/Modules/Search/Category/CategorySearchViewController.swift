//
//  CategorySearchViewController.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/10/26.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class CategorySearchViewController: ViewController {
    
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
        let viewModel = CategorySearchViewModel(resourceAPI: ResourceAPI.resourceAPIShared)
        
        let input = CategorySearchViewModel.Input(
            viewWillAppearEvent: rx.viewWillAppear.asSignal().mapToVoid(),
            selection: collectionView.rx.modelSelected(CategoryResouce.self).asDriver())
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
        
        output.categorySelected
            .drive(onNext: { [weak self] viewModel in
                let vc = TeamListTableViewController(viewModel: viewModel)
                vc.navigationItem.title = "【\(viewModel.keyword.value)】"
                self?.navigationController?.pushViewController(vc, animated: true)
            })
            .disposed(by: disposeBag)
    }
    
}
