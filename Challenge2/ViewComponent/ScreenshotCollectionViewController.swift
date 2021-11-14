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

//class ScreenshotCollectionViewController: BaseListController, UICollectionViewDelegateFlowLayout {
//
//    fileprivate let cellId = "cellId"
//
//    override func viewDidLoad() {
//        print("viewcollectionview controller", view.frame.height)
//        super.viewDidLoad()
//        collectionView.backgroundColor = .white
//        if let layout = self.collectionViewLayout as? UICollectionViewFlowLayout {
//            layout.scrollDirection = .horizontal
//        }
//        collectionView.register(ScreenShotCell.self, forCellWithReuseIdentifier: cellId)
//    }
//
//    class ScreenShotCell: UICollectionViewCell {
//        let imageView = UIImageView()
//
//        override init(frame: CGRect) {
//            super.init(frame: frame)
//            imageView.backgroundColor = .green
//            imageView.clipsToBounds = true
//            imageView.layer.borderWidth = 0.5
//            imageView.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
//            imageView.contentMode = .scaleAspectFill
//            addSubview(imageView)
//            imageView.fillSuperview()
//        }
//
//        required init?(coder: NSCoder) {
//            fatalError("init(coder:) has not been implemented")
//        }
//
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 5
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ScreenShotCell
////        cell.imageView.kf.setImage(with: URL(string: screenshotUrls?[indexPath.item] ?? ""))
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        print("view.frame.height in collectionview controller", view.frame.height)
//        return .init(width: 150, height: view.frame.height)
//    }
//
//}


class ScreenshotCollectionViewController: UIViewController {

    let disposeBag = DisposeBag()
    var collectionView: UICollectionView!
    let viewModel = ScreenshotCollectionViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: 150, height: 280)

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ScreenShotCell.self, forCellWithReuseIdentifier: ScreenShotCell.cellId)
        collectionView.backgroundColor = .white

        view.addSubview(collectionView)
        collectionView.fillSuperview()

        let dataSource = RxCollectionViewSectionedReloadDataSource<ScreenshotSection> { dataSource, collectionView, indexPath, item in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ScreenShotCell.cellId, for: indexPath) as! ScreenShotCell
            cell.imageView.kf.setImage(with: URL(string: item))
            return cell
        }

        viewModel.screenshotSections.asObservable()
            .bind(to: collectionView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)

    }
    
}
