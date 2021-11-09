//
//  DropDownSearchSegmentedCell.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/08.
//

import UIKit

class DropDownSearchSegmentedCell: UITableViewCell {
    
    static let cellId = "DropDownSearchSegmentedCellId"
    
    let narrowDownLabel: UILabel = {
        let label = UILabel()
        label.text = "絞り込み"
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .center
        return label
    }()
    
    let items = ["全て", "募集中"]
    let items2 = ["全て", "プレミアムチームのみ"]
    let items3 = ["性別制限なし", "性別制限あり"]
    let items4 = ["年齢制限なし", "年齢制限あり"]
    
    lazy var segmentedControl1 = DropDownSearchSegmentedCell.createSegment(items: items)
    lazy var segmentedControl2 = DropDownSearchSegmentedCell.createSegment(items: items2)
    lazy var segmentedControl3 = DropDownSearchSegmentedCell.createSegment(items: items3)
    lazy var segmentedControl4 = DropDownSearchSegmentedCell.createSegment(items: items4)
    
    class func createSegment(items: [String]) -> UISegmentedControl {
        let control = UISegmentedControl(items: items)
        control.selectedSegmentIndex = 0
        control.layer.cornerRadius = 8
        control.layer.masksToBounds = true
        
        let color = UIColor.gray

        control.selectedSegmentTintColor = #colorLiteral(red: 0.9353960156, green: 0.2671836317, blue: 0.2663446367, alpha: 1)
        control.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        control.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: color], for: .normal)
        return control
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let stackView = UIStackView(arrangedSubviews: [
            narrowDownLabel ,segmentedControl1, segmentedControl2, segmentedControl3, segmentedControl4
        ])
        stackView.spacing = 10
        stackView.axis = .vertical
        
        addSubview(stackView)
        contentView.isUserInteractionEnabled = false
        stackView.fillSuperview(padding: .init(top: 10, left: 10, bottom: 10, right: 10))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
