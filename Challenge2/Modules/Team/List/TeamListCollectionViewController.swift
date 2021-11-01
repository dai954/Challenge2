//
//  TeamListCollectionViewController.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/10/28.
//

import UIKit

class TeamListCollectionViewController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    private let teamListCell = "teamListCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = UIColor.primaryGray()
        collectionView.register(TeamListCollectionViewCell.self, forCellWithReuseIdentifier: teamListCell)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: teamListCell, for: indexPath) as! TeamListCollectionViewCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 20, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 10, left: 0, bottom: 10, right: 0)
    }
    
}
