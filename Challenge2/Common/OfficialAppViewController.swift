//
//  OfficialAppViewController.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/27.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources
import Kingfisher

class OfficialAppViewController: ViewController {
    
    struct OfficillAppSizeAndInset {
        fileprivate static let spacing: CGFloat = 10
        fileprivate static let cellHeight: CGFloat = 100
        fileprivate static let insetWidth: CGFloat = 16
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
        layout.itemSize = .init(
            width: view.frame.width / 3 - (OfficillAppSizeAndInset.insetWidth * 2),
            height: OfficillAppSizeAndInset.cellHeight
        )
        layout.minimumInteritemSpacing = OfficillAppSizeAndInset.spacing
        layout.sectionInset = .init(top: OfficillAppSizeAndInset.insetWidth, left: OfficillAppSizeAndInset.insetWidth, bottom: OfficillAppSizeAndInset.insetWidth, right: OfficillAppSizeAndInset.insetWidth)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.clipsToBounds = true
        collectionView.layer.cornerRadius = 12
        collectionView.isScrollEnabled = false
        collectionView.register(OfficialAppSearchCell.self, forCellWithReuseIdentifier: OfficialAppSearchCell.cellId)
        
        view.addSubview(collectionView)
        collectionView.fillSuperview()
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        let viewModel = OfficialAppViewModel(resourceAPI: ResourceAPI.resourceAPIShared)
        
        let input = OfficialAppViewModel.Input(viewWillAppearEvent: rx.viewWillAppear.asSignal().mapToVoid())
        let output = viewModel.transform(input: input)
        
        let dataSource = RxCollectionViewSectionedReloadDataSource<OfficialAppSearchSection> { dataSource, collectionView, indexPath, item in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OfficialAppSearchCell.cellId, for: indexPath) as! OfficialAppSearchCell
            cell.appLabel.text = item.name
            cell.appImage.kf.setImage(with: URL(string: item.artworkUrl100)!)
            return cell
        }
        
        output.officialAppSearchSections
            .drive(collectionView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
}

