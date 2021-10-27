//
//  CategorySearchViewController.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/10/26.
//

import UIKit

class CategorySearchViewController: BaseListController {
    
    fileprivate let cellId = "CategoryCell"
    fileprivate let footerCellId = "FooterCategoryCell"
    
    fileprivate let categoryResouces = CategoryResouce.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = UIColor.primaryGray()
        
        collectionView.register(SearchCategoryCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(CategorySearchFooterCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerCellId)
        
//        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        layout.sectionInset = UIEdgeInsets(top: 10.0, left: 0, bottom: 10.0, right: 0)
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
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerCellId, for: indexPath)
        
        return footer
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryResouces.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("cell", indexPath.item)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchCategoryCell
        
        let categoryResouces = CategoryResouce.allCases
        
        cell.categoryLabel.text = categoryResouces[indexPath.item].title
        return cell
    }
    
    
}

extension CategorySearchViewController: UICollectionViewDelegateFlowLayout {
    
    struct CategorySearchSizeAndInset {
        static let spacing: CGFloat = 10
        static let cellHeight: CGFloat = 70
        fileprivate static let insetWidth: CGFloat = 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 35)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width / 2 - CategorySearchSizeAndInset.spacing / 2, height: CategorySearchSizeAndInset.cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: CategorySearchSizeAndInset.insetWidth, left: 0, bottom: CategorySearchSizeAndInset.insetWidth, right: 0)
    }
}
