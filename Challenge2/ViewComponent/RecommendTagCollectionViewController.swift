//
//  RecommendTabCollectionViewController.swift
//  Challenge2TeamCreateDemo
//
//  Created by 石川大輔 on 2021/11/24.
//

import UIKit

class RecommendTagCollectionViewController: UIViewController, UICollectionViewDataSource {
    
    var collectionView: UICollectionView!
    var layout: UICollectionViewFlowLayout!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = .init(width: 50, height: 30)
        layout.minimumInteritemSpacing = 5
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.contentInset = .init(top: 0, left: 20, bottom: 0, right: 20)
        
        collectionView.register(RecommendTagCell.self, forCellWithReuseIdentifier: RecommendTagCell.cellId)
        
        view.addSubview(collectionView)
        collectionView.fillSuperview()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendTagCell.cellId, for: indexPath) as! RecommendTagCell
        
        if indexPath.item % 2 == 0 {
            cell.tagLabel.text = "#ダイエット"
        }
        if indexPath.item % 3 == 0 {
            cell.tagLabel.text = "#健康"
        }
        
        return cell
    }
    
}
