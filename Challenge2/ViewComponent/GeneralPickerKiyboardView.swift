//
//  GeneralPickerKiyboardView.swift
//  ActionSheetPickerViewDemo
//
//  Created by 石川大輔 on 2021/11/25.
//

import UIKit

enum PickerKeyboardType {
    case normal
    case selectBackImage
}

protocol AddChildDlegate: AnyObject {
    func willAddChild(viewController: UIViewController, stackView: UIStackView)
}

class GeneralPickerKiyboardView: UIControl {

    weak var delegate: AddChildDlegate?
    var pickerKeyboardType: PickerKeyboardType = .normal
    var data: [[String]] = [[]]
    var titleLabelText = "年齢制限設定"
    var pickerDescription = "15日間行動のないメンバーは\nシステムにより自動的に退出させられます。"

    fileprivate var textStore: String = ""

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addTarget(self, action: #selector(GeneralPickerKiyboardView.didTap(sender:)), for: .touchUpInside)
    }
    
    convenience init(pickerKeyboardType: PickerKeyboardType, data: [[String]] = [["A", "B", "C"]]) {
        self.init(frame: .zero)
        self.pickerKeyboardType = pickerKeyboardType
        self.data = data
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func didTap(sender: GeneralPickerKiyboardView) {
        becomeFirstResponder()
    }

    @objc func didTapDone(sender: UIButton) {
        resignFirstResponder()
    }

    override var canBecomeFirstResponder: Bool {
        return true
    }

    override var inputView: UIView? {

        let titleLabel = UILabel()
        titleLabel.text = titleLabelText
        titleLabel.sizeToFit()

        let button = UIButton(type: .system)
        button.setTitle("決定", for: .normal)
        button.addTarget(self, action: #selector(GeneralPickerKiyboardView.didTapDone(sender:)), for: .touchUpInside)
        button.sizeToFit()
        button.tintColor = .red

        let topView = UIView()
        topView.backgroundColor = .white

        let overallview = UIView()

        switch pickerKeyboardType {
        case .normal:
            let pickerView = UIPickerView()
            pickerView.delegate = self
            let row = data[0].firstIndex(of: textStore) ?? -1
            pickerView.selectRow(row, inComponent: 0, animated: false)

            let attributedString = pickerDescription.lineSpaceAttributedString(space: 5)

            let pickerLabel = UILabel()
            pickerLabel.attributedText = attributedString
            pickerLabel.textAlignment = .center
            pickerLabel.font = .systemFont(ofSize: 12)
            pickerLabel.numberOfLines = 0
            pickerLabel.sizeToFit()

            topView.addSubview(titleLabel)
            topView.addSubview(button)
            titleLabel.centerInSuperview()
            button.anchor(top: topView.topAnchor, leading: nil, bottom: topView.bottomAnchor, trailing: topView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 10))

            let vStackView = UIStackView(arrangedSubviews: [topView, pickerView, pickerLabel, UIView()])
            vStackView.axis = .vertical
            vStackView.spacing = 20
            overallview.addSubview(vStackView)
            topView.constrainHeight(constant: 44)
            pickerView.constrainHeight(constant: 100)
            vStackView.fillSuperview()
            overallview.fillSuperview()
        case .selectBackImage:
            let backImageCollectionViewController = BackGroundImageCollectionViewController()
            
            topView.addSubview(titleLabel)
            topView.addSubview(button)
            titleLabel.centerInSuperview()
            button.anchor(top: topView.topAnchor, leading: nil, bottom: topView.bottomAnchor, trailing: topView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 10))

            let vStackView = UIStackView(arrangedSubviews: [topView])
            vStackView.axis = .vertical
            
            delegate?.willAddChild(viewController: backImageCollectionViewController, stackView: vStackView)

            overallview.addSubview(vStackView)
            topView.constrainHeight(constant: 44)
            vStackView.fillSuperview()
            overallview.fillSuperview()
        }
        
        return overallview
    }

}

extension GeneralPickerKiyboardView: UIPickerViewDelegate, UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data[component].count
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return data.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       return data[component][row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textStore = data[component][row]
        setNeedsDisplay()
    }
}
