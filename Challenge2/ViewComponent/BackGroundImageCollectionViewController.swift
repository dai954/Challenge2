//
//  BackGroundImageCollectionView.swift
//  ActionSheetPickerViewDemo
//
//  Created by 石川大輔 on 2021/11/25.
//

import UIKit

class BackGroundImageCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var collectionView: UICollectionView!
    
    var imageData:[UIImage] = [#imageLiteral(resourceName: "backImage1"), #imageLiteral(resourceName: "backImage4"), #imageLiteral(resourceName: "backImage2"), #imageLiteral(resourceName: "backImage5"), #imageLiteral(resourceName: "backImage6"), #imageLiteral(resourceName: "backImage3"), #imageLiteral(resourceName: "backImage4"), #imageLiteral(resourceName: "backImage2"), #imageLiteral(resourceName: "backImage5"), #imageLiteral(resourceName: "backImage6"), #imageLiteral(resourceName: "backImage3")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: view.frame.width / 2 - 5, height: 50)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.contentInset = .init(top: 0, left: 0, bottom: 30, right: 0)
        collectionView.register(BackImageViewCell.self, forCellWithReuseIdentifier: BackImageViewCell.cellId)
        
        view.addSubview(collectionView)
        collectionView.fillSuperview()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BackImageViewCell.cellId, for: indexPath) as! BackImageViewCell
        cell.backgroundColor = .blue
        cell.backImageView.image = imageData[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("BackImageCell selected \(indexPath.item)")
    }
    
}


class BackImageViewCell: UICollectionViewCell {
    
    static let cellId = "ImageViewCellId"
    
    let backImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "backImage1")
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(backImageView)
        backImageView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
