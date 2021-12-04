//
//  DetailScreenshotController.swift
//  Challenge
//
//  Created by 石川大輔 on 2021/07/30.
//

import RxSwift
import RxDataSources
import RxCocoa
import Kingfisher

class ScreenshotCollectionViewController: ViewController {

    var collectionView: UICollectionView!
    let viewModel = ScreenshotCollectionViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func makeUI() {
        super.makeUI()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: 150, height: 280)

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ScreenShotCell.self, forCellWithReuseIdentifier: ScreenShotCell.cellId)
        collectionView.backgroundColor = .white

        view.addSubview(collectionView)
        collectionView.fillSuperview()
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        let dataSource = RxCollectionViewSectionedReloadDataSource<ScreenshotSection> { dataSource, collectionView, indexPath, item in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ScreenShotCell.cellId, for: indexPath) as! ScreenShotCell
            cell.imageView.kf.setImage(with: URL(string: item))
            return cell
        }

        viewModel.screenshotSections.asDriver()
            .drive(collectionView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
    
}
