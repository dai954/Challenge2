//
//  BackGroundImageCollectionView.swift
//  ActionSheetPickerViewDemo
//
//  Created by 石川大輔 on 2021/11/25.
//

//import UIKit
//import RxSwift
//import RxCocoa
//import RxDataSources

//protocol BackImageDelegate: NSObject {
//    func didTapBackImage(image: UIImage)
//}
//
//class BackGroundImageCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
//
//    var collectionView: UICollectionView!
//
//    var imageData:[BackImageResource] = BackImageResource.allCases
//
//    weak var delegate: BackImageDelegate?
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        print("viewDidLoad original collectionView")
//        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = .init(width: view.frame.width / 2 - 5, height: 50)
//
//        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.dataSource = self
//        collectionView.delegate = self
//        collectionView.backgroundColor = .white
//        collectionView.contentInset = .init(top: 0, left: 0, bottom: 30, right: 0)
//        collectionView.register(BackImageViewCell.self, forCellWithReuseIdentifier: BackImageViewCell.cellId)
//
//        view.addSubview(collectionView)
//        collectionView.fillSuperview()
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return imageData.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BackImageViewCell.cellId, for: indexPath) as! BackImageViewCell
//        cell.backgroundColor = .blue
//        cell.backImageView.image = imageData[indexPath.item].backImage
//        return cell
//    }
//
//    var lastCellIndexPath: IndexPath?
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print("BackImageCell selected \(indexPath.item)")
//        let cell = collectionView.cellForItem(at: indexPath) as! BackImageViewCell
//        cell.whiteBlindView.backgroundColor = .clear
//        delegate?.didTapBackImage(image: imageData[indexPath.item].backImage)
//
//        if let lastCellIndexPath = lastCellIndexPath {
//            let lastCell = collectionView.cellForItem(at: lastCellIndexPath) as! BackImageViewCell
//            lastCell.whiteBlindView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
//        }
//        lastCellIndexPath = indexPath
//    }
//
//}

//class BackGroundImageCollectionViewController: ViewController {
//
//    var collectionView: UICollectionView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        print("viewDidLoad original")
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//        print("view will appear")
//    }
//    override func loadView() {
//        super.loadView()
//        print("loadVIew")
//    }
//
//    override func makeUI() {
//        super.makeUI()
//        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = .init(width: view.frame.width / 2 - 5, height: 50)
//
//        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.backgroundColor = .white
//        collectionView.contentInset = .init(top: 0, left: 0, bottom: 30, right: 0)
//        collectionView.register(BackImageViewCell.self, forCellWithReuseIdentifier: BackImageViewCell.cellId)
//
//        view.addSubview(collectionView)
//        collectionView.fillSuperview()
//    }
//
//    override func bindViewModel() {
//        super.bindViewModel()
//        let viewModel = SemiModalImageViewModel()
//
//        let input = SemiModalImageViewModel.Input(viewWillAppearEvent: rx.viewWillAppear.asSignal().mapToVoid())
//        let output = viewModel.transform(input: input)
//
//        let dataSource = RxCollectionViewSectionedReloadDataSource<BackGroundImageSection> { dataSource, collectionView, indexPath, backImageResource in
//
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BackImageViewCell.cellId, for: indexPath) as! BackImageViewCell
//            cell.backImageView.image = backImageResource.backImage
//            return cell
//        }
//
//        rx.viewDidLoad.subscribe(onNext: { a in
//            print("viewDidLoad called", a)
//        }).disposed(by: disposeBag)
//
//        rx.viewWillAppear.subscribe(onNext: { a in
//            print("viewWillAppear called", a)
//        }).disposed(by: disposeBag)
//
//        output.sections.drive(collectionView.rx.items(dataSource: dataSource)).disposed(by: disposeBag)
//    }
//}
//
//
//class BackImageViewCell: UICollectionViewCell {
//
//    static let cellId = "ImageViewCellId"
//
//    let backImageView: UIImageView = {
//        let iv = UIImageView()
//        iv.image = #imageLiteral(resourceName: "backImage1")
//        return iv
//    }()
//
//    let whiteBlindView: UIView = {
//        let view = UIView()
//        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
//        return view
//    }()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        addSubview(backImageView)
//        backImageView.addSubview(whiteBlindView)
//        backImageView.fillSuperview()
//        whiteBlindView.fillSuperview()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//}
