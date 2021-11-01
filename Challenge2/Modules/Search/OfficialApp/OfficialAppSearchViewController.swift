//
//  OfficialAppSearchViewController.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/10/26.
//

import UIKit

class OfficialAppSearchViewController: BaseListController {
    
    fileprivate let officialAppCellId = "officialAppCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.clipsToBounds = true
        collectionView.layer.cornerRadius = 12
        
        collectionView.register(OfficialAppSearchCell.self, forCellWithReuseIdentifier: officialAppCellId)
        
    }
    
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()

            // Set collectionView height to content size height.
            if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                collectionView.heightAnchor.constraint(equalToConstant: layout.collectionViewContentSize.height).isActive = true
                view.layoutIfNeeded()
                view.frame.size.height = layout.collectionViewContentSize.height
            }
        }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 14
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: officialAppCellId, for: indexPath) as! OfficialAppSearchCell
        cell.backgroundColor = .red
        return cell
    }
    
}

extension OfficialAppSearchViewController: UICollectionViewDelegateFlowLayout {
    struct OfficillAppSizeAndInset {
        fileprivate static let spacing: CGFloat = 10
        fileprivate static let cellHeight: CGFloat = 100
        fileprivate static let insetWidth: CGFloat = 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.frame.width / 3 - (OfficillAppSizeAndInset.insetWidth * 2)
        return .init(width: width, height: OfficillAppSizeAndInset.cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return OfficillAppSizeAndInset.spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: OfficillAppSizeAndInset.insetWidth, left: OfficillAppSizeAndInset.insetWidth, bottom: OfficillAppSizeAndInset.insetWidth, right: OfficillAppSizeAndInset.insetWidth)
    }
}
