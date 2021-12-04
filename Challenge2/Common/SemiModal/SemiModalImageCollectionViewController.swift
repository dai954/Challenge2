//
//  File.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/12/01.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class SemiModalImageCollectionViewController: CustomSemiModalViewController {
    
    let layout = UICollectionViewFlowLayout()
    lazy var collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

    override var modalHeight: CGFloat {
        return 220
    }
    
    override func makeUI() {
        super.makeUI()
        
        layout.itemSize = .init(width: view.frame.width / 2 - 5, height: 50)
        collectionView.backgroundColor = .white
        collectionView.contentInset = .init(top: 0, left: 0, bottom: 30, right: 0)
        collectionView.register(BackImageViewCell.self, forCellWithReuseIdentifier: BackImageViewCell.cellId)

        contentView.addSubview(collectionView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.anchor(top: semiModalTitleBarView.bottomAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor)
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        let viewModel = SemiModalImageViewModel()

        let input = SemiModalImageViewModel.Input(viewWillAppearEvent: rx.viewWillAppear.asSignal().mapToVoid(),
                                                  itemSelectedEvent: collectionView.rx.itemSelected.asDriver()
        )
        let output = viewModel.transform(input: input)

        let dataSource = RxCollectionViewSectionedReloadDataSource<BackGroundImageSection> { dataSource, collectionView, indexPath, backImageResource in

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BackImageViewCell.cellId, for: indexPath) as! BackImageViewCell
            cell.backImageView.image = backImageResource.backImage
            return cell
        }
        
        output.sections.drive(collectionView.rx.items(dataSource: dataSource)).disposed(by: disposeBag)
        
        output.itemSelectedTrigger.drive(onNext: { [weak self] indexPath in
            let cells = self?.collectionView.visibleCells
            cells?.forEach { cell in
                let cell = cell as! BackImageViewCell
                cell.whiteBlindView.isHidden = false
            }
            let cell = self?.collectionView.cellForItem(at: indexPath) as! BackImageViewCell
            cell.whiteBlindView.isHidden = true
        }).disposed(by: disposeBag)
        
    }
    
}

class BackImageViewCell: UICollectionViewCell {

    static let cellId = "ImageViewCellId"

    let backImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "backImage1")
        return iv
    }()

    let whiteBlindView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(backImageView)
        backImageView.addSubview(whiteBlindView)
        backImageView.fillSuperview()
        whiteBlindView.fillSuperview()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

